import 'dart:async';
import 'dart:math' as math1;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ar_flutter_plugin_updated/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin_updated/datatypes/node_types.dart';
import 'package:ar_flutter_plugin_updated/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin_updated/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin_updated/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin_updated/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin_updated/models/ar_hittest_result.dart';
import 'package:ar_flutter_plugin_updated/models/ar_node.dart';
import 'package:ar_flutter_plugin_updated/widgets/ar_view.dart';
import 'package:vector_math/vector_math_64.dart' as math;
import 'package:ar_flutter_plugin_updated/models/ar_anchor.dart';
import 'package:sensors_plus/sensors_plus.dart';

import '../Cubit/area_measurement_cubit.dart';
import '../Cubit/area_measurement_state.dart';
import '../components/area_instructions_dialog.dart';
import '../components/stability_indicator.dart';
import '../components/measurement_controls.dart';
import '../components/polygon_overlay.dart';

class AreaMeasurementScreen extends StatefulWidget {
  const AreaMeasurementScreen({super.key});

  @override
  State<AreaMeasurementScreen> createState() => _AreaMeasurementScreenState();
}

class _AreaMeasurementScreenState extends State<AreaMeasurementScreen> {
  late ARSessionManager arSessionManager;
  late ARObjectManager arObjectManager;
  late ARAnchorManager arAnchorManager;
  List<ARNode> addedNodes = [];
  List<ARNode> lineNodes = [];
  StreamSubscription ? _accelerometerSubscription;

  @override
  void initState() {
    super.initState();
    // Start monitoring phone stability via accelerometer
    _startStabilityMonitoring();
  }

  void _startStabilityMonitoring() {
    _accelerometerSubscription = accelerometerEventStream().listen((AccelerometerEvent event) {
      // Calculate magnitude of acceleration
      final double magnitude = math1.sqrt(
          event.x * event.x +
              event.y * event.y +
              event.z * event.z
      );

      // Phone is stable if acceleration is close to gravitational constant
      // (9.8 m/s² ± small tolerance for minor movements)
      final bool isStable = (magnitude > 9.5 && magnitude < 10.1);

      context.read<AreaMeasurementCubit>().updateStabilityStatus(isStable);
    });
  }

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AreaMeasurementCubit, AreaMeasurementState>(
      listener: (context, state) {
        if (state.showError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              duration: const Duration(seconds: 2),
              action: SnackBarAction(
                label: "حسناً",
                onPressed: () {
                  context.read<AreaMeasurementCubit>().dismissError();
                },
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("قياس المساحة"),
            actions: [
              IconButton(
                icon: const Icon(Icons.info_outline),
                onPressed: () => _showInstructions(context),
              ),
            ],
          ),
          body: Stack(
            children: [
              // AR View
              ARView(onARViewCreated: _onARViewCreated),

              // Polygon Overlay
              if (state.points.length >= 3)
                PolygonOverlay(points: state.points),

              // Instruction text
              Positioned(
                top: 20,
                left: 20,
                right: 20,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    state.instructionText,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              // Stability indicator
              Positioned(
                top: 90,
                left: 20,
                right: 20,
                child: StabilityIndicator(isStable: state.isPhoneStable),
              ),

              // Area display
              Positioned(
                bottom: 50,
                left: 20,
                right: 20,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    state.isMeasuringSmallArea
                        ? "المساحة: ${state.area.toStringAsFixed(2)} سم²"
                        : "المساحة: ${state.area.toStringAsFixed(2)} قدم²",
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              // Controls
              Positioned(
                bottom: 120,
                left: 0,
                right: 0,
                child: MeasurementControls(
                  onUndo: () => _undoLastPoint(context),
                  onClear: () => _clearAllPoints(context),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showInstructions(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AreaInstructionsDialog(),
    );
  }

  void _onARViewCreated(
      ARSessionManager sessionManager,
      ARObjectManager objectManager,
      ARAnchorManager anchorManager,
      ARLocationManager locationManager,
      ) {
    arSessionManager = sessionManager;
    arObjectManager = objectManager;
    arAnchorManager = anchorManager;

    arSessionManager.onInitialize(
      showAnimatedGuide: false,
      showFeaturePoints: true,
      showPlanes: true,
      customPlaneTexturePath: null,
      showWorldOrigin: false,
      handleTaps: true,
      handlePans: false,
      handleRotation: false,
    );

    arSessionManager.onPlaneOrPointTap = _onPlaneTapped;
  }

  Future<void> _onPlaneTapped(List<ARHitTestResult> hits) async {
    if (hits.isEmpty) return;

    final hit = hits.first;
    final position = math.Vector3(
      hit.worldTransform[12], // X
      hit.worldTransform[13], // Y
      hit.worldTransform[14], // Z
    );

    // Add point to state via cubit
    context.read<AreaMeasurementCubit>().addPoint(position);

    // Create AR node for the point
    final anchor = ARPlaneAnchor(transformation: hit.worldTransform);
    final bool? anchorId = await arAnchorManager.addAnchor(anchor);
    if (anchorId == null) return;

    final node = ARNode(
      type: NodeType.webGLB,
      uri: "https://raw.githubusercontent.com/felopatersameh/Models3DCreator/main/point.glb",
      position: position,
      scale: math.Vector3.all(.4),
    );

    await arObjectManager.addNode(node);
    addedNodes.add(node);

    // Add line from previous point if applicable
    final state = context.read<AreaMeasurementCubit>().state;
    if (state.points.length >= 2) {
      // await _addLineBetweenLastPoints(state.points);

      // Complete the polygon if we have 3+ points
      if (state.points.length >= 3) {
        await _updatePolygonLines(state.points);
      }
    }
  }

  Future<void> _addLineBetweenLastPoints(List<math.Vector3> points) async {
    if (points.length < 2) return;

    final p1 = points[points.length - 2];
    final p2 = points[points.length - 1];

    final midPoint = math.Vector3(
      (p1.x + p2.x) / 2,
      (p1.y + p2.y) / 2,
      (p1.z + p2.z) / 2,
    );

    final direction = p2 - p1;
    final length = direction.length;
    direction.normalize();

    // Calculate angle for rotation (around Y axis)
    final angle = math1.atan2(direction.z, direction.x);

    // Create line node
    final lineNode = ARNode(
      type: NodeType.webGLB,
      uri: "https://raw.githubusercontent.com/felopatersameh/Models3DCreator/main/line.glb",
      position: midPoint,
      scale: math.Vector3(0.02, 0.02, length),
      rotation: math.Vector4(0, 1, 0, angle),
    );

    await arObjectManager.addNode(lineNode);
    lineNodes.add(lineNode);

    // Add distance label
    // In a real implementation, you would add a text node here
    // showing the distance between points
  }

  Future<void> _updatePolygonLines(List<math.Vector3> points) async {
    if (points.length < 3) return;

    // Complete the polygon by connecting last point to first
    final p1 = points.last;
    final p2 = points.first;

    final midPoint = math.Vector3(
      (p1.x + p2.x) / 2,
      (p1.y + p2.y) / 2,
      (p1.z + p2.z) / 2,
    );

    final direction = p2 - p1;
    final length = direction.length;
    direction.normalize();

    final angle = math1.atan2(direction.z, direction.x);

    // Create closing line node
    final lineNode = ARNode(
      type: NodeType.webGLB,
      uri: "https://raw.githubusercontent.com/felopatersameh/Models3DCreator/main/line.glb",
      position: midPoint,
      scale: math.Vector3(0.02, 0.02, length),
      rotation: math.Vector4(0, 1, 0, angle),
    );

    await arObjectManager.addNode(lineNode);
    lineNodes.add(lineNode);
  }

  void _undoLastPoint(BuildContext context) async {
    final state = context.read<AreaMeasurementCubit>().state;
    if (state.points.isEmpty) return;

    // Remove last point from state
    context.read<AreaMeasurementCubit>().removeLastPoint();

    // Remove corresponding AR nodes
    if (addedNodes.isNotEmpty) {
      final lastNode = addedNodes.removeLast();
      await arObjectManager.removeNode(lastNode);
    }

    // Remove line nodes if any
    if (lineNodes.isNotEmpty) {
      final lastLineNode = lineNodes.removeLast();
      await arObjectManager.removeNode(lastLineNode);

      // If we have a polygon and removed one point, also remove the closing line
      if (state.points.length >= 4 && lineNodes.isNotEmpty) {
        final closingLineNode = lineNodes.removeLast();
        await arObjectManager.removeNode(closingLineNode);
      }
    }
  }

  void _clearAllPoints(BuildContext context) async {
    // Remove all AR nodes
    for (final node in addedNodes) {
      await arObjectManager.removeNode(node);
    }

    for (final lineNode in lineNodes) {
      await arObjectManager.removeNode(lineNode);
    }

    addedNodes.clear();
    lineNodes.clear();

    // Reset state
    context.read<AreaMeasurementCubit>().clearAllPoints();
  }

  @override
  void dispose() {
    arSessionManager.dispose();
    _accelerometerSubscription?.cancel();
    super.dispose();
  }
}
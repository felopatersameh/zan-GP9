import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class Screen3D extends StatelessWidget {

  const Screen3D({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Model Viewer')),
      body: Stack(
        children: [
          
          ModelViewer(
            src: 'https://raw.githubusercontent.com/felopatersameh/Models3DCreator/main/tripo_pbr_model_18f50e08-3c6b-4ea6-831f-476e0b43f4f0.glb',
            alt: '3D product preview',
            ar: true,
            arModes: ['scene-viewer', 'webxr', 'quick-look'],

            // 💡 تحكم المستخدم:
            cameraControls: true,
            disableZoom: false, // خليه يقدر يعمل زووم
            disablePan: false,  // يقدر يحرك الموديل

            // 🚫 وقف الدوران التلقائي:
            autoRotate: true,

            // 🎥 الكاميرا تبدأ من زاوية مريحة:
            // cameraOrbit: "0deg 75deg 2.5m",
            fieldOfView: "65deg",
            arScale: ArScale.fixed,
            touchAction:TouchAction.panX ,
            // ☀️ تحسين الإضاءة:
            environmentImage: "https://modelviewer.dev/shared-assets/environments/spruit_sunrise_1k_HDR.hdr",
            exposure: 1.2, // ضوء مناسب، تقدر تزود أو تقلل حسب الموديل
            shadowIntensity: 0.9, // ظل واضح
            shadowSoftness: 0.7,  // ظل ناعم

          ),

        ],
      ),
    );
  }
}

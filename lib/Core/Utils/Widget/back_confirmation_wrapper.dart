import 'package:flutter/material.dart';
import 'package:zan/main.dart';
import '../Widget/Dialogs/dialog_examples.dart';

/// A widget that shows a confirmation dialog when the user tries to navigate back.
///
/// Wrap any screen with this widget to show a confirmation dialog when the user
/// presses the back button or performs a back gesture.
///
/// Example:
/// ```dart
/// BackConfirmationWrapper(
///   child: YourScreen(),
///   showConfirmation: true, // Set to false to disable the confirmation dialog
///   onWillPop: () {
///     // Optional: Add custom logic before showing the dialog
///     // Return true to show the dialog, false to handle it yourself
///     return true;
///   },
/// )
/// ```
class BackConfirmationWrapper extends StatelessWidget {
  /// The child widget to display.
  final Widget child;

  /// Whether to show the confirmation dialog when the user tries to navigate back.
  /// Set to false to disable the confirmation dialog.
  final bool showConfirmation;

  /// Optional callback that is called when the user tries to navigate back.
  /// Return true to show the confirmation dialog, false to handle it yourself.
  final bool Function()? onWillPop;

  const BackConfirmationWrapper({
    super.key,
    required this.child,
    this.showConfirmation = true,
    this.onWillPop,
  });

  @override
  Widget build(BuildContext context) {
    // Use PopScope for Flutter 3.7+ or WillPopScope for older versions
    return PopScope(
      canPop: false, // Prevent automatic popping
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return; // If already popped, do nothing

        // If confirmation is disabled or onWillPop returns false, pop without confirmation
        if (!showConfirmation || (onWillPop != null && !onWillPop!())) {
          kNavigationService.goBack();
          return;
        }

        // Show confirmation dialog
        final shouldPop =
            await DialogExamples.showBackConfirmationDialog(context);

        // Pop if user confirmed
        if (shouldPop) {
          kNavigationService.goBack();
        }
      },
      child: child,
    );
  }
}

/// A simpler version that uses WillPopScope for compatibility with older Flutter versions
class BackConfirmationWrapperLegacy extends StatelessWidget {
  final Widget child;
  final bool showConfirmation;
  final bool Function()? onWillPop;

  const BackConfirmationWrapperLegacy({
    super.key,
    required this.child,
    this.showConfirmation = true,
    this.onWillPop,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // If confirmation is disabled or onWillPop returns false, pop without confirmation
        if (!showConfirmation || (onWillPop != null && !onWillPop!())) {
          return true;
        }

        // Show confirmation dialog
        final shouldPop =
            await DialogExamples.showBackConfirmationDialog(context);

        // Return the result (true to pop, false to stay)
        return shouldPop;
      },
      child: child,
    );
  }
}

/// Extension method to easily wrap a widget with back confirmation
extension BackConfirmationExtension on Widget {
  /// Wraps this widget with a BackConfirmationWrapper
  Widget withBackConfirmation({
    bool showConfirmation = true,
    bool Function()? onWillPop,
  }) {
    return BackConfirmationWrapper(
      showConfirmation: showConfirmation,
      onWillPop: onWillPop,
      child: this,
    );
  }
}

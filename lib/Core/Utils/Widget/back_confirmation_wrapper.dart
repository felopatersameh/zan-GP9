import 'package:flutter/material.dart';
import '../../../main.dart';
import '../Widget/Dialogs/dialog_examples.dart';

class BackConfirmationWrapper extends StatelessWidget {
  final Widget child;
  final bool showConfirmation;
  final bool Function()? onWillPop;

  const BackConfirmationWrapper({
    super.key,
    required this.child,
    this.showConfirmation = true,
    this.onWillPop,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, 
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return; 

        if (!showConfirmation || (onWillPop != null && !onWillPop!())) {
          kNavigationService.goBack();
          return;
        }

        final shouldPop =
            await DialogExamples.showBackConfirmationDialog(context);

        if (shouldPop) {
          kNavigationService.goBack();
        }
      },
      child: child,
    );
  }
}

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
        if (!showConfirmation || (onWillPop != null && !onWillPop!())) {
          return true;
        }

        final shouldPop =
            await DialogExamples.showBackConfirmationDialog(context);

        return shouldPop;
      },
      child: child,
    );
  }
}

extension BackConfirmationExtension on Widget {
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

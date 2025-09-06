import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../main.dart';
import '../../../../Features/App/User/presentation/Cubit/user_cubit.dart';
import '../../../Utils/Extensions/localizations_extension.dart';
import 'custom_dialog.dart';

class DialogExamples {
  static Future<void> showLogoutConfirmationDialog(BuildContext context) async {
    final local = context.local;
    final result = await showConfirmationDialog(
      context: context,
      title: local.Logout,
      content: local.logout_confirmation_message,
      confirmText: local.Logout,
      cancelText: local.cancel,
    );

    if (result == true) {
      if(!context.mounted) return;

      context.read<UserCubit>().logout();
    }
  }

  static Future<void> showDeleteItemConfirmationDialog(
    BuildContext context, {
    required String itemName,
    required VoidCallback onConfirm,
  }) async {
    final local = context.local;
    final result = await showConfirmationDialog(
      context: context,
      title: local.delete_item_confirmation,
      content:
          '${local.delete_item_confirmation_message.characters.getRange(0, (local.delete_item_confirmation_message).length - 1)}\n "$itemName" ${(local.delete_item_confirmation_message).characters.last}',
      confirmText: local.delete,
      cancelText: local.cancel,
      // icon: AppCi,
    );

    if (result == true) {
      onConfirm();
    }
  }

  static Future<void> showDeleteAllItemsConfirmationDialog(
    BuildContext context, {
    required VoidCallback onConfirm,
  }) async {
    final local = context.local;
    final result = await showConfirmationDialog(
      context: context,
      title: local.delete_all_item_confirmation,
      content: local.delete_all_item_confirmation_message,
      confirmText: local.delete,
      cancelText: local.cancel,
    );

    if (result == true) {
      onConfirm();
    }
  }

  static Future<void> showOrderSubmitConfirmationDialog(
    BuildContext context, {
    required VoidCallback onConfirm,
  }) async {
    final local = context.local;
    final result = await showConfirmationDialog(
      context: context,
      title: local.submit_order_confirmation,
      content: local.submit_order_confirmation_message,
      confirmText: local.Submit,
      cancelText: local.cancel,
    );

    if (result == true) {
      
      onConfirm();
    }
  }

  static Future<void> showSaveUserInfoConfirmationDialog(
    BuildContext context, {
    required VoidCallback onConfirm,
  }) async {
    final local = context.local;
    final result = await showConfirmationDialog(
      context: context,
      title: local.save_info_confirmation,
      content: local.save_info_confirmation_message,
      confirmText: local.Save,
      cancelText: local.cancel,
    );

    if (result == true) {
      onConfirm();
    }
  }

  static Future<bool> showBackConfirmationDialog(BuildContext context) async {
    final local = context.local;
    final result = await showConfirmationDialog(
      context: context,
      title: local.back_confirmation,
      content: local.back_confirmation_message,
      confirmText: local.leave,
      cancelText: local.stay,
    );

    return result == true;
  }

  /// Example of showing a success dialog after an operation completes
  static Future<void> showOperationSuccessDialog(
    BuildContext context, {
    required String title,
    required String message,
  }) async {
    await showSuccessDialog(
      context: context,
      title: title,
      content: message,
    
    );
  }

  /// Example of showing an error dialog when an operation fails
  static Future<void> showOperationErrorDialog(
    BuildContext context, {
    required String title,
    required String message,
  }) async {
    await showErrorDialog(
      context: context,
      title: title,
      content: message,
    );
  }

  /// Example of showing a warning dialog
  static Future<void> showWarningMessageDialog(
    BuildContext context, {
    required String title,
    required String message,
  }) async {
    await showWarningDialog(
      context: context,
      title: title,
      content: message,
    );
  }

  /// Example of showing a loading dialog during an async operation
  static Future<T> showLoadingDialogDuring<T>(
    BuildContext context, {
    required Future<T> Function() asyncOperation,
  }) async {
    // Show loading dialog
    showLoadingDialog(context: context,);

    try {
      // Perform the async operation
      final result = await asyncOperation();

      // Close the loading dialog
      kNavigationService.goBack();

      return result;
    } catch (e) {
      // Close the loading dialog
      kNavigationService.goBack();

      // Show error dialog
      // await showErrorDialog(
      //   context: context,
      //   title: 'Error',
      //   content: e.toString(),
      // );

      rethrow;
    }
  }
}

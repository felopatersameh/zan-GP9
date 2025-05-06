// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../Resources/app_colors.dart';
// import '../../../Resources/app_fonts.dart';
// import '../../../../Features/Global/Authentication/presentation/components/build_social_login_button.dart';
// import 'dialog_examples.dart';

// /// A test page to demonstrate the custom dialogs
// class DialogTestPage extends StatelessWidget {
//   const DialogTestPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dialog Examples'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.r),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               _buildSectionTitle('Confirmation Dialogs'),
//               SizedBox(height: 16.h),
//               _buildDialogButton(
//                 context: context,
//                 title: 'Logout Confirmation',
//                 onPressed: () => DialogExamples.showLogoutConfirmationDialog(context),
//               ),
//               SizedBox(height: 8.h),
//               _buildDialogButton(
//                 context: context,
//                 title: 'Delete Item Confirmation',
//                 onPressed: () => DialogExamples.showDeleteItemConfirmationDialog(
//                   context,
//                   itemName: 'Sample Item',
//                   onConfirm: () {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text('Item deleted')),
//                     );
//                   },
//                 ),
//               ),
//               SizedBox(height: 8.h),
//               _buildDialogButton(
//                 context: context,
//                 title: 'Submit Order Confirmation',
//                 onPressed: () => DialogExamples.showOrderSubmitConfirmationDialog(
//                   context,
//                   onConfirm: () {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text('Order submitted')),
//                     );
//                   },
//                 ),
//               ),
//               SizedBox(height: 8.h),
//               _buildDialogButton(
//                 context: context,
//                 title: 'Save User Info Confirmation',
//                 onPressed: () => DialogExamples.showSaveUserInfoConfirmationDialog(
//                   context,
//                   onConfirm: () {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text('User info saved')),
//                     );
//                   },
//                 ),
//               ),
//               SizedBox(height: 8.h),
//               _buildDialogButton(
//                 context: context,
//                 title: 'Back Confirmation',
//                 onPressed: () async {
//                   final shouldNavigateBack = await DialogExamples.showBackConfirmationDialog(context);
//                   if (shouldNavigateBack) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text('Navigating back')),
//                     );
//                   }
//                 },
//               ),
              
//               SizedBox(height: 24.h),
//               _buildSectionTitle('Status Dialogs'),
//               SizedBox(height: 16.h),
//               _buildDialogButton(
//                 context: context,
//                 title: 'Success Dialog',
//                 onPressed: () => DialogExamples.showOperationSuccessDialog(
//                   context,
//                   title: 'Success',
//                   message: 'Operation completed successfully!',
//                 ),
//                 color: AppColors.success,
//               ),
//               SizedBox(height: 8.h),
//               _buildDialogButton(
//                 context: context,
//                 title: 'Error Dialog',
//                 onPressed: () => DialogExamples.showOperationErrorDialog(
//                   context,
//                   title: 'Error',
//                   message: 'Something went wrong. Please try again.',
//                 ),
//                 color: AppColors.error,
//               ),
//               SizedBox(height: 8.h),
//               _buildDialogButton(
//                 context: context,
//                 title: 'Warning Dialog',
//                 onPressed: () => DialogExamples.showWarningMessageDialog(
//                   context,
//                   title: 'Warning',
//                   message: 'This action might have consequences.',
//                 ),
//                 color: AppColors.warning,
//               ),
              
//               SizedBox(height: 24.h),
//               _buildSectionTitle('Loading Dialog'),
//               SizedBox(height: 16.h),
//               _buildDialogButton(
//                 context: context,
//                 title: 'Loading Dialog',
//                 onPressed: () async {
//                   await DialogExamples.showLoadingDialogDuring(
//                     context,
//                     asyncOperation: () async {
//                       // Simulate a long operation
//                       await Future.delayed(Duration(seconds: 3));
//                       return true;
//                     },
//                   );
                  
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Operation completed')),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSectionTitle(String title) {
//     return Text(
//       title,
//       style: AppTextStyles.h6Bold.copyWith(
//         color: AppColors.textColorBlack,
//       ),
//     );
//   }

//   Widget _buildDialogButton({
//     required BuildContext context,
//     required String title,
//     required VoidCallback onPressed,
//     Color? color,
//   }) {
//     return CustomBuildButtonApp(
//       text: title,
//       isSpace: false,
//       backgroundColor: color ?? AppColors.primaryColor,
//       onPressed: onPressed,
//     );
//   }
// }

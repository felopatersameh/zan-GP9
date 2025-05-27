import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../Core/Utils/Enums/enum_payments.dart';
import '../../../../../../Config/Routes/route_name.dart';
import '../../../../../../Core/Utils/Widget/Dialogs/dialog_examples.dart';
import '../../../../../../generated/l10n.dart';

import '../../../../../../Config/app_config.dart';
import '../../../../../../Core/Resources/app_colors.dart';
import '../../../../../../Core/Resources/app_fonts.dart';
import '../../../../../../Core/Utils/Widget/TextField/build_text_field.dart';
import '../../../../../../main.dart';
import '../../../../../Global/Authentication/presentation/components/build_social_login_button.dart';
import '../../../../User/presentation/Cubit/user_cubit.dart';
import '../../data/Model/creat_order.dart';
import '../Cubit/Cart/cart_state.dart';
import '../../../../../../Core/Utils/Extensions/localizations_extension.dart';
import '../Cubit/Cart/cart_cubit.dart';
import '../../../Main/Cubit/main_cubit.dart';

final TextEditingController textCoupon = TextEditingController();

class PersistentFooterButtonsCart extends StatelessWidget {
  const PersistentFooterButtonsCart({
    super.key,
    required this.local,
    required this.state,
  });

  final S local;
  final CartStates state;

  Widget _buildPriceRow({
    required String title,
    required String value,
    required bool isTotal,
    bool isDiscount = false,
  }) {
    final TextStyle titleStyle =
        isTotal ? AppTextStyles.h5Bold : AppTextStyles.bodyMediumMedium;

    final TextStyle valueStyle = isTotal
        ? AppTextStyles.h5Bold.copyWith(color: AppColors.primaryColor)
        : isDiscount
            ? AppTextStyles.bodyMediumMedium.copyWith(color: AppColors.success)
            : AppTextStyles.bodyMediumMedium;

    final String displayValue = isDiscount ? "-$value" : value;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: titleStyle),
        Text(displayValue, style: valueStyle),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppConfig.customPaddingFromRightLeft),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 16.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(10),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Icon(
                      Icons.discount_outlined,
                      color: AppColors.primaryColor,
                      size: 20.sp,
                    ),
                  ),
                  Expanded(
                    child: DefaultTextFormField(
                      isTextOut: false,
                      text: local.PromoCode,
                      type: TextInputType.text,
                      controller: textCoupon,
                      onChanged: (value) async {
                        if (value.isEmpty) {
                          return;
                        }

                        final cartCubit = context.read<CartCubit>();
                        final couponText = textCoupon.text;

                        await Future.delayed(
                            const Duration(milliseconds: 1500));

                        if (context.mounted) {
                          cartCubit.applyCoupon(couponText);
                        }
                      },
                    ),
                  ),
                  BlocBuilder<CartCubit, CartStates>(
                    buildWhen: (previous, current) =>
                        previous.cartItems?.summary?.couponDiscount !=
                        current.cartItems?.summary?.couponDiscount,
                    builder: (context, state) {
                      final hasCouponDiscount =
                          (state.cartItems?.summary?.couponDiscount ?? 0) > 0;

                      if (!hasCouponDiscount) {
                        return SizedBox();
                      }

                      return Container(
                        margin: EdgeInsets.only(right: 8.w),
                        child: InkWell(
                          onTap: () {
                            context
                                .read<CartCubit>()
                                .cancelCoupon(textCoupon.text);
                            textCoupon.clear();
                          },
                          child: Container(
                            padding: EdgeInsets.all(8.r),
                            decoration: BoxDecoration(
                              color: AppColors.grayscale10,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.close,
                              size: 16.sp,
                              color: AppColors.grayscale60,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  _buildPriceRow(
                    title: local.Subtotal,
                    value: '${state.cartItems?.summary?.subtotal ?? 0}',
                    isTotal: false,
                  ),
                  SizedBox(height: 8.h),
                  _buildPriceRow(
                    title: local.DeliveryCharge,
                    value: '${state.cartItems?.summary?.deliveryCharge ?? 0}',
                    isTotal: false,
                  ),
                  if ((state.cartItems?.summary?.couponDiscount ?? 0) > 0) ...[
                    SizedBox(height: 8.h),
                    _buildPriceRow(
                      title: local.couponDiscount,
                      value: '${state.cartItems?.summary?.couponDiscount ?? 0}',
                      isTotal: false,
                      isDiscount: true,
                    ),
                  ],
                  SizedBox(height: 12.h),
                  Divider(thickness: 1, color: AppColors.grayscale50),
                  SizedBox(height: 12.h),
                  _buildPriceRow(
                    title: local.TotalAmount,
                    value: '${state.cartItems?.summary?.grandTotal ?? 0}',
                    isTotal: true,
                  ),
                ],
              ),
            ),
            10.verticalSpace,
            CustomBuildButtonApp(
              size: Size(double.infinity, 56.h),
              text: context.local.BuyNow,
              textStyle: AppTextStyles.h5Bold.copyWith(
                color: AppColors.textColorWhite,
              ),
              isSpace: false,
              backgroundColor:
                  state.cartItems == null || state.cartItems!.cartItems.isEmpty
                      ? AppColors.grayscale50
                      : AppColors.primaryColor,
              onPressed: () {
                if (state.cartItems == null ||
                    state.cartItems!.cartItems.isEmpty) {
                  return;
                }
                DialogExamples.showOrderSubmitConfirmationDialog(
                  context,
                  onConfirm: () async {
                    final CreateOrderProducts order = CreateOrderProducts(
                      paymentMethod: PaymentMethodEnum.creditCard,
                      addressId:
                          context.read<UserCubit>().defaultAddressID.toInt(),
                    );

                    final localCopy = local;

                    await DialogExamples.showLoadingDialogDuring(
                      context,
                      asyncOperation: () async {
                        final cartCubit = context.read<CartCubit>();
                        await cartCubit.createOrder(order);

                        if (cartCubit.state.createdOrder == true) {
                          if (context.mounted) {
                            await DialogExamples.showOperationSuccessDialog(
                              context,
                              title: "نجاح",
                              message: localCopy.order_submitted,
                            );

                            if (context.mounted) {
                              kNavigationService
                                  .clearAndNavigateTo(AppRoutes.main);

                              Future.delayed(Duration(milliseconds: 300), () {
                                if (context.mounted) {
                                  context.read<MainCubit>().changeIndex(3);
                                }
                              });
                            }
                          }
                        } else if (cartCubit.state.createdOrder == false) {
                          if (context.mounted) {
                            await DialogExamples.showWarningMessageDialog(
                              context,
                              title: "خطأ",
                              message: cartCubit.state.messagecreatedOrder ??
                                  "حدث خطأ أثناء إنشاء الطلب",
                            );
                          }
                        }

                        return cartCubit.state.createdOrder ?? false;
                      },
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

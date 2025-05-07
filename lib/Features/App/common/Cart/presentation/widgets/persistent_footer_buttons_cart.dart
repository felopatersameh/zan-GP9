import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../Core/Utils/Widget/Dialogs/dialog_examples.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../Core/Resources/app_icons.dart';
import '../../../../../../Config/app_config.dart';
import '../../../../../../Core/Resources/app_colors.dart';
import '../../../../../../Core/Resources/app_fonts.dart';
import '../../../../../../Core/Utils/Widget/TextField/build_text_field.dart';
import '../../../../../Global/Authentication/presentation/components/build_social_login_button.dart';
import '../Cubit/Cart/cart_state.dart';
import '../../../../../../Core/Utils/Extensions/localizations_extension.dart';
import '../Cubit/Cart/cart_cubit.dart';

final TextEditingController textCoupon = TextEditingController();

class PersistentFooterButtonsCart extends StatelessWidget {
  const PersistentFooterButtonsCart({
    super.key,
    required this.local,
    required this.state,
  });

  final S local;
  final CartStates state;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppConfig.customPaddingFromRightLeft),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DefaultTextFormField(
                  isTextOut: false,
                  text: local.PromoCode,
                  type: TextInputType.text,
                  controller: textCoupon,
                  onChanged: (value) async {
                    if (value.isEmpty) {
                      return;
                    }
                    Future.delayed(const Duration(milliseconds: 1500));
                    context.read<CartCubit>().applyCoupon(textCoupon.text);
                  },
                ),
                InkWell(
                    onTap: () {
                      context.read<CartCubit>().cancelCoupon(textCoupon.text);
                      textCoupon.clear();
                    },
                    child: AppIcons.uncheck),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  local.Subtotal,
                  style: AppTextStyles.h5Bold,
                ),
                Text(
                  '${state.cartItems?.summary?.subtotal ?? 0}',
                  style: AppTextStyles.h5Bold,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  local.DeliveryCharge,
                  style: AppTextStyles.h5Bold,
                ),
                Text(
                  '${state.cartItems?.summary?.deliveryCharge ?? 0}',
                  style: AppTextStyles.h5Bold,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  local.couponDiscount,
                  style: AppTextStyles.h5Bold,
                ),
                Text(
                  '${state.cartItems?.summary?.couponDiscount ?? 0}',
                  style: AppTextStyles.h5Bold,
                ),
              ],
            ),
            25.verticalSpace,
            Divider(
              thickness: 1,
              color: AppColors.grayscale50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  local.TotalAmount,
                  style: AppTextStyles.h5Bold,
                ),
                Text(
                  '${state.cartItems?.summary?.grandTotal ?? 0}',
                  style: AppTextStyles.h5Bold,
                ),
              ],
            ),
            10.verticalSpace,
            CustomBuildButtonApp(
              //
              size: Size(.8.sw, 56.h),
              text: context.local.BuyNow,
              textStyle: AppTextStyles.h5Bold.copyWith(
                color: AppColors.textColorWhite,
              ),
              isSpace: false,
              backgroundColor: AppColors.primaryColor,
              onPressed: () {
                if (state.cartItems == null ||
                    state.cartItems!.cartItems.isEmpty ) {
                  return;
                }
                DialogExamples.showOrderSubmitConfirmationDialog(
                  context,
                  onConfirm: () {
                    
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

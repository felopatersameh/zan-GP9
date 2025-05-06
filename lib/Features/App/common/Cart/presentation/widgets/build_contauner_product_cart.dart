import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zan/Core/Utils/Widget/Dialogs/dialog_examples.dart';
import '../../../../../../Config/Routes/route_name.dart';
import '../../../../../../Core/Resources/app_colors.dart';
import '../../../../../../Core/Resources/app_constants.dart';
import '../../../../../../Core/Resources/app_fonts.dart';
import '../../../../../../Core/Utils/Extensions/localizations_extension.dart';
import '../../../../../../Core/Utils/Widget/Images/build_image.dart';
import '../../../../../../Features/App/common/Cart/data/Model/cart_item_model.dart';
import '../../../../../../Features/App/common/Cart/presentation/Cubit/Cart/cart_cubit.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../main.dart';

class BuildContaunerProductCart extends StatelessWidget {
  const BuildContaunerProductCart({
    super.key,
    required this.items,
    required this.local,
  });
  final CartItemModel? items;
  final S local;
  @override
  Widget build(BuildContext context) {
    final product = items?.product;
    final discountPrice = product?.discountPrice;
    final price = product?.price;
    final isRtl = context.isRtl;
    return GestureDetector(
      onTap: () {
        kNavigationService.navigateTo(
          AppRoutes.productDetails,
          arguments: product?.id,
        );
      },
      child: Stack(
        children: [
          Container(
            decoration: AppConstants.boxDecoration,
            padding: REdgeInsets.all(10),
            margin: REdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  BuildImageAssets(
                    url: product?.primaryImage?.imageUrl ?? "",
                    width: 150.w,
                    height: 150.h,
                  ),
                  20.horizontalSpace,
                  Expanded(
                      child: Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 200.w,
                          child: Text(
                            product?.name ?? "",
                            style: AppTextStyles.h5Bold,
                            maxLines: 3,
                          )),
                      items?.color == null
                          ? Container()
                          : Text.rich(
                              TextSpan(
                                text: "${local.Color}: ",
                                style: AppTextStyles.bodyMediumBold,
                                children: [
                                  TextSpan(
                                    text: items?.color?.name ?? "",
                                    style: AppTextStyles.bodyMediumMedium,
                                  ),
                                ],
                              ),
                            ),
                      items?.size == null
                          ? Container()
                          : Text.rich(
                              TextSpan(
                                text: "${local.Size}: ",
                                style: AppTextStyles.bodyMediumBold,
                                children: [
                                  TextSpan(
                                    text: items?.size?.name ?? "",
                                    style: AppTextStyles.bodyMediumMedium,
                                  ),
                                ],
                              ),
                            ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                if (items!.quantity == 1) {
                                  return;
                                } else {
                                  context.read<CartCubit>().updateCartItems(
                                        id: items!.id,
                                        newQuantity: items!.quantity - 1,
                                      );
                                }
                              },
                              icon: Icon(Icons.remove_circle)),
                          Text(items!.quantity.toString()),
                          IconButton(
                              onPressed: () {
                                context.read<CartCubit>().updateCartItems(
                                      id: items!.id,
                                      newQuantity: items!.quantity + 1,
                                    );
                              },
                              icon: Icon(Icons.add_circle)),
                          Spacer(),
                          Padding(
                            padding: REdgeInsets.all(15),
                            child: discountPrice == null
                                ? Text(
                                    (price)!.split(".00").first,
                                    style: AppTextStyles.bodyXtraLargeBold,
                                  )
                                : Text((discountPrice).split(".00").first,
                                    style: AppTextStyles.bodyXtraLargeBold),
                          ),
                        ],
                      )
                    ],
                  )),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: isRtl ? 0 : null,
            right: isRtl ? null : 0,
            child: IconButton(
              padding: REdgeInsets.only(
                top: 20.h,
                right: 25.w,
                left: 25.w,
              ),
              focusColor: Colors.transparent,
              autofocus: false,
              hoverColor: Colors.transparent,
              onHover: (value) => false,
              highlightColor: Colors.transparent,
              onPressed: () async =>
                  await DialogExamples.showDeleteItemConfirmationDialog(
                context,
                itemName: product?.name ?? "",
                onConfirm: () =>
                    context.read<CartCubit>().removeItems(id: items!.id),
              ),
              icon: const Icon(
                Icons.close,
                color: AppColors.primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../Core/Resources/app_colors.dart';
import '../../../../../../Core/Utils/Extensions/localizations_extension.dart';
import '../../../../../../Config/app_config.dart';
import '../../../../../../Core/Resources/app_icons.dart';
import '../../../../../../Core/Utils/Widget/Animations/loading_animation.dart';
import '../../../../../../Core/Utils/Extensions/widget_extension.dart';
import '../../../../../../Config/Routes/route_name.dart';
import '../../../../../../Core/Resources/app_fonts.dart';
import '../../../../../../Core/Utils/Widget/Images/build_image.dart';
import '../../../../../../main.dart';
import '../../domain/UseCase/add_review_cart_use_case.dart';
import '../../domain/UseCase/add_to_cart_use_case.dart';
import '../../domain/UseCase/get_details_product_use_case.dart';
import '../../domain/repository/product_details_repo_impl.dart';
import '../Manager/product_details_cubit.dart';
import '../components/build_button_add_cart.dart';
import '../components/tab_bar_products.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int id;

  const ProductDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsCubit(
        GetDetailsProductUseCase(
          productDetailsRepoImpl: ProductDetailsRepoImpl(),
        ),
        AddToCartUseCase(
          productDetailsRepoImpl: ProductDetailsRepoImpl(),
        ),
        AddReviewCartUseCase(
          productDetailsRepoImpl: ProductDetailsRepoImpl(),
        ),
      )..getProductDetails(id: id),
      child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                12.horizontalSpace,
                InkWell(
                  onTap: () => kNavigationService.navigateTo(AppRoutes.cart),
                  child: AppIcons.bag,
                ),
                AppConfig.customPaddingFromRightLeft.horizontalSpace,
              ],
            ),
            body: state.isLoading == true
                ? CustomLoadingAnimation()
                : [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 300.h,
                            child: PageView.builder(
                              onPageChanged: (index) => context
                                  .read<ProductDetailsCubit>()
                                  .changeIndex(index),
                              itemCount: state.product!.images.length,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () => kNavigationService.navigateTo(
                                    AppRoutes.imageViewer,
                                    arguments: state.product!.images.map((e) => e.imageUrl).toList()),
                                child: BuildImageAssets(
                                  height: 300.h,
                                  width: 1.sw,
                                  url: state.product!.images[index].imageUrl,
                                ),
                              ),
                            ),
                          ),
                          10.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              state.product!.images.length,
                              (index) => AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                margin: EdgeInsets.symmetric(horizontal: 4),
                                height: 8.h,
                                width: 8.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: state.index == index
                                      ? AppColors.primaryColor
                                      : AppColors.grayscale60,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primaryColor.withAlpha(200),
                                  blurRadius: 5,
                                  blurStyle: BlurStyle.outer,
                                  // offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: InkWell(
                              onTap: () {
                                // state.product?.model3D == null
                                //     ? showCustomSnackBar(
                                //         context,
                                //         "will be Available as soon ",
                                //         SnackBarType.info)
                                //     : null;

                                kNavigationService.navigateTo(
                                    AppRoutes.screen3D,
                                    arguments: state.product?.model3D);
                              },
                              child: Text(
                                "View 3D",
                                style: AppTextStyles.h6Bold.copyWith(
                                    color: state.product?.model3D == null
                                        ? AppColors.error
                                        : AppColors.success),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TabBarProducts()
                  ].styledAppPages(withScroll: true, withPadding: true),
            persistentFooterButtons: [
              BuildButtonBottomScreen(
                nameButtonBuy: context.local.AddToCart,
                onPressed: () {
                  context.read<ProductDetailsCubit>().addToCart(context);
                },
                price: state.product?.price ?? "00",
                disCountPrice: state.product?.discountPrice,
              ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../Core/Resources/app_colors.dart';
import '../../../../../../Core/Utils/Widget/Images/build_image.dart';
import '../../../../../../Core/Utils/Widget/TextField/build_text_field.dart';
import '../../../../../Global/Authentication/presentation/components/build_social_login_button.dart';
import '../../../../../../Config/app_config.dart';
import '../../../../../../Core/Resources/app_fonts.dart';
import '../../../../../../Core/Utils/Extensions/localizations_extension.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../User/presentation/Cubit/user_cubit.dart';
import '../../data/entities/product_details_model.dart';
import '../Manager/product_details_cubit.dart';
class ProductReviewsWidget extends StatefulWidget {

 const  ProductReviewsWidget({super.key});

  @override
  State<ProductReviewsWidget> createState() => _ProductReviewsWidgetState();
}

class _ProductReviewsWidgetState extends State<ProductReviewsWidget> {
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final S local = context.local;
    return ListView(
      shrinkWrap: true,
      physics: AppConfig.physicsCustomScrollView,
      children: [
        // Customer Reviews Section
        Text(
          local.CustomerReviews,
          style: AppTextStyles.h5SemiBold,
        ),
        16.verticalSpace,
        // Review List
        Column(
          children:
              (context.read<ProductDetailsCubit>().state.product?.reviews ?? [])
                  .map((review) => _buildReviewCard(review))
                  .toList(),
        ),
        20.verticalSpace,
        // Add Review Section
        Text(
          local.AddReview,
          style: AppTextStyles.h5SemiBold,
        ),
        10.verticalSpace,

        // Star Rating Input
        Text(
          local.YourRating,
          style: AppTextStyles.bodyLargeBold,
        ),
        8.verticalSpace,
        _buildStarRatingInput(context),

        16.verticalSpace,
        // Review Input
        DefaultTextFormField(
          text: local.YourRating,
          isTextOut: false,
          type: TextInputType.text,
          maxLine: 4,
          controller: commentController,
        ),

        20.verticalSpace,

        // Submit Button

        context.watch<UserCubit>().id == -1 ? SizedBox():  BuildSocialLoginButton(
          text: local.Submit,
          isSpace: false,
          backgroundColor: AppColors.secondaryColor,
          onPressed: () {
            context.read<ProductDetailsCubit>().addReview(commentController.text,context);
          },
        ),
      ],
    );
  }

  // Function to build individual review cards
  Widget _buildReviewCard(Review review) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 24,
              child: BuildImageAssets(
                url: review.user?.photoUrl ?? "",
                setDefaultImage: true,
              ),
            ),
            10.horizontalSpace,
            // Review Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.user?.name?? "",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),

                  // Star Rating
                  Row(
                    children: List.generate(
                      review.rating,
                      (index) =>
                          Icon(Icons.star, color: Colors.orange, size: 18),
                    ),
                  ),
                  SizedBox(height: 4),


                  // Review Text
                  Text(
                    (review.comment ?? ""),
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                  SizedBox(height: 4),

                  // Review Date
                  Text(
                    "Review by Krist | Posted on ${review.createdAt}",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }

  // Star Rating Input
  Widget _buildStarRatingInput(BuildContext context) {
    var ratingCubit = context.read<ProductDetailsCubit>();
    return Row(
      children: List.generate(
        5,
        (index) => GestureDetector(
          onTap: () => ratingCubit.changeRating(index+1),
          child: Icon(
            ratingCubit.state.ratingIndex! >= index + 1
                ? Icons.star
                : Icons.star_border,
            color: ratingCubit.state.ratingIndex! >= index + 1 ? AppColors.primaryColor : AppColors.grayscale60,
            size: 24,
          ),
        ),
      ),
    );
  }
}

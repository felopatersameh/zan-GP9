import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../Resources/app_colors.dart';
import '../../../Resources/app_fonts.dart';
import '../../../../Config/Assets/image_svg.dart';

class CustomLoadingAnimation extends StatefulWidget {
  final bool loadingWithText;
  final String? text;

  const CustomLoadingAnimation(
      {super.key, this.loadingWithText = false, this.text});

  @override
  State<CustomLoadingAnimation> createState() => _CustomLoadingAnimationState();
}

class _CustomLoadingAnimationState extends State<CustomLoadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    // Animation to control opacity from 1 to 0
    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Animation to slide SVG from right to left
    _slideAnimation = Tween<double>(begin: 0.0, end: -50.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: widget.loadingWithText
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildAnimatedBuilder(),
                10.horizontalSpace,
                Text(
                  widget.text ?? "",
                  style: AppTextStyles.bodyMediumMedium.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
              ],
            )
          : _buildAnimatedBuilder(),
    );
  }

  AnimatedBuilder _buildAnimatedBuilder() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return RepaintBoundary(
          child: Opacity(
            opacity: _fadeAnimation.value,
            child: Transform.translate(
              offset: Offset(_slideAnimation.value, 0),
              child: SvgPicture.asset(
                width: 100,
                height: 100,
                AppImagesSvg.loading,
              ),
            ),
          ),
        );
      },
    );
  }
}

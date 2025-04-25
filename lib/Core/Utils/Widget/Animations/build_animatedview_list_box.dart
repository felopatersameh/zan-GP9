import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Config/Cubit/settings_cubit.dart';

class BuildAnimatedviewListBox extends StatefulWidget {
  final Widget child;
  final int index;

  const BuildAnimatedviewListBox({
    super.key,
    required this.child,
    required this.index,
  });

  @override
  State<BuildAnimatedviewListBox> createState() =>
      _BuildAnimatedviewListBoxState();
}

class _BuildAnimatedviewListBoxState extends State<BuildAnimatedviewListBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: context.read<SettingsCubit>().state.locale.languageCode == 'ar'
              ? const Offset(-0.2, 0)
              : const Offset(0.2, 0),
          end: Offset.zero,
        ).animate(_animation),
        child: AnimatedBuilder(
          animation: AlwaysStoppedAnimation(widget.index),
          builder: (context, child) {
            return TweenAnimationBuilder(
              tween: Tween<double>(begin: 1.0, end: 0.0),
              duration: Duration(milliseconds: 500 + (widget.index * 200)),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(0, value * 100),
                  child: Opacity(
                    opacity: 1 - value,
                    child: widget.child,
                  ),
                );
              },
              child: child,
            );
          },
        ),
      ),
    );
  }
}

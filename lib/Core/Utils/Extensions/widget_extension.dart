import 'package:flutter/material.dart';
import '../../../Config/app_config.dart';

extension ContextExtension on dynamic {
  Widget styledAppPages({
    bool withAll = false,
    bool appbar = false,
    PreferredSizeWidget? widgetAppbar,
    bool withPadding = false,
    bool withScroll = false,
    bool withScaffold = false,
    bool centered = false,
  }) {
    Widget child;

    if (withAll) {
      return Scaffold(
        appBar: widgetAppbar ?? (appbar == true ? AppBar() : null),
        body: SafeArea(
          child: Padding(
            padding: AppConfig.customPadding,
            child: CustomScrollView(
              physics: AppConfig.physicsCustomScrollView,
              shrinkWrap: true,
              slivers: this as List<Widget>,
            ),
          ),
        ),
      );
    }

    if (this is List<Widget>) {
      child = CustomScrollView(
        physics: AppConfig.physicsCustomScrollView,
        shrinkWrap: true,
        slivers: this as List<Widget>,
      );
    } else {
      child = this as Widget;
    }

    if (withPadding) {
      child = Padding(
        padding: AppConfig.customPadding,
        child: child,
      );
    }

    if (centered) {
      child = Center(child: child);
    }

    if (withScaffold) {
      child = Scaffold(body: SafeArea(child: child));
    } else {
      child = SafeArea(child: child);
    }

    return child;
  }
}

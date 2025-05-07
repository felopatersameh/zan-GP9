import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Components/build_body_screens.dart';
import '../Components/build_regular_tabs.dart';
import '../Components/build_super_tab.dart';
import '../Cubit/orders_cubit.dart';
import '../../../../../../Core/Utils/Extensions/localizations_extension.dart';
import '../../../../../../Core/Utils/Extensions/widget_extension.dart';
import '../../../../../../Core/Utils/Widget/AppBar/default_app_bar.dart';

import '../../../../../../Config/app_config.dart';

class OrderProductsScreen extends StatefulWidget {
  const OrderProductsScreen({super.key});

  @override
  State<OrderProductsScreen> createState() => _OrderProductsScreenState();
}

class _OrderProductsScreenState extends State<OrderProductsScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    context.read<OrdersCubit>().initTabController(this);
  }

  @override
  void dispose() {
    context.read<OrdersCubit>().disposeTabController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final local = context.local;
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        return [
          SliverPadding(
            padding: EdgeInsets.only(
              top: AppConfig.customPaddingFromTopBottom,
            ).r,
            sliver: SliverFillRemaining(
              fillOverscroll: false,
              hasScrollBody: true,
              child: Column(
                children: [
                  BuildSuperTab(
                    state: state,
                  ),
                  16.verticalSpace,
                  BuildRegularTabs(
                      mainTabController:
                          context.read<OrdersCubit>().tabController!),
                  BuildBodyScreens(
                      mainTabController:
                          context.read<OrdersCubit>().tabController!,
                      local: local,
                      state: state),
                ],
              ),
            ),
          ),
        ].styledAppPages(
            withAll: true,
            appbar: true,
            widgetAppbar: DefaultAppBar(local: context.local.orders));
      },
    );
  }
}

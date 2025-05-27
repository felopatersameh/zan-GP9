import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zan/Features/App/common/Orders/Presentation/Components/build_view_orders_carpenter.dart';
import '../../../../../../Config/app_config.dart';
import '../../../../../../Core/Utils/Widget/Animations/loading_animation.dart';
import 'build_view_orders_products.dart';
import '../Cubit/orders_cubit.dart';
import '../../../../../../generated/l10n.dart';


class BuildBodyScreens extends StatelessWidget {
  const BuildBodyScreens({
    super.key,
    required TabController mainTabController,
    required this.local, required this.state,
  }) : _mainTabController = mainTabController;

  final TabController _mainTabController;
  final OrdersState state;
  final S local;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          top: AppConfig.customPaddingFromTopBottom,
        ).r,
        child:state.loading == false ? CustomLoadingAnimation(): TabBarView(
          controller: _mainTabController,
          physics: AppConfig.physicsCustomScrollView,
          children: state.selectedSupTabIndex == 0 ||  state.selectedSupTabIndex == 2
              ? 
                   [

            BuildViewOrdersProducts(local: local,orders: state.orders??[],),
            BuildViewOrdersProducts(local: local,orders: state.ordersRunning??[],),
            BuildViewOrdersProducts(local: local,orders: state.ordersCompleted??[],),
            BuildViewOrdersProducts(local: local,orders: state.ordersCanceling??[],)
                
          ]:[
           BuildViewOrdersCarpenter(local: local,),
           BuildViewOrdersCarpenter(local: local,),
         BuildViewOrdersCarpenter(local: local,),
            BuildViewOrdersCarpenter(local: local,),
          ],
        ),
      ),
    );
  }
}



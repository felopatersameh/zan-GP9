import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../Core/Utils/Widget/Animations/build_animatedview_list_box.dart';
import '../../../../../../Core/Utils/Extensions/localizations_extension.dart';
import '../../../../../../Core/Resources/app_list.dart';
import 'dashboard_box.dart';

class ViewMainResults extends StatelessWidget {
  const ViewMainResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final local = context.local;
    return SliverToBoxAdapter(
      child: Column(
        spacing: 30.h,
        children: [
          10.verticalSpace,
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                childAspectRatio: 1.5),
            itemCount: AppList.dashboardBoxConfigs(local).length,
            itemBuilder: (context, index) {
              final boxConfigs = AppList.dashboardBoxConfigs(local);
              return BuildAnimatedviewListBox(
                index: index,
                child: GestureDetector(
                  onTap: () {
                    switch (index) {
                      case 0:
                        // print('Total Earnings');
                        break;
                      case 1:
                        // print("Completed Orders");
                        break;
                      case 2:
                        // print('Rating');
                        break;
                      case 3:
                        // print('Pending Orders');
                        break;
                      case 4:
                        // print('Pending Orders');
                        break;
                    }
                  },
                  child: BuildAnimatedviewListBox(
                    index: index,
                    child: DashboredBox(
                      title: boxConfigs[index].title,
                      subtitle: boxConfigs[index].subtitle,
                      color: boxConfigs[index].color,
                    ),
                  ),
                ),
              );
            },
          ),
          20.verticalSpace,
        ],
      ),
    );
  }
}

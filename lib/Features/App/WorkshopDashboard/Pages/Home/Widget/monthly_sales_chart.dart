import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../Config/app_config.dart';
import '../../../../../../Core/Resources/app_colors.dart';
import '../../../../../../Core/Resources/app_fonts.dart';
import '../../../../../../Core/Utils/Extensions/localizations_extension.dart';
import '../../../../../../Core/Utils/Widget/Animations/build_animatedview_list_box.dart';

class MonthlySalesChart extends StatelessWidget {
  final List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  final List<String> monthsAr = [
    'يناير',
    'فبراير',
    'مارس',
    'أبريل',
    'مايو',
    'يونيو',
    'يوليو',
    'أغسطس',
    'سبتمبر',
    'أكتوبر',
    'نوفمبر',
    'ديسمبر'
  ];

  MonthlySalesChart({super.key});

  @override
  Widget build(BuildContext context) {
    final local = context.local;
    final iRt = context.isRtl;
    return SliverToBoxAdapter(
      child: BuildAnimatedviewListBox(
        index:0,
        child: Container(
          height: 300.h,
          padding: EdgeInsets.symmetric(
              horizontal: AppConfig.customPaddingFromRightLeft, vertical: 10.h),
          margin: EdgeInsets.only(bottom: 20.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [Color(0xFF4B0082), Color(0xFF1A0033)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                local.monthly_sales,
                style: AppTextStyles.bodyLargeBold
                    .copyWith(color: AppColors.textColorWhite),
              ),
              16.verticalSpace,
              Expanded(
                child: LineChart(
                  
                  LineChartData(
                    backgroundColor: Colors.transparent,
                    gridData: FlGridData(show: true,
                    checkToShowHorizontalLine: (value) {
                      return value % 5 == 0 && value <= 30;
                    },
                    drawVerticalLine: true,
                    
                    drawHorizontalLine: true,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: Colors.white.withAlpha(50),
                          strokeWidth: 1,
                        );
                      },
                    ),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                      
                        sideTitles: SideTitles(
                          showTitles: true,
                          maxIncluded: true,
                          getTitlesWidget: (value, meta) {
                            final monthIndex = value.toInt();
                            if (monthIndex >= 0 && monthIndex < months.length) {
                              return SideTitleWidget(
                                meta: meta,
                                child: Text(
                                  iRt ? monthsAr[monthIndex] : months[monthIndex],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              );
                            }
                            return const SizedBox.shrink();
                          },
                          reservedSize: 30,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            if (value % 5 == 0 && value <= 30) {
                              return SideTitleWidget(
                                meta:meta,
                                child: Text(
                                  '${value.toInt()}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              );
                            }
                            return const SizedBox.shrink();
                          },
                          reservedSize: 40,
                        ),
                      ),
                      topTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: AxisTitles(
                          sideTitles: SideTitles(
                        showTitles: false,
                      )),
                    ),
                    borderData: FlBorderData(show: false),
                    minX: 0,
                    maxX: 11,
                    minY: 1,
                    maxY: 30,
                    lineBarsData: [
                      _buildLineData(
                          [15, 20, 25, 18, 22, 28, 24, 19, 23, 27, 21, 26],
                          Colors.greenAccent.shade400),
                      // _buildLineData([10, 15, 20, 13, 17, 23, 19, 14, 18, 22, 16, 21], Colors.cyanAccent.shade400),
                      // _buildLineData([5, 10, 15, 8, 12, 18, 14, 9, 13, 17, 11, 16], Colors.purpleAccent.shade400),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  LineChartBarData _buildLineData(List<double> data, Color color) {
    return LineChartBarData(
      spots: List.generate(
        data.length,
        (i) => FlSpot(i.toDouble(), data[i]),
      ),
      isCurved: true,
      color: color,
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(show: true),
      belowBarData: BarAreaData(show: false),
    );
  }
}

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CustomBarChart extends StatelessWidget {
  final String type;
  final thisWeek = DateTime.timestamp().day;
  final thisMonth = DateFormat.MMMM().format(DateTime.now());
  final lastMonth = DateFormat.MMMM()
      .format(DateTime(DateTime.now().year, DateTime.now().month - 1));
  final lastWeek = DateTime.timestamp().day;

  CustomBarChart({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0.w),
      child: BarChart(
        BarChartData(
          backgroundColor: Colors.white,
          barTouchData: barTouchData,
          titlesData: titlesData,
          borderData: borderData,
          barGroups: barGroups, // Already defined groups
          gridData: const FlGridData(show: false),
          alignment: BarChartAlignment.spaceBetween, // Use spaceAround for wider gaps
          groupsSpace: 16, // Increase this value to add more space between groups
          maxY: 20,
        ),
      ),
    );
  }

  // Tooltip data configured to show only on tap
  BarTouchData get barTouchData => BarTouchData(
        enabled: true,
        touchTooltipData: BarTouchTooltipData(
          tooltipPadding: const EdgeInsets.all(8),
          tooltipMargin: 8,
          fitInsideHorizontally: true,
          fitInsideVertically: true,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            // Set up custom tooltip text
            String text;
            switch (rodIndex) {
              case 0:
                text = 'Workouts: ${rod.toY.toInt()}';
                break;
              case 1:
                text = 'Minutes: ${rod.toY.toInt()}';
                break;
              case 2:
                text = 'Kcal: ${rod.toY.toInt()}';
                break;
              default:
                text = '';
                break;
            }
            return BarTooltipItem(
              text,
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          if (event is FlTapUpEvent && barTouchResponse != null) {
            // Only show tooltip on tap
            final spot = barTouchResponse.spot;
            if (spot != null) {
              // This will trigger only on tap events
            }
          }
        },
      );

  // Custom titles for the x-axis (dates)
  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = type == 'this week'
            ? '$thisWeek'
            : type == 'last week'
                ? '${lastWeek - 7}'
                : type == 'this month'
                    ? ''
                    : '';
        break;
      case 1:
        text = type == 'this week'
            ? '${thisWeek+1}'
            : type == 'last week'
            ? '${lastWeek - 6}'
            : type == 'this month'
            ? ''
            : '';
        break;
      case 2:
        text = type == 'this week'
            ? '${thisWeek+2}'
            : type == 'last week'
            ? '${lastWeek - 5}'
            : type == 'this month'
            ? ''
            : '';
        break;
      case 3:
        text = type == 'this week'
            ? '${thisWeek+3}'
            : type == 'last week'
            ? '${lastWeek - 4}'
            : type == 'this month'
            ? thisMonth
            : lastMonth;
        break;
      case 4:
        text = type == 'this week'
            ? '${thisWeek+4}'
            : type == 'last week'
            ? '${lastWeek - 3}'
            : type == 'this month'
            ? ''
            : '';
        break;
      case 5:
        text = type == 'this week'
            ? '${thisWeek+5}'
            : type == 'last week'
            ? '${lastWeek - 2}'
            : type == 'this month'
            ? ''
            : '';
        break;
      case 6:
        text = type == 'this week'
            ? '${thisWeek+6}'
            : type == 'last week'
            ? '${lastWeek - 1}'
            : type == 'this month'
            ? ''
            : '';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 12,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 50,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  List<BarChartGroupData> get barGroups => [
        // Each day has three bars (red, green, orange) to represent Workouts, Minutes, and Kcal.
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(toY: type=='this week'?5:5, color: Colors.red), // Workouts
            BarChartRodData(toY: type=='this week'?15:12, color: Colors.green), // Minutes
            BarChartRodData(toY: type=='this week'?10:7, color: Colors.orange) // Kcal
          ],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(toY: type=='this week'?10:5,  color: Colors.red),
            BarChartRodData(toY: type=='this week'?5:10, color: Colors.green),
            BarChartRodData(toY: type=='this week'?15:15,  color: Colors.orange)
          ],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(toY:type=='this week'?15:10,   color: Colors.red),
            BarChartRodData(toY:type=='this week'?10:5,color: Colors.green),
            BarChartRodData(toY:type=='this week'?5:15,   color: Colors.orange)
          ],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(toY: type=='this week'?5:5,   color: Colors.red),
            BarChartRodData(toY: type=='this week'?10:15, color: Colors.green),
            BarChartRodData(toY: type=='this week'?15:10,   color: Colors.orange)
          ],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(toY: type=='this week'?10:15,   color: Colors.red),
            BarChartRodData(toY: type=='this week'?15:10,color: Colors.green),
            BarChartRodData(toY: type=='this week'?5:5,   color: Colors.orange)
          ],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(toY: type=='this week'?15:10,   color: Colors.red),
            BarChartRodData(toY: type=='this week'?5:15, color: Colors.green),
            BarChartRodData(toY: type=='this week'?10:5,   color: Colors.orange)
          ],
        ),
        BarChartGroupData(
          x: 6,
          barRods: [
            BarChartRodData(toY: type=='this week'?5:15,  color: Colors.red),
            BarChartRodData(toY: type=='this week'?15:5, color: Colors.green),
            BarChartRodData(toY: type=='this week'?10:10,   color: Colors.orange)
          ],
        ),
      ];
}

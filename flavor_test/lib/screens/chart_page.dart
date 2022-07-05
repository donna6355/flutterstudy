import 'dart:async';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartSample1 extends StatefulWidget {
  const BarChartSample1({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BarChartSample1State();
}

class BarChartSample1State extends State<BarChartSample1> {
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        color: Colors.white54,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BarChart(
            mainBarData(),
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = Colors.black,
    double width = 20,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? Colors.yellow : barColor,
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: Colors.white70,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 5, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, 6.5, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, 5, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, 7.5, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, 9, isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, 11.5, isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, 6.5, isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      //touch animation from here! optional!
      // barTouchData: BarTouchData(
      //   touchTooltipData: BarTouchTooltipData(
      //       tooltipBgColor: Colors.blueGrey,
      //       getTooltipItem: (group, groupIndex, rod, rodIndex) {
      //         String weekDay;
      //         switch (group.x.toInt()) {
      //           case 0:
      //             weekDay = 'Monday';
      //             break;
      //           case 1:
      //             weekDay = 'Tuesday';
      //             break;
      //           case 2:
      //             weekDay = 'Wednesday';
      //             break;
      //           case 3:
      //             weekDay = 'Thursday';
      //             break;
      //           case 4:
      //             weekDay = 'Friday';
      //             break;
      //           case 5:
      //             weekDay = 'Saturday';
      //             break;
      //           case 6:
      //             weekDay = 'Sunday';
      //             break;
      //           default:
      //             throw Error();
      //         }
      //         return BarTooltipItem(
      //           weekDay + '\n',
      //           const TextStyle(
      //             color: Colors.white,
      //             fontWeight: FontWeight.bold,
      //             fontSize: 18,
      //           ),
      //           children: <TextSpan>[
      //             TextSpan(
      //               text: (rod.toY - 1).toString(),
      //               style: const TextStyle(
      //                 color: Colors.yellow,
      //                 fontSize: 16,
      //                 fontWeight: FontWeight.w500,
      //               ),
      //             ),
      //           ],
      //         );
      //       }),
      //   touchCallback: (FlTouchEvent event, barTouchResponse) {
      //     setState(() {
      //       if (!event.isInterestedForInteractions ||
      //           barTouchResponse == null ||
      //           barTouchResponse.spot == null) {
      //         touchedIndex = -1;
      //         return;
      //       }
      //       touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
      //     });
      //   },
      // ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('M', style: style);
        break;
      case 1:
        text = const Text('T', style: style);
        break;
      case 2:
        text = const Text('W', style: style);
        break;
      case 3:
        text = const Text('T', style: style);
        break;
      case 4:
        text = const Text('F', style: style);
        break;
      case 5:
        text = const Text('S', style: style);
        break;
      case 6:
        text = const Text('S', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }
}

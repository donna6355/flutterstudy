import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartScreen extends StatefulWidget {
  const LineChartScreen({Key? key}) : super(key: key);

  @override
  State<LineChartScreen> createState() => _LineChartScreenState();
}

class _LineChartScreenState extends State<LineChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LineChart(
        LineChartData(
          lineTouchData: LineTouchData(
            handleBuiltInTouches: true,
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
            ),
          ),
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            // show: false,
            // LTRB data tile. you can skip!
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 32,
                interval: 1,
                getTitlesWidget: (double value, TitleMeta meta) {
                  const style = TextStyle(
                    color: Color(0xff72719b),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  );
                  Widget text;
                  switch (value.toInt()) {
                    case 2:
                      text = const Text('Mon', style: style);
                      break;
                    case 7:
                      text = const Text('Tue', style: style);
                      break;
                    case 12:
                      text = const Text('Wed', style: style);
                      break;
                    default:
                      text = const Text('');
                      break;
                  }

                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    space: 10,
                    child: text,
                  );
                },
              ),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: false), //need to set false to hide titles
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                getTitlesWidget: (double value, TitleMeta meta) {
                  const style = TextStyle(
                    color: Color(0xff75729e),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  );
                  String text;
                  switch (value.toInt()) {
                    case 1:
                      text = '5';
                      break;
                    case 2:
                      text = '10';
                      break;
                    case 3:
                      text = '15';
                      break;
                    case 4:
                      text = '20';
                      break;
                    case 5:
                      text = '25';
                      break;
                    default:
                      return Container();
                  }

                  return Text(text, style: style, textAlign: TextAlign.center);
                },
                showTitles: true,
                interval: 1,
                reservedSize: 40,
              ),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: const Border(
              bottom: BorderSide(color: Color(0xff4e4965), width: 4),
              left: BorderSide(color: Colors.black, width: 0), // still visible
              right: BorderSide(
                  color: Colors.transparent), //to hide, set it transparent
              top: BorderSide(color: Colors.transparent),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              isCurved: false,
              color: Colors.amber,
              barWidth: 4,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
              spots: const [
                FlSpot(1, 1), //(x,y)
                FlSpot(3, 1.5),
                FlSpot(5, 1.4),
                FlSpot(7, 3.4),
                FlSpot(10, 2),
                FlSpot(12, 2.2),
                FlSpot(13, 1.8),
              ],
            ),
          ],
          minX: 0,
          maxX: 14,
          maxY: 4,
          minY: 0,
        ),
      ),
    );
  }
}

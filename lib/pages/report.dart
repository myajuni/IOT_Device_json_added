import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:project/resources/app_colors.dart';
import 'package:project/utils/extensions/color_ext.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _WeeklyBarChart extends StatelessWidget {
  LinearGradient get _barsGradient => LinearGradient(
        colors: [
          AppColors.contentColorBlue.darken(20),
          AppColors.contentColorCyan,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.4,
      child: BarChart(
        BarChartData(
          maxY: 25,
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
              leftTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                getTitlesWidget: (value, meta) {
                  const style = TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  );
                  String text;
                  // TODO: 일별로 바꾸려면 아래의 타이틀을 수정해야 하단 legend가 변경됨
                  switch (value.toInt()) {
                    case 0:
                      text = 'Mon';
                      break;
                    case 1:
                      text = 'Tue';
                      break;
                    case 2:
                      text = 'Wed';
                      break;
                    case 3:
                      text = 'Thu';
                      break;
                    case 4:
                      text = 'Fri';
                      break;
                    case 5:
                      text = 'Sat';
                      break;
                    case 6:
                      text = 'Sun';
                      break;
                    default:
                      text = '';
                      break;
                  }
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    space: 4,
                    child: Text(text, style: style),
                  );
                },
              ))),
          alignment: BarChartAlignment.spaceAround,
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              getTooltipColor: (group) => Colors.transparent,
              tooltipPadding: EdgeInsets.zero,
              tooltipMargin: 8,
              getTooltipItem: (
                BarChartGroupData group,
                int groupIndex,
                BarChartRodData rod,
                int rodIndex,
              ) {
                return BarTooltipItem(
                  rod.toY.round().toString(),
                  const TextStyle(
                    color: AppColors.contentColorCyan,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ),
          // TODO: 일별로 바꾸려면 하단의 데이터를 일 수 만큼 증가시켜야함
          barGroups: [
            BarChartGroupData(
                x: 0,
                barRods: [BarChartRodData(toY: 3, gradient: _barsGradient)]),
            BarChartGroupData(
                x: 1,
                barRods: [BarChartRodData(toY: 12, gradient: _barsGradient)]),
            BarChartGroupData(
                x: 2,
                barRods: [BarChartRodData(toY: 3, gradient: _barsGradient)]),
            BarChartGroupData(
                x: 3,
                barRods: [BarChartRodData(toY: 20, gradient: _barsGradient)]),
            BarChartGroupData(
                x: 4,
                barRods: [BarChartRodData(toY: 21, gradient: _barsGradient)]),
            BarChartGroupData(
                x: 5,
                barRods: [BarChartRodData(toY: 23, gradient: _barsGradient)]),
            BarChartGroupData(
                x: 6,
                barRods: [BarChartRodData(toY: 8, gradient: _barsGradient)]),
          ],
        ),
      ),
    );
  }
}

class _CompareBarChart extends StatelessWidget {
  LinearGradient get _barsGradient => LinearGradient(
        colors: [
          AppColors.contentColorBlue.darken(20),
          AppColors.contentColorCyan,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.4,
      child: BarChart(
        BarChartData(
          maxY: 25,
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
              leftTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                getTitlesWidget: (value, meta) {
                  const style = TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  );
                  String text;
                  switch (value.toInt()) {
                    case 0:
                      text = '일주일 총 사용량';
                      break;
                    case 1:
                      text = '일주일 평균 사용량';
                      break;
                    default:
                      text = '';
                      break;
                  }
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    space: 4,
                    child: Text(text, style: style),
                  );
                },
              ))),
          alignment: BarChartAlignment.spaceAround,
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              getTooltipColor: (group) => Colors.transparent,
              tooltipPadding: EdgeInsets.zero,
              tooltipMargin: 8,
              getTooltipItem: (
                BarChartGroupData group,
                int groupIndex,
                BarChartRodData rod,
                int rodIndex,
              ) {
                return BarTooltipItem(
                  rod.toY.round().toString(),
                  const TextStyle(
                    color: AppColors.contentColorCyan,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ),
          barGroups: [
            BarChartGroupData(
                x: 1,
                barRods: [BarChartRodData(toY: 12, gradient: _barsGradient)]),
            BarChartGroupData(
                x: 0,
                barRods: [BarChartRodData(toY: 3, gradient: _barsGradient)]),
            // BarChartGroupData(
            //     x: 2,
            //     barRods: [BarChartRodData(toY: 3, gradient: _barsGradient)]),
          ],
        ),
      ),
    );
  }
}

class _ReportPageState extends State<ReportPage> {
  Widget _buildAlertMessage() {
    return SizedBox(
      height: 60,
      child: Card(
        color: Colors.red.lighten(50),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
          child: Row(
            children: [
              const Icon(Icons.warning),
              const SizedBox(width: 16.0),
              const Text('이 기기는 점검이 필요해요'),
              Expanded(child: Container()),
              Text('확인 하기', style: TextStyle(color: Colors.blue.darken())),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
            child: Text(
              '10월 리포트',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
            child: Column(
              children: [
                Card(
                  color: Colors.black,
                  elevation: 16.0,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        const Text(
                          '요일별 에너지 사용량',
                          style: TextStyle(color: Colors.white),
                        ),
                        _WeeklyBarChart()
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12.0),
                Card(
                  color: Colors.black,
                  elevation: 16.0,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        const Text(
                          '일주일 사용량 비교',
                          style: TextStyle(color: Colors.white),
                        ),
                        _CompareBarChart()
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12.0),
                // _buildAlertMessage(),
                const SizedBox(height: 12.0),
              ],
            ),
          )
        ],
      ),
    );
  }
}

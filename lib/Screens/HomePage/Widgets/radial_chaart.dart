// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
//
// class RadialChart extends StatelessWidget {
//   const RadialChart({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         SfCircularChart(
//             title: ChartTitle(text: 'Sales by sales person'),
//             legend: Legend(isVisible: true),
//             palette: [Colors.red,Colors.blue,Colors.yellow,Colors.purpleAccent],
//             series: <RadialBarSeries<_SalesData, String>>[
//               RadialBarSeries<_SalesData, String>(
//                 //explode: true,
//                 //explodeIndex: 0,
//                   dataSource: data,
//                   xValueMapper: (_SalesData data, _) => data.year,
//                   yValueMapper: (_SalesData data, _) => data.sales,
//                   //dataLabelMapper: (_SalesData data, _) => data.text,
//                   dataLabelSettings: DataLabelSettings(isVisible: true)),
//             ]
//         )
//     );
//   }
// }

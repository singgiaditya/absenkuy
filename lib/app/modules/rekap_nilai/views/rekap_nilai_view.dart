import 'package:absenkuy/app/data/model/nilai.dart';
import 'package:flutter/material.dart';
import 'package:absenkuy/app/global/theme/my_text_style.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controllers/rekap_nilai_controller.dart';

class RekapNilaiView extends GetView<RekapNilaiController> {
  const RekapNilaiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<NilaiChart> chartData = [
      NilaiChart(Semester: 1, rataRata: 75),
      NilaiChart(Semester: 2, rataRata: 78),
      NilaiChart(Semester: 3, rataRata: 80),
      NilaiChart(Semester: 4, rataRata: 75),
      NilaiChart(Semester: 5, rataRata: 85),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Rekap Nilai',
            style: headingTextStyle,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        title: ChartTitle(text: 'Nilai Rata-Rata Tiap Semester'),
                        series: <LineSeries<NilaiChart, String>>[
                      LineSeries<NilaiChart, String>(
                          dataSource: chartData,
                          xValueMapper: (NilaiChart nilai, _) =>
                              "${nilai.Semester}",
                          yValueMapper: (NilaiChart nilai, _) =>
                              nilai.rataRata,
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true))
                    ])),
                    SizedBox(height: 20,),
                    Text("Semester :", style: titleTextStyle.copyWith(fontWeight: FontWeight.w500),),
                    SizedBox(height: 20,),
                    SizedBox(
                      width: Get.size.width - 14,
                      height: 50 * 8,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          DataTable(
                        columns: <DataColumn>[
                        DataColumn(label: Expanded(child: Text("Mapel"))),
                        DataColumn(label: Expanded(child: Text("Tugas"))),
                        DataColumn(label: Expanded(child: Text("UTS"))),
                        DataColumn(label: Expanded(child: Text("UAS"))),
                        DataColumn(label: Expanded(child: Text("Rata-Rata"))),
                      ], rows: <DataRow> [
                        DataRow(cells: <DataCell> [
                          DataCell(Text("Matematika", style: normalTextStyle,)),
                          DataCell(Text("75", style: normalTextStyle,)),
                          DataCell(Text("80", style: normalTextStyle,)),
                          DataCell(Text("78", style: normalTextStyle,)),
                          DataCell(Text("75", style: normalTextStyle,)),
                        ]),
                        DataRow(cells: <DataCell> [
                          DataCell(Text("Matematika", style: normalTextStyle,)),
                          DataCell(Text("75", style: normalTextStyle,)),
                          DataCell(Text("80", style: normalTextStyle,)),
                          DataCell(Text("78", style: normalTextStyle,)),
                          DataCell(Text("75", style: normalTextStyle,)),
                        ]),
                        DataRow(cells: <DataCell> [
                          DataCell(Text("Matematika", style: normalTextStyle,)),
                          DataCell(Text("75", style: normalTextStyle,)),
                          DataCell(Text("80", style: normalTextStyle,)),
                          DataCell(Text("78", style: normalTextStyle,)),
                          DataCell(Text("75", style: normalTextStyle,)),
                        ]),
                        DataRow(cells: <DataCell> [
                          DataCell(Text("Matematika", style: normalTextStyle,)),
                          DataCell(Text("75", style: normalTextStyle,)),
                          DataCell(Text("80", style: normalTextStyle,)),
                          DataCell(Text("78", style: normalTextStyle,)),
                          DataCell(Text("75", style: normalTextStyle,)),
                        ]),
                        DataRow(cells: <DataCell> [
                          DataCell(Text("Matematika", style: normalTextStyle,)),
                          DataCell(Text("75", style: normalTextStyle,)),
                          DataCell(Text("80", style: normalTextStyle,)),
                          DataCell(Text("78", style: normalTextStyle,)),
                          DataCell(Text("75", style: normalTextStyle,)),
                        ]),
                        DataRow(cells: <DataCell> [
                          DataCell(Text("Matematika", style: normalTextStyle,)),
                          DataCell(Text("75", style: normalTextStyle,)),
                          DataCell(Text("80", style: normalTextStyle,)),
                          DataCell(Text("78", style: normalTextStyle,)),
                          DataCell(Text("75", style: normalTextStyle,)),
                        ]),
                        DataRow(cells: <DataCell> [
                          DataCell(Text("Matematika", style: normalTextStyle,)),
                          DataCell(Text("75", style: normalTextStyle,)),
                          DataCell(Text("80", style: normalTextStyle,)),
                          DataCell(Text("78", style: normalTextStyle,)),
                          DataCell(Text("75", style: normalTextStyle,)),
                        ]),
                      ]
                      
                      )
                        ],
                      ),
                    )
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tarim_app/model/manure.dart';
import 'package:tarim_app/services/api_service.dart';
import 'package:tarim_app/services/file_service.dart';

import 'manure_sharing_page.dart';

class ManureListPage extends StatefulWidget {
  const ManureListPage({Key? key}) : super(key: key);

  @override
  State<ManureListPage> createState() => _ManureListPageState();
}

class _ManureListPageState extends State<ManureListPage> {

  ApiService _apiService = ApiService();
  double dolar = 0;

  FileService _fileService = FileService();
  String file = "bos";

  @override
  void initState() {
    super.initState();
    _apiService.fetchModel().then((value) {
      if(value != null){
        setState(() {
          dolar = double.parse(value.fiyat.toString());
        });
      }
    });
    _fileService.readGubre().then((value) {
      setState(() {
          file = value;
      });
    });

  }

  List<ManureModel> getUre(){
    final List<ManureModel> data = [
        ManureModel(fiyat: 1500 , yil: 2016),
        ManureModel(fiyat: 1800, yil: 2017),
        ManureModel(fiyat: 2000, yil: 2018),
        ManureModel(fiyat: 2250, yil: 2019),
        ManureModel(fiyat: 3000, yil: 2020),
        ManureModel(fiyat: 4000, yil: 2021),
        ManureModel(fiyat: 15000, yil: 2022)
    ];
    return data;
  }
  List<ManureModel> getDap(){
    final List<ManureModel> data = [
      ManureModel(fiyat: 1300, yil: 2016),
      ManureModel(fiyat: 1500, yil: 2017),
      ManureModel(fiyat: 1800, yil: 2018),
      ManureModel(fiyat: 2000, yil: 2019),
      ManureModel(fiyat: 2500, yil: 2020),
      ManureModel(fiyat: 3500, yil: 2021),
      ManureModel(fiyat: 12000, yil: 2022)
    ];
    return data;
  }
  List<ManureModel> getN(){
    final List<ManureModel> data = [
      ManureModel(fiyat: 1100, yil: 2016),
      ManureModel(fiyat: 2000, yil: 2017),
      ManureModel(fiyat: 2500, yil: 2018),
      ManureModel(fiyat: 2500, yil: 2019),
      ManureModel(fiyat: 3250, yil: 2020),
      ManureModel(fiyat: 3700, yil: 2021),
      ManureModel(fiyat: 11500, yil: 2022)
    ];
    return data;
  }

  late List<ManureModel> _dataUre = getUre();
  late List<ManureModel> _dataDap = getDap();
  late List<ManureModel> _dataN = getN();
  late TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gübre"),
      ),
      floatingActionButton: Visibility(
        visible: true,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ManureSharingPage()
                )
            );
          },
          child: Icon(Icons.add),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text("Dolar Kur : $dolar"),
            SizedBox(height: 10,),
            SfCartesianChart(
              title: ChartTitle(text: "Yıllara göre gübre fiyatları"),
              legend: Legend(isVisible: true),
              tooltipBehavior: _tooltipBehavior,
              series: [
                LineSeries<ManureModel, double>(
                    name: 'Üre',
                    dataSource: _dataUre,
                    xValueMapper: (ManureModel manure, _) => manure.yil,
                    yValueMapper: (ManureModel manure, _) => manure.fiyat,
                    color: Colors.red,
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                    enableTooltip: true),
                LineSeries<ManureModel, double>(
                    name: 'Dap',
                    dataSource: _dataDap,
                    color: Colors.green,
                    xValueMapper: (ManureModel manure, _) => manure.yil,
                    yValueMapper: (ManureModel manure, _) => manure.fiyat,
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                    enableTooltip: true),
                LineSeries<ManureModel, double>(
                    name: 'N',
                    dataSource: _dataN,
                    xValueMapper: (ManureModel manure, _) => manure.yil,
                    color: Colors.blue,
                    yValueMapper: (ManureModel manure, _) => manure.fiyat,
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                    enableTooltip: true)
              ],
              primaryXAxis: NumericAxis(
                edgeLabelPlacement: EdgeLabelPlacement.shift,
              ),
              primaryYAxis: NumericAxis(
                labelFormat: '{value}TL',
              ),
            ),
            SizedBox(height: 10,),
            Text("Text ${file}"),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartsPage extends StatelessWidget {
  final List<charts.Series<Task,String>> _seriesPieDatos = List<charts.Series<Task,String>>();
  final List<charts.Series<Pollution,String>> _seriesBarDatos = List<charts.Series<Pollution,String>>();
  final List<charts.Series<Sales,int>> _seriesLineDatos = List<charts.Series<Sales,int>>();

  @override
  Widget build(BuildContext context) {
    _generarDatos();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.pie_chart),),
              Tab(icon: Icon(Icons.insert_chart),),
              Tab(icon: Icon(Icons.show_chart),),
            ],
          ),
          title: Text('Charts'),
        ),
        body: TabBarView(
          children: [
            //Pie Chart
            charts.PieChart(
              _seriesPieDatos,
              animate: true,
              animationDuration: Duration(milliseconds: 500),
              behaviors: [
                new charts.DatumLegend(
                  outsideJustification: charts.OutsideJustification.endDrawArea,
                  horizontalFirst: false,
                  desiredMaxRows: 2,
                  cellPadding: EdgeInsets.only(right: 4.0, bottom: 4.0),
                  entryTextStyle: charts.TextStyleSpec(
                    color: charts.MaterialPalette.purple.shadeDefault,
                    fontSize: 11
                  )
                )
              ],
              defaultRenderer:  charts.ArcRendererConfig(
                arcWidth: 100,
                arcRendererDecorators: [
                  charts.ArcLabelDecorator(
                    labelPosition: charts.ArcLabelPosition.inside
                  )
                ]
              ),
            ),

            //Bar Chart
            charts.BarChart(
              _seriesBarDatos,
              animate: true,
              animationDuration: Duration(milliseconds: 500),
              barGroupingType: charts.BarGroupingType.grouped,
            ),

            //Line Chart
            charts.LineChart(
              _seriesLineDatos,
              animate: true,
              animationDuration: Duration(milliseconds: 500),
              defaultRenderer: charts.LineRendererConfig(includeArea: true, stacked: false),
              behaviors: [
                charts.ChartTitle(
                  'Años',
                  behaviorPosition: charts.BehaviorPosition.bottom,
                  titleOutsideJustification: charts.OutsideJustification.middleDrawArea
                ),
                charts.ChartTitle(
                  'Ventas',
                  behaviorPosition: charts.BehaviorPosition.start,
                  titleOutsideJustification: charts.OutsideJustification.middleDrawArea
                ),
                charts.ChartTitle(
                  'Departamentos',
                  behaviorPosition: charts.BehaviorPosition.end,
                  titleOutsideJustification: charts.OutsideJustification.middleDrawArea
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _generarDatos() {
    // Generar datos para el line chart
    final lineas1 = [
      new Sales(0, 21),
      new Sales(1, 25),
      new Sales(2, 28),
      new Sales(3, 31),
      new Sales(4, 36),
      new Sales(5, 39),
    ];
    
    final lineas2 = [
      new Sales(0, 50),
      new Sales(1, 58),
      new Sales(2, 48),
      new Sales(3, 33),
      new Sales(4, 23),
      new Sales(5, 10),
    ];

    final lineas3 = [
      new Sales(0, 27),
      new Sales(1, 36),
      new Sales(2, 39),
      new Sales(3, 44),
      new Sales(4, 48),
      new Sales(5, 69),
    ];

    _seriesLineDatos.add(
      charts.Series(
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.orangeAccent),
        id: 'Ventas Jeje',
        data: lineas1,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
      )
    );

    _seriesLineDatos.add(
      charts.Series(
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.purpleAccent),
        id: 'Ventas Jaja',
        data: lineas2,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
      )
    );

    _seriesLineDatos.add(
      charts.Series(
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.greenAccent),
        id: 'Ventas Jojo',
        data: lineas3,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
      )
    );

    // Generar datos para el pie chart
    final datos1 = [
      new Pollution(1980, 'USA', 50),
      new Pollution(1980, 'Asia', 40),
      new Pollution(1980, 'Europa', 35),
      new Pollution(1980, 'Argentina', 20),
    ];

    final datos2 = [
      new Pollution(1985, 'USA', 100),
      new Pollution(1980, 'Asia', 80),
      new Pollution(1985, 'Europa', 45),
      new Pollution(1980, 'Argentina', 30),
    ];

    final datos3 = [
      new Pollution(1980, 'USA', 150),
      new Pollution(1980, 'Asia', 120),
      new Pollution(1980, 'Europa', 70),
      new Pollution(1980, 'Argentina', 25),
    ];

    _seriesBarDatos.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2017',
        data: datos1,
        fillPatternFn: (_, __)=> charts.FillPatternType.forwardHatch,
        fillColorFn: (Pollution pollution, _) => charts.ColorUtil.fromDartColor(Colors.purpleAccent)
      )
    );
    _seriesBarDatos.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2018',
        data: datos2,
        fillPatternFn: (_, __)=> charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) => charts.ColorUtil.fromDartColor(Colors.greenAccent)
      )
    );
    _seriesBarDatos.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2019',
        data: datos3,
        fillPatternFn: (_, __)=> charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) => charts.ColorUtil.fromDartColor(Colors.blueAccent)
      )
    );

    // Generar datos para el pie chart
    final pieDatos = [
      new Task('Tarea 1', 23.2, Colors.red),
      new Task('Tarea 2', 32.1, Colors.blue),
      new Task('Tarea 3', 33.5, Colors.purple),
      new Task('Tarea 4', 12.8, Colors.pink),
      new Task('Tarea 5', 27.2, Colors.green),
    ];

    _seriesPieDatos.add(
      charts.Series(
        id: 'Lista de tareas',
        data: pieDatos,
        domainFn:   (Task task,_) => task.task,
        measureFn:  (Task task,_) => task.taskValue,
        colorFn:    (Task task,_) => charts.ColorUtil.fromDartColor(task.colorValue),
        labelAccessorFn: (Task row,_) => '${row.taskValue}'
      )
    );
  }
}

class Task {
  String task;
  double taskValue;
  Color colorValue;

  Task(this.task, this.taskValue, this.colorValue);
}

class Pollution{
  String place;
  int year;
  int quantity;

  Pollution(this.year, this.place, this.quantity);
}

class Sales{
  int year;
  int sales;

  Sales(this.year, this.sales);
}
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  late List<ExpenseData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getchartData();
    _tooltipBehavior = TooltipBehavior(enable: true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: double.infinity,
          width: MediaQuery.of(context).size.width * 0.40,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: SfCartesianChart(
                    title: ChartTitle(text: 'Monthly Sales'),
                    legend: Legend(isVisible: true),
                    tooltipBehavior: _tooltipBehavior,
                    series: <ChartSeries>[
                      StackedAreaSeries<ExpenseData, String>(
                          dataSource: _chartData,
                          xValueMapper: (ExpenseData exp, _) =>
                              exp.expenseCategory,
                          yValueMapper: (ExpenseData exp, _) => exp.father,
                          name: 'VIP Milk Tea',
                          markerSettings:
                              const MarkerSettings(isVisible: true)),
                      StackedAreaSeries<ExpenseData, String>(
                          dataSource: _chartData,
                          xValueMapper: (ExpenseData exp, _) =>
                              exp.expenseCategory,
                          yValueMapper: (ExpenseData exp, _) => exp.mother,
                          name: 'Burger Ahoy',
                          markerSettings:
                              const MarkerSettings(isVisible: true)),
                      StackedAreaSeries<ExpenseData, String>(
                          dataSource: _chartData,
                          xValueMapper: (ExpenseData exp, _) =>
                              exp.expenseCategory,
                          yValueMapper: (ExpenseData exp, _) => exp.son,
                          name: 'Red Meat',
                          markerSettings:
                              const MarkerSettings(isVisible: true)),
                      StackedAreaSeries<ExpenseData, String>(
                          dataSource: _chartData,
                          xValueMapper: (ExpenseData exp, _) =>
                              exp.expenseCategory,
                          yValueMapper: (ExpenseData exp, _) => exp.daughter,
                          name: 'Angs Pares',
                          markerSettings:
                              const MarkerSettings(isVisible: true)),
                    ],
                    primaryXAxis: CategoryAxis(),
                  ),
                ),
              ),
            ],
          ),
        ),
        Card(
          child: SizedBox(
            height: double.infinity,
            width: MediaQuery.of(context).size.width * 0.59,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DataTable2(
                sortAscending: true,
                columnSpacing: 12,
                horizontalMargin: 12,
                minWidth: 600,
                columns: [
                  DataColumn(
                    onSort: (i, b) {},
                    label: const Text('Product Name'),
                  ),
                  const DataColumn(
                    label: Text('Product Description'),
                  ),
                  const DataColumn(
                    label: Text('Quantity'),
                  ),
                  const DataColumn(
                    label: Text('Price'),
                  ),
                ],
                rows: List<DataRow>.generate(
                  15,
                  (index) => DataRow(
                    cells: [
                      DataCell(Text('P' * (10 - (index + 5) % 10))),
                      DataCell(Text('B' * (10 - (index + 5) % 10))),
                      DataCell(Text('C' * (15 - (index + 5) % 10))),
                      DataCell(Text('D' * (15 - (index + 10) % 10))),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

List<ExpenseData> getchartData() {
  final List<ExpenseData> chartData = [
    ExpenseData('Jan', 20, 40, 45, 60),
    ExpenseData('Feb', 30, 31, 45, 65),
    ExpenseData('Mar', 40, 40, 5, 70),
    ExpenseData('Apr', 50, 56, 45, 66),
    ExpenseData('May', 60, 20, 11, 56),
    ExpenseData('Jun', 70, 22, 56, 40),
  ];
  return chartData;
}

class ExpenseData {
  final String expenseCategory;
  final num father;
  final num mother;
  final num son;
  final num daughter;

  ExpenseData(
      this.expenseCategory, this.father, this.mother, this.son, this.daughter);
}

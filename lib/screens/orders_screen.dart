import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';

class OrdersScreen extends StatefulWidget {
  static const routeName = '/orders';

  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final TextEditingController _date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Row(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('ONLINE'),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('OFFLINE'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(border: Border.all(width: 0.1)),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20, bottom: 10, right: 20),
                  child: TextField(
                    controller: _date,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.calendar_today_rounded),
                        labelText: 'Select Date'),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101));

                      if (pickedDate != null) {
                        setState(() {
                          _date.text =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                        });
                      }
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.4,
              child: ListView.builder(
                itemCount: orderData.orders.length,
                itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
              ),
            ),
          ],
        ),
        SizedBox(
          height: double.infinity,
          width: MediaQuery.of(context).size.width * 0.585,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              elevation: 2,
              child: DataTable2(
                sortAscending: true,
                columnSpacing: 12,
                horizontalMargin: 12,
                minWidth: 600,
                columns: [
                  DataColumn(
                    onSort: (i, b) {},
                    label: const Text('Order ID'),
                  ),
                  const DataColumn(
                    label: Text('Date'),
                  ),
                  const DataColumn(
                    label: Text('Sale'),
                  ),
                  const DataColumn(
                    label: Text('Items'),
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

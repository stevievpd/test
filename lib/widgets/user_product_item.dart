import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  final String title;

  const UserProductItem(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {},
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {},
              color: Theme.of(context).errorColor,
            ),
          ],
        ),
      ),
    );
  }
}

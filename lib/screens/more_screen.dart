// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 300, right: 300),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Welcome Back',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Text(
                  'My Business',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 300,
                height: 80,
                child: Padding(
                  padding: EdgeInsets.only(top: 1),
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    label: Text(
                      'Orders',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    icon: Icon(Icons.shopping_basket),
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                height: 80,
                child: Padding(
                  padding: EdgeInsets.only(top: 1),
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    label: Text(
                      'Reports',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    icon: Icon(Icons.bar_chart),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 300,
                height: 80,
                child: Padding(
                  padding: EdgeInsets.only(top: 1),
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    label: Text(
                      'Items',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    icon: Icon(Icons.inventory),
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                height: 80,
                child: Padding(
                  padding: EdgeInsets.only(top: 1),
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    label: Text(
                      'Customers',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    icon: Icon(Icons.person),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 300,
                height: 80,
                child: Padding(
                  padding: EdgeInsets.only(top: 1),
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    label: Text(
                      'Add-ons',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    icon: Icon(Icons.qr_code_2),
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                height: 80,
                child: Padding(
                  padding: EdgeInsets.only(top: 1),
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    label: Text(
                      'Rewards & Referrals',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    icon: Icon(Icons.reviews_sharp),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 300,
                height: 80,
                child: Padding(
                  padding: EdgeInsets.only(top: 1),
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    label: Text(
                      'Settings',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    icon: Icon(Icons.shopping_basket),
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                height: 80,
                child: Padding(
                  padding: EdgeInsets.only(top: 1),
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    label: Text(
                      'About',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    icon: Icon(Icons.shopping_basket),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

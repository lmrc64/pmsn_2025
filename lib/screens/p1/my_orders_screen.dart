import 'package:flutter/material.dart';
import 'package:pmsn_2025/views/item_order_view.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 50, left: 30, right: 30),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Color(0xFFECF0F4),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.chevron_left,
                      color: Color(0xFF181C2E),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Text(
                  'My orders',
                  style: TextStyle(
                    color: Color(0xFF181C2E),
                    fontFamily: 'Sen',
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  width: 145,
                ),
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Color(0xFFECF0F4),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.more_horiz,
                    color: Color(0xFF181C2E),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    'Ongoing',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFA5A7B9),
                      fontFamily: 'Sen',
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'History',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFB6D3A),
                      fontFamily: 'Sen',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    color: Color(0xFFA5A7B9),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 1.5,
                    color: Color(0xFFFB6D3A),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ItemOrderView(
              category: 'Food',
              status: true,
              image:
                  'https://static.vecteezy.com/system/resources/previews/007/404/906/non_2x/slice-of-pizza-cartoon-cartoon-illustration-cartoon-clipart-free-vector.jpg',
              name: 'Pizza Hut',
              id: 162432,
              price: 35.25,
              date: '29 JAN',
              time: '12:30',
              items: 3,
            ),
            ItemOrderView(
              category: 'Drink',
              status: true,
              image:
                  'https://i.pinimg.com/736x/21/49/da/2149da8d423d15b8d922159363b3208f.jpg',
              name: 'McDonald',
              id: 242432,
              price: 40.15,
              date: '30 JAN',
              time: '12:30',
              items: 2,
            ),
            ItemOrderView(
              category: 'Drink',
              status: false,
              image:
                  'https://img.freepik.com/vector-premium/dibujo-taza-cafe-starbucks-pajita-ella_1166763-26517.jpg',
              name: 'Starbucks',
              id: 240112,
              price: 10.20,
              date: '30 JAN',
              time: '12:30',
              items: 1,
            ),
          ],
        ),
      ),
    );
  }
}

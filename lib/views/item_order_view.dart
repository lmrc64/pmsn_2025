import 'package:flutter/material.dart';

class ItemOrderView extends StatelessWidget {
  final String category;
  final bool status;
  final String image;
  final String name;
  final int id;
  final double price;
  final String date;
  final String time;
  final int items;

  const ItemOrderView(
      {super.key,
      required this.category,
      required this.status,
      required this.image,
      required this.name,
      required this.id,
      required this.price,
      required this.date,
      required this.time,
      required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                category,
                style: TextStyle(
                  color: Color(0xFF181C2E),
                  fontFamily: 'Sen',
                  fontSize: 14,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              status
                  ? Text(
                      'Completed',
                      style: TextStyle(
                        color: Color(0xFF059C6A),
                        fontFamily: 'Sen',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    )
                  : Text(
                      'Canceled',
                      style: TextStyle(
                        color: Color(0xFFFF0000),
                        fontFamily: 'Sen',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFEEF2F6),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  image,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              /*Icon(
                Icons.local_pizza,
                size: 60,
              ),*/
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          color: Color(0xFF181C2E),
                          fontFamily: 'Sen',
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        width: 130,
                      ),
                      Text(
                        '#${id.toString()}',
                        style: TextStyle(
                          color: Color(0xFF6B6E82),
                          fontFamily: 'Sen',
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        '\$${price.toString()}',
                        style: TextStyle(
                          color: Color(0xFF181C2E),
                          fontFamily: 'Sen',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '   |   $date, $time  *  ${items.toString()} Items',
                        style: TextStyle(
                          color: Color(0xFF6B6E82),
                          fontFamily: 'Sen',
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Container(
                height: 38,
                width: 139,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFFF7622),
                    ),
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    'Rate',
                    style: TextStyle(
                      color: Color(0xFFFF7622),
                      fontFamily: 'Sen',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 50,
              ),
              Container(
                height: 38,
                width: 139,
                decoration: BoxDecoration(
                    color: Color(0xFFFF7622),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    'Re-Order',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontFamily: 'Sen',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
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

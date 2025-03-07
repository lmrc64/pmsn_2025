import 'package:flutter/material.dart';

class ItemRestaurantView extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  final double grade;
  final String delivery;
  final int minutes;

  const ItemRestaurantView({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.grade,
    required this.delivery,
    required this.minutes,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
              width: MediaQuery.of(context).size.width,
              height: 140,
              fit: BoxFit.cover,
              image),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          name,
          style: TextStyle(
            color: Color(0xFF181C2E),
            fontFamily: 'Sen',
            fontSize: 20,
          ),
        ),
        Text(
          description,
          style: TextStyle(
            color: Color(0xFFA0A5BA),
            fontFamily: 'Sen',
            fontSize: 14,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Icon(
              Icons.star_border_outlined,
              color: Color(0xFFFF7622),
            ),
            Text(
              grade.toString(),
              style: TextStyle(
                color: Color(0xFF181C2E),
                fontFamily: 'Sen',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.delivery_dining_outlined,
              color: Color(0xFFFF7622),
            ),
            Text(
              delivery,
              style: TextStyle(
                color: Color(0xFF181C2E),
                fontFamily: 'Sen',
                fontSize: 14,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.punch_clock_outlined,
              color: Color(0xFFFF7622),
            ),
            Text(
              '${minutes.toString()} min',
              style: TextStyle(
                color: Color(0xFF181C2E),
                fontFamily: 'Sen',
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

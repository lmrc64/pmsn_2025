import 'package:flutter/material.dart';

class ItemFoodCategoryView extends StatelessWidget {
  final String category;
  final double startingPrice;
  final String image;

  const ItemFoodCategoryView(
      {super.key,
      required this.category,
      required this.startingPrice,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(55),
              blurRadius: 6,
              spreadRadius: 3,
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              image,
              height: 108,
              width: 108,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            category,
            style: TextStyle(
                color: Color(0xFF32343E),
                fontFamily: 'Sen',
                fontSize: 18,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                'Starting',
                style: TextStyle(
                  color: Color(0xFF646982),
                  fontFamily: 'Sen',
                  fontSize: 14,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                '\$${startingPrice.toString()}',
                style: TextStyle(
                  color: Color(0xFF32343E),
                  fontFamily: 'Sen',
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

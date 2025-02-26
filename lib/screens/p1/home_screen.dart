import 'package:flutter/material.dart';
import 'package:pmsn_2025/views/item_food_category_view.dart';
import 'package:pmsn_2025/views/item_restaurant_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 60, left: 30, right: 30),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/profile");
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color(0xFFECF0F4),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.menu,
                        color: Color(0xFF181C2E),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'DELIVER TO',
                          style: TextStyle(
                            color: Color(0xFFFC6E2A),
                            fontFamily: 'Sen',
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Row(children: [
                          Text(
                            'Halal Lab office',
                            style: TextStyle(
                              color: Color(0xFF676767),
                              fontFamily: 'Sen',
                              fontSize: 14,
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down_sharp,
                            color: Color(0xFF181C2E),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/my_orders");
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Sen',
                      fontSize: 16,
                      color: Color(0xFF1E1D1D),
                    ),
                    children: [
                      TextSpan(
                        text: 'Hey Halal, ',
                      ),
                      TextSpan(
                        text: 'Good Afternoon!',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SearchBar(
                backgroundColor: WidgetStateProperty.all(Color(0xFFF6F6F6)),
                hintStyle: WidgetStateProperty.all(
                  TextStyle(
                    color: Color(0xFF676767),
                    fontFamily: 'Sen',
                    fontSize: 14,
                  ),
                ),
                leading: Icon(
                  Icons.search,
                  color: Color(0xFFA0A5BA),
                ),
                hintText: 'Search dishes, restaurants',
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  Text(
                    'All Categories',
                    style: TextStyle(
                      color: Color(0xFF32343E),
                      fontFamily: 'Sen',
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 120,
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontFamily: 'Sen',
                      fontSize: 16,
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Color(0xFFA0A5BA),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      ItemFoodCategoryView(
                        category: 'Pizza',
                        startingPrice: 70,
                        image:
                            'https://static.vecteezy.com/system/resources/previews/007/404/906/non_2x/slice-of-pizza-cartoon-cartoon-illustration-cartoon-clipart-free-vector.jpg',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ItemFoodCategoryView(
                        category: 'Burger',
                        startingPrice: 50,
                        image:
                            'https://media.istockphoto.com/id/1396724246/es/vector/delicioso-dise%C3%B1o-de-ilustraci%C3%B3n-vectorial-de-hamburguesas.jpg?s=612x612&w=0&k=20&c=Ca0vT2THJnoMLSQ9xkuwdLs6dTOMD6yTtCb3SdZ9_Ek=',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ItemFoodCategoryView(
                        category: 'Tacos',
                        startingPrice: 10,
                        image:
                            'https://img.freepik.com/vector-gratis/vector-comida-mexicana-taco-tradicional-dibujado-mano_53876-161373.jpg',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Text(
                    'Open Restaurants',
                    style: TextStyle(
                      color: Color(0xFF32343E),
                      fontFamily: 'Sen',
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 85,
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontFamily: 'Sen',
                      fontSize: 16,
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Color(
                      0xFFA0A5BA,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ItemRestaurantView(
                image:
                    'https://assets.bonappetit.com/photos/61ba70da510874520d257b78/16:9/w_2560%2Cc_limit/LEDE_Oma\'s%2520Hideaway%2C%2520Credit%2520Christine%2520Dong.jpg',
                name: 'Rose Garden Restaurant',
                description: 'Burger - Chicken - Riche - Wings',
                grade: 4.7,
                delivery: 'Free',
                minutes: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

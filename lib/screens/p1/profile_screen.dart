import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 50, left: 30, right: 30),
          child: Column(
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
                    'Profile',
                    style: TextStyle(
                      color: Color(0xFF181C2E),
                      fontFamily: 'Sen',
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    width: 170,
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
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Color(0xFFFFC6AE),
                    backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Vishal Khadok',
                        style: TextStyle(
                          color: Color(0xFF32343E),
                          fontFamily: 'Sen',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'I love fast food',
                        style: TextStyle(
                          color: Color(0xFFA0A5BA),
                          fontFamily: 'Sen',
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFF6F8FA),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.person_outlined,
                              color: Color(0xFFFB6F3D),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Personal Info',
                            style: TextStyle(
                              color: Color(0xFF32343E),
                              fontFamily: 'Sen',
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 105),
                          Icon(
                            Icons.chevron_right,
                            color: Color(0xFF747783),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.map_outlined,
                              color: Color(0xFF413DFB),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Addresses',
                            style: TextStyle(
                              color: Color(0xFF32343E),
                              fontFamily: 'Sen',
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 135),
                          Icon(
                            Icons.chevron_right,
                            color: Color(0xFF747783),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFF6F8FA),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.shopping_bag_outlined,
                              color: Color(0xFF369BFF),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Cart',
                            style: TextStyle(
                              color: Color(0xFF32343E),
                              fontFamily: 'Sen',
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 175),
                          Icon(
                            Icons.chevron_right,
                            color: Color(0xFF747783),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.favorite_outline,
                              color: Color(0xFFB33DFB),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Favourite',
                            style: TextStyle(
                              color: Color(0xFF32343E),
                              fontFamily: 'Sen',
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 135),
                          Icon(
                            Icons.chevron_right,
                            color: Color(0xFF747783),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.notifications_outlined,
                              color: Color(0xFFFFAA2A),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Notifications',
                            style: TextStyle(
                              color: Color(0xFF32343E),
                              fontFamily: 'Sen',
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 108),
                          Icon(
                            Icons.chevron_right,
                            color: Color(0xFF747783),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.credit_card_outlined,
                              color: Color(0xFF369BFF),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Payment Method',
                            style: TextStyle(
                              color: Color(0xFF32343E),
                              fontFamily: 'Sen',
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 76),
                          Icon(
                            Icons.chevron_right,
                            color: Color(0xFF747783),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFF6F8FA),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.help_outline,
                              color: Color(0xFFFB6D3A),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'FAQs',
                            style: TextStyle(
                              color: Color(0xFF32343E),
                              fontFamily: 'Sen',
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 168),
                          Icon(
                            Icons.chevron_right,
                            color: Color(0xFF747783),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.face,
                              color: Color(0xFF2AE1E1),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'User Reviews',
                            style: TextStyle(
                              color: Color(0xFF32343E),
                              fontFamily: 'Sen',
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 107),
                          Icon(
                            Icons.chevron_right,
                            color: Color(0xFF747783),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.settings_outlined,
                              color: Color(0xFF413DFB),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Settings',
                            style: TextStyle(
                              color: Color(0xFF32343E),
                              fontFamily: 'Sen',
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 145),
                          Icon(
                            Icons.chevron_right,
                            color: Color(0xFF747783),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFF6F8FA),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.exit_to_app_outlined,
                              color: Color(0xFFFB4A59),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Log Out',
                            style: TextStyle(
                              color: Color(0xFF32343E),
                              fontFamily: 'Sen',
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 145),
                          Icon(
                            Icons.chevron_right,
                            color: Color(0xFF747783),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

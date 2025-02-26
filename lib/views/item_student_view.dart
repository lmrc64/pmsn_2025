import 'package:flutter/material.dart';

class ItemStudentView extends StatelessWidget {
  const ItemStudentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      //width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        //color: Colors.lightBlueAccent,
        border: Border.all(color: Color(0xFF006BD8)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Expanded(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
              ),
              title: Text('Rubensin Torres Frias'),
              subtitle: Text('No. Control: 01031351'),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.13,
            decoration: const BoxDecoration(
              color: Color(0xFFEDF3FF),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Table(
                    children: const [
                      TableRow(
                        children: [
                          Center(child: Text('Semestre')),
                          Center(child: Text('Clave Materia')),
                          Center(child: Text('Grupo')),
                        ],
                      ),
                      TableRow(
                        children: [
                          Center(child: Text('6')),
                          Center(child: Text('DM13')),
                          Center(child: Text('B')),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'INGENIERÍA EN SISTEMAS COMPUTACIONALES',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

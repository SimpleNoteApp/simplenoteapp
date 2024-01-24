import 'package:flutter/material.dart';
import 'package:simplenoteapp/types/notate.type.dart';

class NotationCard extends StatelessWidget {
  final Notate notate;

  NotationCard({super.key, required this.notate});

  @override
  Widget build(context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Align(
      alignment: Alignment.centerLeft,
      widthFactor: screenHeight,
      heightFactor: 0.9,
      child: Row(children: [
        SizedBox(
          width: screenWidth > 800
              ? screenWidth * .6
              : screenWidth * .25, // specify the width
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notate.name,
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              // SizedBox(height: 10.0),
              Text(
                notate.description,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.edit),
                      label: Text("Edit")),
                ),
                ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.delete),
                    label: Text("Delete")),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

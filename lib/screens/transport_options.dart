// ignore_for_file: prefer_const_constructors

import 'package:carbon_counter/constants/constants.dart';
import 'package:flutter/material.dart';

class TransportOptions extends StatefulWidget {
  TransportOptions({Key? key}) : super(key: key);

  @override
  State<TransportOptions> createState() => _TransportOptionsState();
}

class _TransportOptionsState extends State<TransportOptions> {
  int index = 0;

  final transports = [
    {
      "text": "Car",
      "image": Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.network(
          "https://creazilla-store.fra1.digitaloceanspaces.com/cliparts/59924/man-drives-car-clipart-xl.png",
          fit: BoxFit.contain,
        ),
      ),
    },
    {
      "text": "Bike",
      "image": Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.network(
          "https://media.istockphoto.com/vectors/bearded-man-riding-motorcycle-side-view-of-male-biker-character-red-vector-id1270571224?b=1&k=20&m=1270571224&s=612x612&w=0&h=eB6Nfe_iEpBEQRoShhHUnVwB1GaChYLG0fM1dX2QCOc=",
          fit: BoxFit.contain,
        ),
      ),
    },
    {
      "text": "Bus",
      "image": Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.network(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSt3zRgM3_tzCLh-WhCP7G5r6DzY7eNtrZcTg&usqp=CAU",
          fit: BoxFit.contain,
        ),
      ),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width / 1.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.19),
                      offset: const Offset(0.5, 4),
                      spreadRadius: 1,
                      blurRadius: 8),
                  BoxShadow(
                      color: Colors.white.withOpacity(0.4),
                      offset: const Offset(-3, -4),
                      spreadRadius: -2,
                      blurRadius: 20),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: transports[index]["image"] as Widget,
            ),
            Container(
              height: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      index = (index - 1) % transports.length;
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.arrow_left,
                      size: 50,
                      color: darkShrinePink,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {
                      index = (index + 1) % transports.length;
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.arrow_right,
                      size: 50,
                      color: darkShrinePink,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            transports[index]["text"].toString(),
            style: TextStyle(fontSize: 35),
          ),
        )
      ],
    );
  }
}

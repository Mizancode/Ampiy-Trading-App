import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  final Map<String, dynamic> coin;
  const CardView({super.key, required this.coin});
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    'https://img.freepik.com/free-vector/gradient-stock-market-concept_23-2149166910.jpg'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coin['s'] 
                        .toString()
                        .substring(0, coin['s'].toString().length - 3),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '₹${double.parse(coin['c']).toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  )
                ],
              ),
              Column(
                children: [
                  Image(
                    image: double.parse(coin['P'].toString()) > 0
                        ? const AssetImage('assets/images/Green.png')
                        : const AssetImage('assets/images/Red.png'),
                    height: 78,
                    width: 100,
                  ),
                  Row(
                    children: [
                      Text('${double.parse(coin['P']).toStringAsFixed(2)}%'),
                      const SizedBox(
                        width: 7,
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: double.parse(coin['P'].toString()) > 0
                                ? Colors.green
                                : Colors.red),
                        child: Icon(
                          double.parse(coin['P'].toString()) > 0
                              ? Icons.arrow_circle_up
                              : Icons.arrow_circle_down,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';

class KunhoPage extends StatelessWidget {
  final String name;

  KunhoPage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$name의 페이지'),
      ),
      body: Center(
        child: Hero(
          tag: 'kunho-hero',
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuPco8aK_79xMqQEcJDNB4DXaD6j7n0voycIfLTE-BWw-0zh1bqe7nonkPrMuYyhxCm70&usqp=CAU",
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20),
              Text(
                '김근호',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '허허헣',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}

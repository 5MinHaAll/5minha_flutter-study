import 'package:flutter/material.dart';

class DoyeonPage extends StatelessWidget {
  final String name;

  DoyeonPage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$name의 페이지'),
      ),
      body: Center(
        child: Hero(
          tag: 'doyeon-hero',
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://i.pinimg.com/236x/85/17/24/85172465d4a5023c477301a7b1495f31.jpg",
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20),
              Text(
                '양도연',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '아이스크림 너무 맛있어용',
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

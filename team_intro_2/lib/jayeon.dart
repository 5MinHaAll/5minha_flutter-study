import 'package:flutter/material.dart';

class JayeonPage extends StatelessWidget {
  final String name;

  JayeonPage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$name의 페이지'),
      ),
      body: Center(
        child: Hero(
          tag: 'jayeon-hero',
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://i.ytimg.com/vi/4s7DDzlH_2A/sddefault.jpg",
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20),
              Text(
                '엄자연',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '안녕하세용용용',
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

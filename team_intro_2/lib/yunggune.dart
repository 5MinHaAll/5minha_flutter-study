import 'package:flutter/material.dart';

class YunggunePage extends StatelessWidget {
  final String name;

  YunggunePage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$name의 페이지'),
      ),
      body: Center(
        child: Hero(
          tag: 'yunggune-hero',
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfMIjtJqDIu5tGR_Cyb4973Uh1DMEs6FqFIQ&s",
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20),
              Text(
                '손영균',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '매운거 잘못먹고 시키는 거 다해요',
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

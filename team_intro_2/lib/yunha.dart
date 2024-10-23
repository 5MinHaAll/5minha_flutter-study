import 'package:flutter/material.dart';

class YunhaPage extends StatelessWidget {
  final String name;

  YunhaPage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$name의 페이지'),
      ),
      body: Center(
        child: Hero(
          tag: 'yunha-hero',
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://img1.daumcdn.net/thumb/R1280x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/cnoC/image/XPBzc9MpsvIxUEskon_J-r6WK_g",
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20),
              Text(
                '박윤하',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '카와이이~',
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

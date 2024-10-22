import 'package:flutter/material.dart';

const seedColor = Color(0xFFFFC0D9);
const String appTitle = "오늘도 민첩한 하루 되세요.";

class profileDetailPage extends StatelessWidget {
  final String name;
  final String title;
  final String imagePath;

  const profileDetailPage({
    Key? key,
    required this.name,
    required this.title,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(name),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: name,
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage(imagePath),
                ),
              ),
              SizedBox(height: 20),
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 30),
              Text(
                '여기에는 본인의 상세 소개나 팀에서의 역할을 추가할 수 있습니다.',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'HMFMPYUN',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('뒤로가기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
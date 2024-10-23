import 'package:flutter/material.dart';
import 'package:team_intro/main.dart';
import 'package:team_intro/project.dart';
import 'package:team_intro/team_intro.dart';

import 'contact.dart';

class profileDetailPage extends StatelessWidget {
  final String name;
  final String title;
  final String imagePath;
  final Map<String, String> selfIntro;

  const profileDetailPage({
    Key? key,
    required this.name,
    required this.title,
    required this.imagePath,
    required this.selfIntro,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          name,
        ),
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
                  fontFamily: 'HMFMPYUN',
                ),
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 20,
                  fontFamily: 'HMFMPYUN',
                ),
              ),
              SizedBox(height: 30),
              Text(
                "${selfIntro[name]}",
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
      bottomNavigationBar: BottomNavigationBar( // 페이지 하단의 네비게이션 바
        type: BottomNavigationBarType.fixed, // 아이템 정렬을 균일하게 설정
        selectedItemColor: Colors.pink, // 선택된 아이템의 색상
        unselectedItemColor: Colors.grey, // 선택되지 않은 아이템의 색상도 핑크로 설정
        currentIndex: _selectedIndex,
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                  MyHomePage(title: "오늘도 민첩한 하루 되세요.")), // 홈 페이지로 이동
            );
          }
          else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                  TeamIntroductionApp(title: "오늘도 민첩한 하루 되세요.")), // 홈 페이지로 이동
            );
          }
          else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                  Project(title: "오늘도 민첩한 하루 되세요.")), // 홈 페이지로 이동
            );
          }
          else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                  Contact(title: "오늘도 민첩한 하루 되세요.")), // 홈 페이지로 이동
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: '팀 소개',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment), // 프로젝트를 대체할 아이콘
            label: '팀규칙',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: '링크',
          ),
        ],
      ),
    );
  }
}
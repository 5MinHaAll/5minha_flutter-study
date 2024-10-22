import 'package:flutter/material.dart';
import 'package:team_intro/profileDetailPage.dart';


const seedColor = Color(0xFFFFC0D9);
const String appTitle = "오늘도 민첩한 하루 되세요.";

class TeamIntroduction extends StatelessWidget {
  const TeamIntroduction({super.key, required this.id, required this.password});

  final int id;
  final String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(appTitle),
      ),
      body: Container( // 팀 고유의 배경 색상 적용
          // color: Colors.lightBlue[50], // 팀 고유의 배경 색상 설정
          child: SafeArea(
            child: Center(
              child: Column( // 필수 Widget: Column을 사용하여 수직 레이아웃 구성
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 박윤하를 단독으로 1열에 배치한 Row
                  Row( // 필수 Widget: Row 사용. 한 명의 프로필을 포함한 Row
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildProfileCard(
                        context,'박윤하',
                        '유나유나',
                        'assets/images/yunha.png',
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // 두 번째 Row에 두 명 배치
                  Row( // 필수 Widget: Row 사용. 두 명의 프로필을 포함한 Row
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildProfileCard(
                        context,'양도연',
                        '뇽안뇽안',
                        'assets/images/doyeon.png',
                      ),
                      buildProfileCard(
                        context,'엄자연',
                        '하이하이',
                        'assets/images/jayeon.png',
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // 세 번째 Row에 두 명 배치
                  Row( // 필수 Widget: Row 사용. 두 명의 프로필을 포함한 Row
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildProfileCard(
                        context,'손영균',
                        '규니규니',
                        'assets/images/yunggun.png',
                      ),
                      buildProfileCard(
                        context,'김근호',
                        '그노그노',
                        'assets/images/kunho.png',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar( // 페이지 하단의 네비게이션 바
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
              label: '프로젝트',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_mail),
              label: '연락처',
            ),
          ],
          selectedItemColor: Colors.blueAccent,
        ),
    );
  }

  Widget buildProfileCard(BuildContext context, String name, String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => profileDetailPage(
              name: name,
              title: title,
              imagePath: imagePath,
            ),
          ),
        );
      },
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Hero(
                  tag: name,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(imagePath),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 24,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

}


// members_page.dart
import 'package:flutter/material.dart';
import 'profile_detail_page.dart'; // 새로 만든 파일을 import

class membersPage extends StatelessWidget {
  const membersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            '오늘도 민첩한 하루되세요.',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'HMFMPYUN',
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: Container(
          color: Colors.lightBlue[50],
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildProfileCard(
                        context,
                        '박윤하',
                        '유나유나',
                        'images/yunha.png',
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildProfileCard(
                        context,
                        '양도연',
                        '뇽안뇽안',
                        'images/doyeon.png',
                      ),
                      buildProfileCard(
                        context,
                        '엄자연',
                        '하이하이',
                        'images/jayeon.png',
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildProfileCard(
                        context,
                        '손영균',
                        '규니규니',
                        'images/yunggun.png',
                      ),
                      buildProfileCard(
                        context,
                        '김근호',
                        '그노그노',
                        'images/kunho.png',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
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
              icon: Icon(Icons.assignment),
              label: '프로젝트',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_mail),
              label: '연락처',
            ),
          ],
          selectedItemColor: Colors.blueAccent,
        ),
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
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(imagePath),
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
                fontFamily: 'HMFMPYUN',
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
                fontFamily: 'HMFMPYUN',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

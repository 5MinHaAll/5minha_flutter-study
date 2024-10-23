import 'package:flutter/material.dart';
import 'package:team_intro/doyeon.dart';
import 'package:team_intro/jayeon.dart';
import 'package:team_intro/yunggune.dart'; // 추가된 페이지
import 'package:team_intro/kunho.dart'; // 추가된 페이지
import 'package:team_intro/yunha.dart'; // 추가 된 페이지


void main() {
  runApp(Members());
}

const seedColor = Color(0XFFFFC0D9);

class Members extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '5MinHa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
        fontFamily: 'Paperlogy', // 기본 폰트를 Paperlogy로 설정
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.pink,
          titleTextStyle: TextStyle(
            fontFamily: 'GumiRomance', // AppBar 제목에 GumiRomance 폰트 적용
            fontSize: 20, // 폰트 크기 설정 (필요에 따라 조정)
            fontWeight: FontWeight.bold, // 필요에 따라 조정
            color: Colors.pink, // foregroundColor와 일치
          ),
        ),
      ),
      home: const MyHomePage(title: '오늘도 민첩한 하루 되세요'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        color: Colors.pink[50], // 팀 고유의 배경 색상 설정
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                GestureDetector(
                onTap: () {
          Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => YunhaPage(name: "윤하")),
          );
          },
            child: Hero(
              tag: "윤하",
                   child: buildProfileCard(
                      '박윤하',
                      '유나유나',
                      'assets/images/yunha.png',
                    ),
            ),
          ),
          ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => DoyeonPage(name: "도연")),
                        );
                      },
                      child: Hero(
                        tag: "도연",
                        child: buildProfileCard(
                          '양도연',
                          '뇽안뇽안',
                          'assets/images/doyeon.png',
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => JayeonPage(name: "자연")),
                        );
                      },
                      child: Hero(
                        tag: "자연",
                        child: buildProfileCard(
                          '엄자연',
                          '하이하이',
                          'assets/images/jayeon.png',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => YunggunePage(name: "영균")),
                        );
                      },
                      child: Hero(
                        tag: "영균",
                        child: buildProfileCard(
                          '손영균',
                          '규니규니',
                          'assets/images/yunggun.png',
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => KunhoPage(name: "근호")),
                        );
                      },
                      child: Hero(
                        tag: "근호",
                        child: buildProfileCard(
                          '김근호',
                          '그노그노',
                          'assets/images/kunho.png',
                        ),
                      ),
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
        onTap: (index) {
          if (index == 0) { // 홈 버튼 클릭 시
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const MyHomePage(title: '오늘도 민첩한 하루 되세요')),
            );
          }
          // 다른 아이템에 대한 처리 추가 가능
        },
      ),
    );
  }

  Widget buildProfileCard(String name, String title, String imagePath) {
    return Container(
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
    );
  }
}

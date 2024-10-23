import 'package:flutter/material.dart';
import 'package:team_intro/main.dart';
import 'package:team_intro/profile_datail.dart';
import 'package:team_intro/project.dart';

import 'contact.dart';


const seedColor = Color(0xFFFFC0D9);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '5MinHa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
        fontFamily: 'Paperlogy',  // 기본 폰트를 Paperlogy로 설정
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.pink,
          titleTextStyle: TextStyle(
            fontFamily: 'GumiRomance',  // vAppBar 제목에 GumiRomance 폰트 적용
            fontSize: 20,  // 폰트 크기 설정 (필요에 따라 조정)
            fontWeight: FontWeight.bold,  // 필요에 따라 조정
            color: Colors.pink,  // foregroundColor와 일치
          ),
        ),
      ),
      home: const TeamIntroductionApp(title: '오늘도 민첩한 하루 되세요'),
    );
  }
}

class TeamIntroductionApp extends StatefulWidget {

  const TeamIntroductionApp({super.key, required this.title});

  final String title;

  @override
  State<TeamIntroductionApp> createState() => _TeamIntroductionState();
}

class _TeamIntroductionState extends State<TeamIntroductionApp> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
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
                        context,
                        '박윤하',
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
                        context,
                        '양도연',
                        '요니요니',
                        'assets/images/doyeon.png',
                      ),
                      buildProfileCard(
                        context,
                        '엄자연',
                        '여니여니',
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
                        context,
                        '손영균',
                        '규니규니',
                        'assets/images/yunggun.png',
                      ),
                      buildProfileCard(
                        context,
                        '김근호',
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
              selfIntro : {"김근호" : "매운건 씻어 먹어야 더 맛있어요!",
                "박윤하" : "환상의 FE쇼! \n뭔가 보여드리겠습니다!!",
                "양도연" : "안녕하세요~~ \n베스킨라빈스 '너 T야' 꼭 드셔보세요. \n얼그레이 초코 짱맛!",
                "손영균" : "매운거 싫어함. 유머러스함.",
                "엄자연" : "얄리얄리 얄라성 얄라리얄라"},
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
            Text(name,
              style: TextStyle(fontSize : 20,
                  fontWeight: FontWeight.bold),),
            Text(title,
              style: TextStyle(fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}




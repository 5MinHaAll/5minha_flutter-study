import 'package:flutter/material.dart';
import 'package:team_intro/main.dart';
import 'package:team_intro/profile_datail.dart';
import 'package:team_intro/team_intro.dart';

import 'contact.dart';

void main() {
  runApp(const MyApp());
}

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
      home: const Project(title: '오늘도 민첩한 하루 되세요'),
    );
  }
}

class Project extends StatefulWidget {

  const Project({super.key, required this.title});

  final String title;

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  int  _selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("우리의 규칙")
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  '팀 그라운드 룰',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Paperlogy',
                    color: Colors.pink,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildRuleItem(
                '🚫 매운 거 & 오이 OUT',
                isSubItem: false,
              ),
              _buildRuleItem(
                '📢 특이 사항 있을 시 (출결, 개인 사항 등) 미리 말하기',
                isSubItem: false,
              ),
              _buildRuleItem(
                '⏰ 시간 일정 지키기',
                isSubItem: false,
              ),
              _buildRuleItem(
                '🏖️ 주말에 공적으로 연락하지 않기 - 사적 가능!',
                isSubItem: false,
              ),
              _buildRuleItem(
                '💭 자유롭게 의견 내기',
                isSubItem: false,
              ),
              _buildRuleItem(
                '👂 선 공감, 후 피드백',
                isSubItem: true,
              ),
              _buildRuleItem(
                '👥 같이 얘기하기 (소외시키지 않기, 다른 팀원들이 대화에 참여하는지 관심 갖기)',
                isSubItem: false,
              ),
              _buildRuleItem(
                '🗣️ 모든 팀원들의 대화 참여 유도하기',
                isSubItem: true,
              ),
              _buildRuleItem(
                '😆 개그 욕심 내지 않기 (하루 10번까지 가능)',
                isSubItem: false,
              ),
              _buildRuleItem(
                '👏 리액션 잘해주기 (문과, 공대 유머 모두 수용해주기)',
                isSubItem: true,
              ),
              _buildRuleItem(
                '🌟 한 번이라도 웃기면 횟수 연장 가능',
                isSubItem: true,
              ),
              _buildRuleItem(
                '🦋 INFP는 소중하다... 많은 지지와 공감.. 해주기..',
                isSubItem: false,
              ),
              _buildRuleItem(
                '🤝 한 명의 INFP를 키우는 데는 팀원 4명의 노력이 필요하다………',
                isSubItem: true,
              ),
              _buildRuleItem(
                '💝 비판? 필요 없습니다. 무조건적인 지지와 공감, 응원 부탁드립니다.',
                isSubItem: true,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar( // 페이지 하단의 네비게이션 바
        type: BottomNavigationBarType.fixed,
        // 아이템 정렬을 균일하게 설정
        selectedItemColor: Colors.pink,
        // 선택된 아이템의 색상
        unselectedItemColor: Colors.grey,
        // 선택되지 않은 아이템의 색상도 핑크로 설정
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
  Widget _buildRuleItem(String text, {bool isSubItem = false}) {
    return Padding(
      padding: EdgeInsets.only(
        left: isSubItem ? 32.0 : 16.0,
        top: 8.0,
        right: 16.0,
        bottom: 8.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isSubItem)
            Container(
              width: 4,
              height: 4,
              margin: const EdgeInsets.only(top: 8),
              decoration: const BoxDecoration(
                color: Colors.pink,
                shape: BoxShape.circle,
              ),
            ),
          if (!isSubItem) const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: isSubItem ? 14 : 16,
                fontWeight: isSubItem ? FontWeight.normal : FontWeight.w600,
                fontFamily: 'Paperlogy',
                height: 1.5,
                color: isSubItem ? Colors.grey[700] : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
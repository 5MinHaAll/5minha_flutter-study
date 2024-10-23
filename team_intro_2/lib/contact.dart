import 'package:flutter/material.dart';
import 'package:team_intro/main.dart';
import 'package:team_intro/profile_datail.dart';
import 'package:team_intro/project.dart';
import 'package:team_intro/team_intro.dart';
import 'package:url_launcher/url_launcher.dart';

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
      home: const Contact(title: '오늘도 민첩한 하루 되세요'),
    );
  }
}

class Contact extends StatefulWidget {

  const Contact({super.key, required this.title});

  final String title;

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  int _selectedIndex = 3;

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
          title: Text("유용한 링크")
      ),
      // body: Container(
      //   child: Center(
      //     child: Column( // Center 위젯 안에 Column을 추가
      //       mainAxisAlignment: MainAxisAlignment.center, // Column 내부의 위젯을 가운데로 정렬
      //       children: [ // 'children' 속성을 사용하여 리스트를 추가
      //         Text(
      //           "Comming Soon",
      //           style: TextStyle(
      //             fontSize: 40,
      //             fontWeight: FontWeight.bold,
      //             color: Colors.pink,
      //           ),
      //         ),
      //         Text(
      //           "*연락하지 마삼*",
      //           style: TextStyle(
      //             fontSize: 20,
      //             fontStyle: FontStyle.italic,
      //             color: Colors.grey,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildLinkCard(
              context,
              icon: Icons.code,
              title: 'GitHub',
              subtitle: '팀 프로젝트 저장소',
              url: 'https://github.com/5MinHaAll',
            ),
            const SizedBox(height: 16),
            _buildLinkCard(
              context,
              icon: Icons.note_alt_outlined,
              title: 'Notion',
              subtitle: '팀 문서 관리',
              url: 'https://www.notion.so/fd9bd476c64e4610bd34a0ad7ac09746',
            ),
          ],
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
            label: '프로젝트',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: '연락처',
          ),
        ],
      ),
    );
  }

  Widget _buildLinkCard(BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required String url,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () => _launchURL(url),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.pink.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: 32,
                  color: Colors.pink,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Paperlogy',
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                        fontFamily: 'Paperlogy',
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'members.dart';
// import 'rules.dart';
// import 'links.dart';

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
        fontFamily: 'Paperlogy',
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.pink,
          titleTextStyle: TextStyle(
            fontFamily: 'GumiRomance',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.pink,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _showTooltip(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "오늘도 민첩한 하루되세요",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Paperlogy',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "LG전자 DX SCHOOL 1기 실전역량강화(DX) 프로젝트 5팀의 Flutter 실습 앱입니다.",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Paperlogy',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // 다이얼로그 닫기
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MembersPage()),
                    );
                  },
                  child: const Text(
                    "민첩해지기",
                    style: TextStyle(
                      fontFamily: 'Paperlogy',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, // 배경색 추가
        child: InkWell(
          onTap: () {
            print('Tapped!'); // 디버그용 프린트
            _showTooltip(context);
          },
          child: Center( // Center 위젯 추가
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/fastday_2.webp'),
                  fit: BoxFit.contain, // 이미지가 잘리지 않도록 수정
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
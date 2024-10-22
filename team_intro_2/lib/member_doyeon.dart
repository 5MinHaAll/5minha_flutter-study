import 'package:flutter/material.dart';
import 'main.dart';
import 'rules.dart';
import 'links.dart';

class MemberDoyeonPage extends StatelessWidget {
  const MemberDoyeonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '양도연',
          style: TextStyle(
            fontFamily: 'Paperlogy',
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              '깔깔 재판관',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Paperlogy',
                color: Colors.pink,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Center(
              child: Hero(
                tag: 'assets/images/doyeon.png',
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: AssetImage('assets/images/doyeon.png'),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      color: Colors.pink.shade100,
                      width: 4,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              '안녕하세요~~',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontFamily: 'Paperlogy',
                color: Colors.pink,
              ),
              textAlign: TextAlign.center,
            ),
            const Text(
              '베스킨라빈스 "너 T야" 꼭 드셔보세요.',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontFamily: 'Paperlogy',
                color: Colors.pink,
              ),
              textAlign: TextAlign.center,
            ),
            const Text(
              '얼그레이 초코 짱맛',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontFamily: 'Paperlogy',
                color: Colors.pink,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: '멤버',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rule),
            label: '규칙',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.link),
            label: '링크',
          ),
        ],
        currentIndex: 1, // 현재 페이지에 따라 값이 달라짐
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true, // 선택되지 않은 라벨도 표시
        type: BottomNavigationBarType.fixed, // 고정 타입으로 설정
        backgroundColor: Colors.white, // 배경색 설정
        elevation: 8, // 그림자 효과
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MyHomePage(),
              ),
            );
          } else if (index == 1) {
            Navigator.pop(context);
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const RulesPage(),
              ),
            );
          } else if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LinksPage(),
              ),
            );
          }
        },
      ),
    );
  }
}
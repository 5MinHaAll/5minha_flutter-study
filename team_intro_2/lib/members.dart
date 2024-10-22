import 'package:flutter/material.dart';
import 'main.dart';
import 'member_yunha.dart';
import 'member_kunho.dart';
import 'member_doyeon.dart';
import 'member_yunggune.dart';
import 'member_jayeon.dart';
import 'rules.dart';
import 'links.dart';

class MembersPage extends StatelessWidget {
  const MembersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('민첩한 사람들'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // 팀장 프로필 카드
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: _buildProfileCard(
                      context,
                      'assets/images/yunha.png',
                      '박윤하',
                      '페르소나 재판관',
                      const MemberYunhaPage(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // 첫 번째 줄 팀원들
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 200,
                          child: _buildProfileCard(
                            context,
                            'assets/images/kunho.png',
                            '김근호',
                            '기술 재판관',
                            const MemberKunhoPage(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: SizedBox(
                          height: 200,
                          child: _buildProfileCard(
                            context,
                            'assets/images/doyeon.png',
                            '양도연',
                            '깔깔 재판관',
                            const MemberDoyeonPage(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // 두 번째 줄 팀원들
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 200,
                          child: _buildProfileCard(
                            context,
                            'assets/images/yunggune.png',
                            '손영균',
                            '출석 재판관',
                            const MemberYunggunePage(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: SizedBox(
                          height: 200,
                          child: _buildProfileCard(
                            context,
                            'assets/images/jayeon.png',
                            '엄자연',
                            '발표 재판관',
                            const MemberJayeonPage(),
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

  Widget _buildProfileCard(
      BuildContext context,
      String imagePath,
      String name,
      String role,
      Widget destinationPage,
      ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => destinationPage,
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: imagePath,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      color: Colors.pink.shade100,
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Paperlogy',
                ),
              ),
              const SizedBox(height: 4),
              Text(
                role,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Paperlogy',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'main.dart';
import 'links.dart';
import 'members.dart';

class RulesPage extends StatelessWidget {
  const RulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '우리의 규칙',
          style: TextStyle(
            fontFamily: 'Paperlogy',
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
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
        currentIndex: 2,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 8,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MyHomePage(),
              ),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MembersPage(),
              ),
            );
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
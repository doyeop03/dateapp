import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FE),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('안녕하세요,', style: TextStyle(fontSize: 14, color: Colors.grey)),
            const Text('이재용님!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF2D3E50))),
            const SizedBox(height: 20),

            // 1. 프로필 카드 섹션
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(color: Colors.black.withAlpha(8), blurRadius: 10)],
              ),
              child: Column(
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Color(0xFFD45D65),
                        child: Text('이', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('이재용', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('dododo@gmail.com', style: TextStyle(color: Colors.grey, fontSize: 13)),
                          Text('가입일 2026.03.01', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // 등록한 사람 / 매칭 성공 통계 박스
                  Row(
                    children: [
                      _buildStatBox('12', '등록한 사람', const Color(0xFFFFF3F4), const Color(0xFFD45D65)),
                      const SizedBox(width: 15),
                      _buildStatBox('2', '매칭 성공', const Color(0xFFF0F6FF), const Color(0xFF5C78D6)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // 2. 내 정보 관리 섹션
            const Text('내 정보 관리', style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildSettingGroup([
              _buildSettingTile(Icons.notifications_none, '프로필 편집'),
              _buildSettingTile(Icons.notifications_none, '계정 관리'),
              _buildSettingTile(Icons.notifications_none, '개인정보 설정'),
            ]),
            const SizedBox(height: 25),

            // 3. 앱 설정 섹션
            const Text('앱 설정', style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildSettingGroup([
              _buildSettingTile(Icons.notifications_none, '알림 설정'),
              _buildSettingTile(Icons.notifications_none, '언어'),
              _buildSettingTile(Icons.notifications_none, '문의하기'),
              _buildSettingTile(Icons.notifications_none, '이용약관'),
              _buildSettingTile(Icons.notifications_none, '로그아웃'),
            ]),
          ],
        ),
      ),
    );
  }

  // 상단 통계 박스 위젯
  Widget _buildStatBox(String count, String label, Color bgColor, Color textColor) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Text(count, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor)),
            Text(label, style: TextStyle(fontSize: 11, color: textColor.withAlpha(179))),
          ],
        ),
      ),
    );
  }

  // 설정 메뉴 그룹 (둥근 모서리 컨테이너)
  Widget _buildSettingGroup(List<Widget> tiles) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(children: tiles),
    );
  }

  // 개별 설정 타일
  Widget _buildSettingTile(IconData icon, String title) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: const Color(0xFFF2F2F2), borderRadius: BorderRadius.circular(10)),
        child: Icon(icon, size: 20, color: Colors.grey),
      ),
      title: Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.chevron_right, size: 20, color: Colors.grey),
      onTap: () {},
    );
  }
}


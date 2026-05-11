import 'package:flutter/material.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FE),
      // 상단 앱바: 뒤로가기 버튼과 '알림' 타이틀
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FE),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.grey, size: 20),
          onPressed: () => Navigator.pop(context), // 이전 화면으로 돌아가기
        ),
        titleSpacing: 0,
        title: const Text('알림',
            style: TextStyle(color: Color(0xFF2D3E50), fontWeight: FontWeight.bold, fontSize: 18)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            // --- 오늘 ---
            _buildDateHeader('오늘'),
            _buildNoticeTile(
              icon: Icons.favorite,
              iconColor: const Color(0xFFD45D65),
              title: '매칭 성공!',
              subtitle: '누군가와 서로 등록했어요. 서로의 이름을 확인해보세요.',
            ),
            _buildNoticeTile(
              icon: Icons.help_outline,
              iconColor: const Color(0xFF5C78D6),
              title: '새로운 등록',
              subtitle: '내 목록에 있는 사람 중 누군가가 등록했어요!',
            ),
            _buildNoticeTile(
              icon: Icons.help_outline,
              iconColor: const Color(0xFF5C78D6),
              title: '새로운 등록',
              subtitle: '내 목록에 있는 사람 중 누군가가 등록했어요!',
            ),

            const SizedBox(height: 20),

            // --- 어제 ---
            _buildDateHeader('어제'),
            _buildNoticeTile(
              icon: Icons.flash_on,
              iconColor: const Color(0xFFDDE3F9),
              iconInsideColor: const Color(0xFF5C78D6),
              title: '프라이버시 알림',
              subtitle: '내가 등록한 사람에게 내 이름이 공개되었어요.',
            ),

            const SizedBox(height: 20),

            // --- 2일 전 ---
            _buildDateHeader('2일 전'),
            _buildNoticeTile(
              icon: Icons.favorite,
              iconColor: const Color(0xFFD45D65),
              title: '매칭 성공!',
              subtitle: '누군가와 서로 등록했어요. 서로의 이름을 확인해보세요.',
            ),
            _buildNoticeTile(
              icon: Icons.help_outline,
              iconColor: const Color(0xFF5C78D6),
              title: '새로운 등록',
              subtitle: '내 목록에 있는 사람 중 누군가가 등록했어요!',
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // 날짜 헤더 (오늘, 어제 등)
  Widget _buildDateHeader(String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(date, style: const TextStyle(color: Colors.grey, fontSize: 13)),
    );
  }

  // 개별 알림 타일
  Widget _buildNoticeTile({
    required IconData icon,
    required Color iconColor,
    Color? iconInsideColor,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 원형 아이콘
          CircleAvatar(
            radius: 25,
            backgroundColor: iconColor,
            child: Icon(icon, color: iconInsideColor ?? Colors.white, size: 25),
          ),
          const SizedBox(width: 15),
          // 텍스트 영역
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF2D3E50))),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 13, height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


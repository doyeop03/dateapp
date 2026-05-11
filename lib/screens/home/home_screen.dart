import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/section_title.dart';

/// 홈 화면
///
/// 홈 화면에는 다음 요소들이 들어감:
/// 1. 비밀보장 배너
/// 2. 새로운 알림 카드
/// 3. 새로운 친구 리스트
/// 4. 등록하기 버튼
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<Map<String, String>> _newFriends = [
    {
      'name': '김하나',
      'phone': '010-1234-4567',
    },
    {
      'name': '김두울',
      'phone': '010-5555-3333',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PrivacyBanner(),
          const SizedBox(height: 25),
          const SectionTitle('새로운 알림'),
          const SizedBox(height: 12),
          const NewNotificationCard(),
          const SizedBox(height: 25),
          const SectionTitle('새로운 친구'),
          const SizedBox(height: 12),
          FriendListCard(friends: _newFriends),
          const SizedBox(height: 30),
          PrimaryButton(
            text: '등록하기',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class PrivacyBanner extends StatelessWidget {
  const PrivacyBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.security,
            color: Colors.white,
            size: 40,
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '100% 비밀보장',
                  style: AppTextStyles.bannerTitle,
                ),
                SizedBox(height: 4),
                Text(
                  '상대방이 당신을 등록하기 전까지는\n당신의 마음을 절대 먼저 알 수 없습니다.',
                  style: AppTextStyles.bannerSubtitle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NewNotificationCard extends StatelessWidget {
  const NewNotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: const ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.blueLight,
          child: Icon(
            Icons.flash_on,
            color: AppColors.blue,
          ),
        ),
        title: Text(
          '내 목록에 있는 사람 중 누군가가 앱을 시작했어요!',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          '기다려보세요. 상대방도 당신을 원할지도 몰라요.\n방금전',
          style: TextStyle(fontSize: 12),
        ),
        trailing: Icon(
          Icons.circle,
          color: Colors.red,
          size: 8,
        ),
      ),
    );
  }
}

class FriendListCard extends StatelessWidget {
  final List<Map<String, String>> friends;

  const FriendListCard({
    super.key,
    required this.friends,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: List.generate(friends.length, (index) {
          final friend = friends[index];
          final isLast = index == friends.length - 1;

          return Column(
            children: [
              FriendTile(
                name: friend['name'] ?? '',
                phone: friend['phone'] ?? '',
              ),
              if (!isLast) const Divider(height: 1),
            ],
          );
        }),
      ),
    );
  }
}

class FriendTile extends StatelessWidget {
  final String name;
  final String phone;

  const FriendTile({
    super.key,
    required this.name,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: AppColors.avatarGray,
        child: Icon(
          Icons.person,
          color: Colors.white,
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(phone),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}


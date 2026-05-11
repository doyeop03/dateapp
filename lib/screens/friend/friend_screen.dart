import 'package:flutter/material.dart';

import '../../models/match_item.dart';
import '../../models/waiting_user.dart';
import '../register/register_friend_screen.dart';
import 'widgets/match_card_grid.dart';
import 'widgets/waiting_user_list_card.dart';

class FriendPage extends StatelessWidget {
  const FriendPage({super.key});

  static const List<MatchItem> _matches = [
    MatchItem(date: '2026.04.28 매칭'),
    MatchItem(date: '2026.04.28 매칭'),
  ];

  static const List<WaitingUser> _waitingUsers = [
    WaitingUser(name: '김하나', phone: '010-1234-4567'),
    WaitingUser(name: '김하나', phone: '010-1234-4567'),
    WaitingUser(name: '김하나', phone: '010-1234-4567'),
    WaitingUser(name: '김두울', phone: '010-5555-3333'),
    WaitingUser(name: '김두울', phone: '010-5555-3333'),
  ];

  void _openRegisterFriendScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const RegisterFriendScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FriendColors.background,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FriendSectionTitle('매칭성공'),
            const SizedBox(height: 15),
            MatchCardGrid(matches: _matches),
            const SizedBox(height: 25),
            PrimaryFriendButton(
              text: '새로운 사람 등록하기',
              onPressed: () => _openRegisterFriendScreen(context),
            ),
            const SizedBox(height: 30),
            const FriendSectionTitle('대기중 명단'),
            const SizedBox(height: 15),
            WaitingUserListCard(users: _waitingUsers),
          ],
        ),
      ),
    );
  }
}

class FriendColors {
  static const primary = Color(0xFFD45D65);
  static const background = Color(0xFFF8F9FE);
  static const textDark = Color(0xFF2D3E50);
  static const matchCardBackground = Color(0xFFFFF3F4);
  static const matchCardBorder = Color(0xFFFFE4E6);
  static const avatarGray = Color(0xFFE0E0E0);
  static const textGray = Colors.grey;
}

class FriendTextStyles {
  static const sectionTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: FriendColors.textDark,
  );

  static const buttonText = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const matchPrivateText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const matchDateText = TextStyle(
    color: FriendColors.textGray,
    fontSize: 11,
  );

  static const revealText = TextStyle(
    color: FriendColors.primary,
    fontSize: 11,
  );

  static const waitingName = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );

  static const waitingPhone = TextStyle(
    fontSize: 13,
    color: FriendColors.textGray,
  );
}

class FriendSectionTitle extends StatelessWidget {
  final String text;

  const FriendSectionTitle(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: FriendTextStyles.sectionTitle,
    );
  }
}

class PrimaryFriendButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryFriendButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: FriendColors.primary,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          text,
          style: FriendTextStyles.buttonText,
        ),
      ),
    );
  }
}


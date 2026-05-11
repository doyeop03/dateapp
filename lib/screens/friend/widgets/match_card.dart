import 'package:flutter/material.dart';

import '../../../models/match_item.dart';
import '../friend_screen.dart';

class MatchCard extends StatelessWidget {
  final MatchItem match;

  const MatchCard({
    super.key,
    required this.match,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        // TODO:
        // 나중에 "탭하여 공개" 기능 연결
        // 예: revealMatch Lambda 호출
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: FriendColors.matchCardBackground,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: FriendColors.matchCardBorder,
          ),
        ),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundColor: FriendColors.primary,
              child: Text(
                '?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              '비공개',
              style: FriendTextStyles.matchPrivateText,
            ),
            const SizedBox(height: 3),
            Text(
              match.date,
              style: FriendTextStyles.matchDateText,
            ),
            const SizedBox(height: 15),
            const Icon(
              Icons.lock_outline,
              color: FriendColors.primary,
              size: 18,
            ),
            const SizedBox(height: 2),
            const Text(
              '탭하여 공개',
              style: FriendTextStyles.revealText,
            ),
          ],
        ),
      ),
    );
  }
}


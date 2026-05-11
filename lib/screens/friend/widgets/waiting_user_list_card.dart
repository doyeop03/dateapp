import 'package:flutter/material.dart';

import '../../../models/waiting_user.dart';
import 'waiting_user_tile.dart';

class WaitingUserListCard extends StatelessWidget {
  final List<WaitingUser> users;

  const WaitingUserListCard({
    super.key,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(8),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: List.generate(users.length, (index) {
          final user = users[index];
          final isLast = index == users.length - 1;

          return WaitingUserTile(
            user: user,
            showDivider: !isLast,
          );
        }),
      ),
    );
  }
}


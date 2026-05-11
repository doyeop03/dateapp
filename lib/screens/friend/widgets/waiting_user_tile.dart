import 'package:flutter/material.dart';

import '../../../models/waiting_user.dart';
import '../friend_screen.dart';

class WaitingUserTile extends StatelessWidget {
  final WaitingUser user;
  final bool showDivider;

  const WaitingUserTile({
    super.key,
    required this.user,
    required this.showDivider,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          leading: const CircleAvatar(
            backgroundColor: FriendColors.avatarGray,
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          title: Text(
            user.name,
            style: FriendTextStyles.waitingName,
          ),
          subtitle: Text(
            user.phone,
            style: FriendTextStyles.waitingPhone,
          ),
          trailing: const Icon(
            Icons.chevron_right,
            color: FriendColors.textGray,
          ),
          onTap: () {
            // TODO:
            // 나중에 대기중 사용자 상세 페이지 또는 삭제/관리 기능 연결
          },
        ),
        if (showDivider)
          Divider(
            height: 1,
            indent: 70,
            color: Colors.grey[100],
          ),
      ],
    );
  }
}


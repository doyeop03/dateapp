import 'package:flutter/material.dart';

import '../../models/chat_item.dart';
import 'widgets/chat_list_tile.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  static const List<ChatItem> _chatItems = [
    ChatItem(
      name: '김하나',
      message: 'ㅎㅇㅋㅋ',
      time: '방금전',
      unreadCount: 1,
    ),
    ChatItem(
      name: '김하나',
      message: '오 언제볼래',
      time: '오전 11:23',
      unreadCount: 0,
    ),
    ChatItem(
      name: '김하나',
      message: '안녕',
      time: '어제',
      unreadCount: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ChatColors.background,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 26, 16, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ChatTitleSection(),
            const SizedBox(height: 22),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _chatItems.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return ChatListTile(chat: _chatItems[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ChatColors {
  static const primary = Color(0xFFD45D65);
  static const background = Color(0xFFF8F9FE);
  static const textDark = Color(0xFF222B45);
  static const textGray = Color(0xFF9CA3AF);
  static const avatarGray = Color(0xFFD9D9D9);
}

class ChatTitleSection extends StatelessWidget {
  const ChatTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '채팅',
          style: TextStyle(
            color: ChatColors.textDark,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 8),
        Text(
          '서로 매칭이 되면 채팅방이 생겨요\n현재 상호 매칭된 3명과 대화 중이에요',
          style: TextStyle(
            color: ChatColors.textGray,
            fontSize: 13,
            height: 1.35,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}


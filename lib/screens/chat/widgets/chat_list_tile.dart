import 'package:flutter/material.dart';

import '../../../models/chat_item.dart';
import '../chat_screen.dart';

class ChatListTile extends StatelessWidget {
  final ChatItem chat;

  const ChatListTile({
    super.key,
    required this.chat,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(13),
      onTap: () {
        // TODO: 채팅방 상세 화면으로 이동
      },
      child: Container(
        height: 72,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(6),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            const ChatAvatar(),
            const SizedBox(width: 13),
            Expanded(
              child: ChatTextArea(chat: chat),
            ),
            const SizedBox(width: 10),
            ChatTrailingInfo(chat: chat),
          ],
        ),
      ),
    );
  }
}

class ChatAvatar extends StatelessWidget {
  const ChatAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 21,
      backgroundColor: ChatColors.avatarGray,
      child: Icon(
        Icons.person,
        color: Colors.white,
        size: 28,
      ),
    );
  }
}

class ChatTextArea extends StatelessWidget {
  final ChatItem chat;

  const ChatTextArea({
    super.key,
    required this.chat,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          chat.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: ChatColors.textDark,
            fontSize: 14,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          chat.message,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: ChatColors.textGray,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class ChatTrailingInfo extends StatelessWidget {
  final ChatItem chat;

  const ChatTrailingInfo({
    super.key,
    required this.chat,
  });

  @override
  Widget build(BuildContext context) {
    final hasUnread = chat.unreadCount > 0;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          chat.time,
          style: const TextStyle(
            color: ChatColors.textGray,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 7),
        if (hasUnread)
          Container(
            width: 20,
            height: 20,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: ChatColors.primary,
              shape: BoxShape.circle,
            ),
            child: Text(
              '${chat.unreadCount}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        else
          const SizedBox(height: 20),
      ],
    );
  }
}


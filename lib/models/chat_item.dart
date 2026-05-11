//채팅 목록 한 줄에 필요한 데이터
class ChatItem {
  final String name;
  final String message;
  final String time;
  final int unreadCount;

  const ChatItem({
    required this.name,
    required this.message,
    required this.time,
    required this.unreadCount,
  });
}


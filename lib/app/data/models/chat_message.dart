class ChatMessage {
  final String message;
  final ChatMessageType type;

  ChatMessage({required this.message, required this.type});
}

enum ChatMessageType {
  system,
  user,
  menu,
}

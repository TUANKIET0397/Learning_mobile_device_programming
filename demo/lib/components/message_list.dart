import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_flutter_basic/components/message_widget.dart';
import 'package:learning_flutter_basic/providers.dart';

class MessageList extends ConsumerWidget {
  MessageList({super.key});

  final TextEditingController _messageController = TextEditingController();

  void _sendMessage(WidgetRef ref) {
    if (_messageController.text.isNotEmpty) {
      final messageDao = ref.read(messageDaoProvider);
      messageDao.sendMessage(_messageController.text.trim());
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // nghe stream messages
    final messagesAsync = ref.watch(messageListProvider); //

    return Column(
      children: [
        // tin nhắn hiển thị
        Expanded(
          child: messagesAsync.when(
            data: (messages) {
              return ListView.builder(
                reverse: true, // đúng sách (message mới lên trên)
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return MessageWidget(message);
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => Center(child: Text(error.toString())),
          ),
        ),

        // 🔹 CREATING NEW MESSAGES
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _messageController,
                  decoration: const InputDecoration(
                    hintText: 'Enter new message',
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () => _sendMessage(ref),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

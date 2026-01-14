import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_flutter_basic/components/message_list.dart';

import '../components/login.dart';
import 'providers.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider); //

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Chat App'),
        actions: [
          if (user != null)
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () => ref.read(authProvider.notifier).logout(),
            ),
        ],
      ),
      body: user == null ? const Login() : MessageList(), //
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/adoption_controller.dart';

class NotificationsPage extends ConsumerWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(
      adoptionControllerProvider.select((state) => state.notifications),
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
          child: Column(
            children: [
              const Center(
                child: Text(
                  '通知',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  itemCount: notifications.length,
                  separatorBuilder: (_, _) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final item = notifications[index];
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      leading: CircleAvatar(
                        backgroundColor: item.color.withValues(alpha: 0.15),
                        child: Icon(item.icon, color: item.color),
                      ),
                      title: Text(
                        item.title,
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text('${item.message}\n${item.time}'),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

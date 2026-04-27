import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/responsive/responsive.dart';
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
          padding: EdgeInsets.fromLTRB(
            context.w(20),
            context.h(16),
            context.w(20),
            0,
          ),
          child: Column(
            children: [
              Center(
                child: Text(
                  '通知',
                  style: TextStyle(
                    fontSize: context.sp(24),
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(height: context.h(16)),
              Expanded(
                child: ListView.separated(
                  itemCount: notifications.length,
                  separatorBuilder: (_, _) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final item = notifications[index];
                    return ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: context.h(10),
                      ),
                      leading: CircleAvatar(
                        backgroundColor: item.color.withValues(alpha: 0.15),
                        child: Icon(item.icon, color: item.color),
                      ),
                      title: Text(
                        item.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: context.sp(16),
                        ),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: context.h(6)),
                        child: Text(
                          '${item.message}\n${item.time}',
                          style: TextStyle(fontSize: context.sp(13)),
                        ),
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

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notice_item.freezed.dart';

@freezed
sealed class NoticeItem with _$NoticeItem {
  const factory NoticeItem({
    required String id,
    required String title,
    required String message,
    required String time,
    required IconData icon,
    required Color color,
  }) = _NoticeItem;
}

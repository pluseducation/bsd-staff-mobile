import 'dart:convert';

import 'package:bst_staff_mobile/data/network/api/notification-api.dart';
import 'package:bst_staff_mobile/data/network/entity/notification-entity.dart';
import 'package:bst_staff_mobile/data/network/network_mapper.dart';
import 'package:bst_staff_mobile/domain/model/notification-app.dart';
import 'package:bst_staff_mobile/util/convert.dart';

class NotificationRepository {
  final NotificationApi notificationApi;
  final NetworkMapper networkMapper;

  NotificationRepository({
    required this.notificationApi,
    required this.networkMapper,
  });

  Future<List<NotificationApp>> findAll(SearchNotification search) async {
    final entity = await notificationApi.findAll(search);

    search.totalElements = entity.totalElements;
    search.totalPages = entity.totalPages;

    // entity to model
    if (entity.content == null || entity.content!.isEmpty) {
      return List.empty();
    }

    final models = entity.content!.map((e) => _convertContentItem(e)).toList();
    return models;
  }

  NotificationApp _convertContentItem(NotificationContentEntity e) {
    final msgEntity = NotificationMsgEntity.fromJson(e.msg!);
    return NotificationApp(
      id: convertToInt(e.id),
      msg: getMsg(msgEntity),
      time: getTime(msgEntity),
      subdivisionName: getSubdivisionName(msgEntity),
      timegone: getTimegone(msgEntity),
      acknowledged: e.acknowledged == 1,
    );
  }

  String getMsg(NotificationMsgEntity? msg) {
    String newMsg = "-";
    if (msg != null) {
      if (msg.type != null && msg.type! == 'APPOINTMENT') {
        if (msg.no != null) {
          newMsg = "คุณมีนัดหมาย ครั้งที่ ${msg.no}";
        } else {
          newMsg = "คุณมีนัดหมายใหม่";
        }
      } else if (msg.type != null && msg.type! == 'CERTIFICATE_REQUEST') {
        newMsg = "ใบรับรองของคุณได้รับการอนุมัติแล้ว";
      }
    }

    return newMsg;
  }

  String getTime(NotificationMsgEntity? msg) {
    String newMsg = "-";
    if (msg != null) {
      if (msg.appointmentAt != null) {
        final tmp = convertToDatetime(msg.appointmentAt);
        newMsg = "เวลา ${formatTime(tmp)}";
      } else if (msg.approvedAt != null) {
        final tmp = convertToDatetime(msg.approvedAt);
        newMsg = "เวลา ${formatTime(tmp)}";
      }
    }

    return newMsg;
  }

  String getSubdivisionName(NotificationMsgEntity? msg) {
    if (msg?.type == "CERTIFICATE_REQUEST") {
      return "";
    }

    String newMsg = "-";
    if (msg != null) {
      if (msg.appointmentPlace != null) {
        newMsg = msg.appointmentPlace!;
      }
    }

    return newMsg;
  }

  String getTimegone(NotificationMsgEntity? msg) {
    String newMsg = "-";
    if (msg != null) {
      final now = DateTime.now();
      if (msg.appointmentAt != null) {
        final tmp = convertToDatetime(msg.appointmentAt);
        final diff = tmp.difference(now);
        final days = diff.inDays;
        final hours = diff.inHours;
        final minutes = diff.inMinutes;
        if (days > 0) {
          newMsg = "อีก $days วัน";
        } else if (hours > 0) {
          newMsg = "อีก $hours ชั่วโมง";
        } else if (minutes > 0) {
          newMsg = "อีก $minutes นาที";
        } else if (days < 0) {
          newMsg = "เมื่อ ${days.abs()} วันที่แล้ว";
        } else if (hours < 0) {
          newMsg = "เมื่อ ${hours.abs()} ชั่วโมงที่แล้ว";
        } else if (hours < 0) {
          newMsg = "เมื่อ ${hours.abs()} นาทีที่แล้ว";
        }
      } else if (msg.approvedAt != null) {
        final tmp = convertToDatetime(msg.approvedAt);
        final diff = tmp.difference(now);
        final days = diff.inDays;
        final hours = diff.inHours;
        final minutes = diff.inMinutes;
        if (days > 0) {
          newMsg = "อีก $days วัน";
        } else if (hours > 0) {
          newMsg = "อีก $hours ชั่วโมง";
        } else if (minutes > 0) {
          newMsg = "อีก $minutes นาที";
        } else if (days < 0) {
          newMsg = "เมื่อ ${days.abs()} วันที่แล้ว";
        } else if (hours < 0) {
          newMsg = "เมื่อ ${hours.abs()} ชั่วโมงที่แล้ว";
        } else if (hours < 0) {
          newMsg = "เมื่อ ${hours.abs()} นาทีที่แล้ว";
        }
      }
    }

    return newMsg;
  }

  Future<void> updateAcknowledged(int id) async {
    await notificationApi.updateAcknowledged(id);
  }
}

class NotificationMsgEntity {
  final String? type;
  final String? no;
  final DateTime? appointmentAt;
  final DateTime? approvedAt; // for certificate request
  final String? appointmentPlace;

  NotificationMsgEntity({
    required this.type,
    required this.no,
    required this.appointmentAt,
    required this.approvedAt, // for certificate request
    required this.appointmentPlace,
  });

  factory NotificationMsgEntity.fromJson(String json) {
    final Map<String, dynamic> newJson =
        jsonDecode(json) as Map<String, dynamic>;
    return NotificationMsgEntity(
      type: newJson['type'] as String?,
      no: newJson['no'] as String?,
      appointmentAt: newJson['appointmentAt'] != null
          ? DateTime.parse(newJson['appointmentAt'] as String)
          : null,
      approvedAt: newJson['approvedAt'] != null
          ? DateTime.parse(newJson['approvedAt'] as String)
          : null,
      appointmentPlace: newJson['appointmentPlace'] as String?,
    );
  }
}

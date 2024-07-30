import 'package:liberbox_mobile/src/member/domain/member.dart';

class MemberSchedule {
  String id;
  String ownerId;
  String scheduleId;
  MemberType type;

  MemberSchedule({
    required this.id,
    required this.ownerId,
    required this.scheduleId,
    required this.type,
  });
}

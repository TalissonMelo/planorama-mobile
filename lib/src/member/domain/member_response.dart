import 'package:liberbox_mobile/src/member/domain/member.dart';

class MemberResponse {
  String id;
  Member member;
  String nickname;

  MemberResponse({
    required this.id,
    required this.member,
    required this.nickname,
  });
}

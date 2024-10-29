import 'dart:convert';

class Configuration {
  String timeZone;
  String language;

  Configuration({
    required this.timeZone,
    required this.language,
  });

  factory Configuration.fromMap(Map map) {
    return Configuration(
      timeZone: map['timeZone'],
      language: map['language'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'timeZone': timeZone,
      'language': language,
    };
  }

  String toJson() => json.encode(toMap());

  static Future<Configuration?> fromJson(String configuration) async {
    return Configuration.fromMapSession(json.decode(configuration));
  }

  factory Configuration.fromMapSession(Map<String, dynamic> map) {
    return Configuration(
      timeZone: map['timeZone'],
      language: map['language'],
    );
  }
}

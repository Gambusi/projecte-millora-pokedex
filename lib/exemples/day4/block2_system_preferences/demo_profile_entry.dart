class DemoProfileEntry {
  const DemoProfileEntry({
    required this.nickname,
    required this.visits,
    required this.showTips,
  });

  final String nickname;
  final int visits;
  final bool showTips;

  factory DemoProfileEntry.fromJson(Map<String, dynamic> json) =>
      DemoProfileEntry(
        nickname: json['nickname'] as String? ?? '',
        visits: json['visits'] as int? ?? 0,
        showTips: json['showTips'] as bool? ?? true,
      );

  Map<String, dynamic> toJson() => {
        'nickname': nickname,
        'visits': visits,
        'showTips': showTips,
      };
}

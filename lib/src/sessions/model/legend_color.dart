class LegendColor {
  String primary;
  String secondary;

  LegendColor({
    required this.primary,
    required this.secondary,
  });

  static LegendColor fromMap(Map map) {
    return LegendColor(
      primary: map['primary'],
      secondary: map['secondary'],
    );
  }
}

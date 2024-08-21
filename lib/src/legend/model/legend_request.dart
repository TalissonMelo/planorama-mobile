class LegendRequest {
  String color;
  String description;

  LegendRequest({
    required this.color,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'color': color,
      'description': description,
    };
  }
}

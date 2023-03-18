class ToolModel {
  String title;
  String details;
  int amount;

  ToolModel({
    required this.title,
    required this.details,
    required this.amount,
  });

  Map<String, dynamic> toJSON() {
    return {
      'title': title,
      'details': details,
      'amount': amount,
    };
  }
}

class Failure {
  String? message;
  Failure({required this.message});

  Failure.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}

class HomeModel {
  final String title;
  final String description;
  final String username;
  final String duration;
  final String? image;

  HomeModel({
    required this.title,
    required this.description,
    required this.username,
    required this.duration,
    this.image,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      title: json['title'],
      description: json['description'],
      username: json['username'],
      duration: json['duration'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'username': username,
      'duration': duration,
      'image': image,
    };
  }
}

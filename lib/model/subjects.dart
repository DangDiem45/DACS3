class Subject {
  final int id;
  final String name;
  final String imageUrl;

  Subject({required this.id, required this.name, required this.imageUrl});

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'] ,
      name: json['name'],
      imageUrl: json['image_url'],
    );
  }
  @override
  String toString() {
    return 'Subject{id: $id, name: $name, image_url: $imageUrl}';
  }
}
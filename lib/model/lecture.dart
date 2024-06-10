class Lecture {
  late final int id;
  late final String name;

  late final int duration;
  late final int subject_id;

  Lecture({required this.id, required this.name, required this.duration, required this.subject_id});
  factory Lecture.fromJson(Map<String, dynamic> json){
    return Lecture(
      id:json['id'] as int,
      name:json['name'] as String,
      duration:json['duration'] as int,
      subject_id:json['subject_id']as int,
    );
  }
  @override
  String toString() {
    return 'Lecture{id: $id, name: $name, duration: $duration, subject_id : $subject_id}';
  }
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['duration'] = this.duration;
    data['subject_id'] = this.subject_id;
    return data;
  }
}

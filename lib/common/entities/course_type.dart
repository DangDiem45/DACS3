class CourseTypeRequestEntity {
  int? id;

  CourseTypeRequestEntity({
    this.id,
  });

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}

class CourseType {
  String? title;
  String? description;
  int? id;

  CourseType({
    this.title,
    this.description,
    this.id,
  });

  factory CourseType.fromJson(Map<String, dynamic> json) {
    return CourseType(
      title: json['name'],
      description: json['description'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "id": id,
    };
  }
}

class CourseTypeListResponseEntity {
  int? code;
  String? msg;
  List<CourseType>? data;

  CourseTypeListResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory CourseTypeListResponseEntity.fromJson(Map<String, dynamic> json) =>
      CourseTypeListResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: json["data"] == null ? [] : List<CourseType>.from(json["data"].map((x) => CourseType.fromJson(x))),
      );
}

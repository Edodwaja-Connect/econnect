class Course {
  String id;
  String title;
  String description;
  String imageUrl;
  String duration;
  double price;
  String tutorName;
  bool isApproved;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.duration,
    required this.price,
    required this.tutorName,
    this.isApproved = false,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'imageUrl': imageUrl,
        'duration': duration,
        'price': price,
        'tutorName': tutorName,
        'isApproved': isApproved,
      };

  static Course fromJson(Map<String, dynamic> json) => Course(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        imageUrl: json['imageUrl'],
        duration: json['duration'],
        price: json['price'].toDouble(),
        tutorName: json['tutorName'],
        isApproved: json['isApproved'],
      );
}

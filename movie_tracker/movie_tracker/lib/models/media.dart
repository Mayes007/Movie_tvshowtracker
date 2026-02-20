class Media {
  String id;
  String title;
  String type; // movie or tv
  bool watched;
  int rating;
  String? posterUrl;

  Media({
    required this.id,
    required this.title,
    required this.type,
    this.watched = false,
    this.rating = 0,
    this.posterUrl,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'type': type,
        'watched': watched,
        'rating': rating,
        'posterUrl': posterUrl,
      };

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json['id'],
        title: json['title'],
        type: json['type'],
        watched: json['watched'],
        rating: json['rating'],
        posterUrl: json['posterUrl'],
      );
}
class Post {
  final String title;
  final String content;
  final String imagePath;

  Post._({this.title, this.content, this.imagePath});

  factory Post.fromJson(Map<String, dynamic> json) {
    return new Post._(
      title: json['title'],
      content: json['content'],
      imagePath: json['url'],
    );
  }
}

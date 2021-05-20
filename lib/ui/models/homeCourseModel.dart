class HomeCourse {
  String slug;
  String title;
  String shortDescription;
  String content;
  String outcome;
  String requirements;
  String language;
  String liveClass;
  Null courseChannel;
  double price;
  double equity;
  int defaultDiscount;
  String level;
  String thumbnail;
  String video;
  bool isPublished;
  bool isFree;
  String createdAt;
  String updatedAt;
  int user;
  List<int> category;

  HomeCourse(
      {this.slug,
      this.title,
      this.shortDescription,
      this.content,
      this.outcome,
      this.requirements,
      this.language,
      this.liveClass,
      this.courseChannel,
      this.price,
      this.equity,
      this.defaultDiscount,
      this.level,
      this.thumbnail,
      this.video,
      this.isPublished,
      this.isFree,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.category});

  factory HomeCourse.fromJson(Map<String, dynamic> json) {
    return HomeCourse(
      slug: json['slug'] as String,
      title: json['title'] as String,
      shortDescription: json['short_description'] as String,
      content: json['content'] as String,
      outcome: json['outcome'] as String,
      requirements: json['requirements'] as String,
      language: json['language'] as String,
      liveClass: json['live_class'] as String,
      courseChannel: json['course_channel'] as String,
      price: json['price'] as double,
      equity: json['equity'] as double,
      defaultDiscount: json['default_discount'] as int,
      level: json['level'] as String,
      thumbnail: "http://maven.mindwebs.org/" + json['thumbnail'] as String,
      video: json['video'] as String,
      isPublished: json['is_published'] as bool,
      isFree: json['is_free'] as bool,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      user: json['user'] as int,
      category: json['category'].cast<int>(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slug'] = this.slug;
    data['title'] = this.title;
    data['short_description'] = this.shortDescription;
    data['content'] = this.content;
    data['outcome'] = this.outcome;
    data['requirements'] = this.requirements;
    data['language'] = this.language;
    data['live_class'] = this.liveClass;
    data['course_channel'] = this.courseChannel;
    data['price'] = this.price;
    data['equity'] = this.equity;
    data['default_discount'] = this.defaultDiscount;
    data['level'] = this.level;
    data['thumbnail'] = this.thumbnail;
    data['video'] = this.video;
    data['is_published'] = this.isPublished;
    data['is_free'] = this.isFree;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user'] = this.user;
    data['category'] = this.category;
    return data;
  }
}

import './lecture.dart';

class FullCourse {
  final String title;
  final String creator;
  final double price;
  final List<String> learning;
  final String requirements;
  final List<String> categories;
  final String description;
  final List<Section> sections;

  FullCourse(
      {this.learning,
      this.requirements,
      this.categories,
      this.description,
      this.sections,
      this.title,
      this.creator,
      this.price});
}

class Section {
  final String title;
  final List<Lecture> lectures;
  Section({this.title, this.lectures});
}

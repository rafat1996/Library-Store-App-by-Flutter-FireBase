class Book {
  final String id;
  final List<String> categories;
  final String title;
  final String writer;
  final int price;
  final String imageUrl;
  final int page;

  Book(
      {required this.id,
      required this.categories,
      required this.title,
      required this.writer,
      required this.price,
      required this.imageUrl,
      required this.page});
}

class Category {
  String category;
  String imageUrl;
  Category({this.category, this.imageUrl});

  List<Category> get categories => _categoryList;
}

List<Category> _categoryList = [
  Category(
    category: 'politics',
    imageUrl: 'assets/images/politics.jpg',
  ),
  Category(
    category: 'business',
    imageUrl: 'assets/images/business.jpg',
  ),
  Category(
    category: 'entertainment',
    imageUrl: 'assets/images/entertainment.png',
  ),
  Category(
    category: 'sports',
    imageUrl: 'assets/images/sports.jpg',
  ),
  Category(
    category: 'technology',
    imageUrl: 'assets/images/technology.jpg',
  ),
];

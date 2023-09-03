class CategoryItem {
  final String id;
  final String name;
  final String imgurl;

  CategoryItem({required this.id, required this.name, required this.imgurl});
}

List<CategoryItem> categ = [
  CategoryItem(id: '1', name: 'Burger', imgurl: 'lib/assets/images/burger.png'),
  CategoryItem(id: '2', name: 'Pizza', imgurl: 'lib/assets/images/pizza.png'),
  CategoryItem(id: '3', name: 'Pasta', imgurl: 'lib/assets/images/pasta.png'),
  CategoryItem(id: '4', name: 'Chicken', imgurl: 'lib/assets/images/chicken.png'),
];

class fooditem {
  final String id;
  final String name;
  final String imgUrl;
  final double price;
  final String estimatedTime;
  final int numberOfSales;
  final String category;
  final bool isFavorite;

  fooditem({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.price,
    this.estimatedTime = '30 min',
    this.numberOfSales = 2,
    required this.category,
    this.isFavorite = false,
  });

  fooditem copyWith({bool? isFavorite}) {
    return fooditem(
      id: id,
      name: name,
      imgUrl: imgUrl,
      price: price,
      category: category,
      estimatedTime: estimatedTime,
      numberOfSales: numberOfSales,
      isFavorite: isFavorite ?? this.isFavorite,
    );

    
  }
}

List<fooditem> food = [
  fooditem(
      id: '1',
      name: 'Beef Burger',
      imgUrl:
          'https://static.vecteezy.com/system/resources/thumbnails/022/911/694/small/cute-cartoon-burger-icon-free-png.png',
      price: 6.99,
      category: 'Burger'),
  fooditem(
      id: '2',
      name: 'Chicken Burger',
      imgUrl:
          'https://static.vecteezy.com/system/resources/previews/022/911/684/non_2x/classic-chicken-burger-free-illustration-icon-free-png.png',
      price: 7.99,
      category: 'Burger'),
  fooditem(
      id: '3',
      name: 'Cheese Burger',
      imgUrl:
          'https://static.vecteezy.com/system/resources/previews/020/640/042/original/delicious-mouth-watering-hamburger-cheeseburger-with-cheese-tomato-and-lettuce-on-a-transparent-background-free-png.png',
      price: 6.99,
      category: 'Burger'),
  fooditem(
      id: '4',
      name: 'Chicken Pizza',
      imgUrl:
          'https://static.vecteezy.com/system/resources/previews/024/108/111/original/tasty-bbq-chicken-cheese-pizza-isolated-on-transparent-background-png.png',
      price: 6.99,
      category: 'Pizza'),
  fooditem(
      id: '5',
      name: 'Margreta Pizza',
      imgUrl:
          'https://static.vecteezy.com/system/resources/previews/008/541/871/original/margherita-pizza-baked-food-transparent-png.png',
      price: 6.99,
      category: 'Pizza'),
  fooditem(
      id: '6',
      name: 'Lazania',
      imgUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGIxkr8zTU755V94MdyEgH1_NK-MPFR869m76ibZ8onr_EgPD66umS7AN6mbVlcFaj5VQ&usqp=CAU',
      price: 6.99,
      category: 'Pasta'),
  fooditem(
      id: '7',
      name: 'Koshary',
      imgUrl:
          'https://media.istockphoto.com/id/477995722/photo/kushari-koshari-egyptian-food.jpg?s=612x612&w=0&k=20&c=dOpxcG7VjeUQZxSrtaW06qRtB3iklor-oJw2cyDPm5M=',
      price: 6.99,
      category: 'Pasta'),
  fooditem(
      id: '8',
      name: 'Fried Chicken',
      imgUrl:
          'https://static.vecteezy.com/system/resources/previews/021/952/445/original/southern-fried-chicken-fried-chicken-transparent-background-png.png',
      price: 6.99,
      category: 'Chicken'),
  fooditem(
      id: '9',
      name: 'Grilled Chicken',
      imgUrl:
          'https://static.vecteezy.com/system/resources/previews/023/338/222/non_2x/ai-generative-roast-chicken-free-illustration-free-png.png',
      price: 6.99,
      category: 'Chicken'),
];

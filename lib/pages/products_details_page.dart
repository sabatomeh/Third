import 'package:flutter/material.dart';
import 'package:food_del/models/food_item.dart';
import 'package:food_del/widgets/product_details_properety.dart';

class ProductsDetailsPage extends StatefulWidget {
  final fooditem food;
  const ProductsDetailsPage({super.key, required this.food});

  @override
  State<ProductsDetailsPage> createState() => _ProductsDetailsPageState();
}

class _ProductsDetailsPageState extends State<ProductsDetailsPage> {
  int quentity = 1;
  bool fav = false;
  void _decreaseQuentity() {
    setState(() {
      if (quentity > 1) {
        quentity--;
      }
    });
  }

  void _increaseQuentity() {
    setState(() {
      quentity++;
    });
  }

  String _size() {
    if (widget.food.category == 'Burger') {
      return 'Medium';
    } else if (widget.food.category == 'Pizza') {
      return 'Larg';
    } else if (widget.food.category == 'Pasta') {
      return 'small';
    } else {
      return 'Very larg';
    }
  }

  String _calories() {
    if (widget.food.category == 'Burger') {
      return '150 KCal';
    } else if (widget.food.category == 'Pizza') {
      return '160 KCal';
    } else if (widget.food.category == 'Pasta') {
      return '130 KCal';
    } else {
      return '170 KCal';
    }
  }

  String _cooking() {
    if (widget.food.category == 'Burger') {
      return '5-10 min';
    } else if (widget.food.category == 'Pizza') {
      return '10-15 min';
    } else if (widget.food.category == 'Pasta') {
      return '10-12 min';
    } else {
      return '10-15 min';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.food.name),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  fav = !widget.food.isFavorite;
                  widget.food.isFavorite = fav;
                });
              },
              icon: fav || widget.food.isFavorite
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border),
              color: Colors.deepOrange,
            ),
            SizedBox(width: 8.0),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Image.network(widget.food.imgUrl,
                                width: double.infinity,
                                height: 250,
                                fit: BoxFit.contain),
                          )),
                      SizedBox(height: 32.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.food.name,
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      widget.food.category,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ],
                                ),
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: _decreaseQuentity,
                                          icon: Icon(Icons.remove)),
                                      Text(quentity.toString()),
                                      IconButton(
                                          onPressed: _increaseQuentity,
                                          icon: Icon(Icons.add)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 32.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ProductDetailsProperty(
                                  title: 'Size',
                                  value: _size(),
                                ),
                                SizedBox(height: 40, child: VerticalDivider()),
                                ProductDetailsProperty(
                                  title: 'Calories',
                                  value: _calories(),
                                ),
                                SizedBox(height: 40, child: VerticalDivider()),
                                ProductDetailsProperty(
                                  title: 'Cooking',
                                  value: _cooking(),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 32.0,
                            ),
                            Text(
                              'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black45,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        '\$ ${widget.food.price * quentity}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            )),
                        child: Text('Check out'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

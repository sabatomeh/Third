import 'package:flutter/material.dart';
import 'package:food_del/models/category_item.dart';
import 'package:food_del/models/food_item.dart';
import 'package:food_del/pages/favorite_page.dart';
import 'package:food_del/pages/products_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? selectedCategoryIndex;
  late List<fooditem> filteredFood;
  
  @override
  void initState() {
    super.initState();
    filteredFood = food;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.menu),
                    ),
                  ),
                ),
                const Column(
                  children: [
                    Text(
                      'current location',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 20,
                          color: Colors.green,
                        ),
                        SizedBox(width: 6.0),
                        Text(
                          'Palestine, Tulkarm',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.notifications),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                'https://t4.ftcdn.net/jpg/02/94/30/59/360_F_294305984_6Oloa4kkSKjpHXegEWFqryY1PrhRRMeN.jpg',
                height: 200,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 32.0),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search_rounded, color: Colors.grey),
                hintText: 'Find your food...',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 32.0),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categ.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsetsDirectional.only(end: 12.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (selectedCategoryIndex == null ||
                            selectedCategoryIndex != index) {
                          selectedCategoryIndex = index;
                        } else {
                          selectedCategoryIndex = null;
                          filteredFood = food;
                        }
                      });
                      if (selectedCategoryIndex != null) {
                        final selectedCategory = categ[selectedCategoryIndex!];
                        filteredFood = food
                            .where((fooditem) =>
                                fooditem.category == selectedCategory.name)
                            .toList();
                      }
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: index == selectedCategoryIndex
                              ? Colors.deepOrange
                              : Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                categ[index].imgurl,
                                height: 50,
                                width: 50,
                                color: index == selectedCategoryIndex
                                    ? Colors.white
                                    : null,
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                categ[index].name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: index == selectedCategoryIndex
                                      ? Colors.white
                                      : Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32.0),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 18,
                crossAxisSpacing: 18,
              ),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: filteredFood.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductsDetailsPage(
                            food: filteredFood[index],
                          )));
                },
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Column(
                          children: [
                            Image.network(
                              filteredFood[index].imgUrl,
                              height: 100,
                            ),
                            Text(
                              filteredFood[index].name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(filteredFood[index].category,
                                style: const TextStyle(
                                  color: Colors.grey,
                                )),
                            const SizedBox(
                              height: 4.0,
                            ),
                            Text('\$ ${filteredFood[index].price}',
                                style: const TextStyle(
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                )),
                          ],
                        ),
                        PositionedDirectional(
                          top: 0,
                          end: 0,
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  filteredFood[index] = filteredFood[index]
                                      .copyWith(
                                          isFavorite:
                                              !filteredFood[index].isFavorite);
                                  final selectedFoodItem = food.firstWhere(
                                      (item) =>
                                          item.id == filteredFood[index].id);
                                  final selectedFoodItemIndex =
                                      food.indexOf(selectedFoodItem);
                                  food[selectedFoodItemIndex] =
                                      filteredFood[index];

                                  if (filteredFood[index].isFavorite) {
                                    favoritesPage f = favoritesPage();
                                    f.l1.add(filteredFood[index]);
                                  }
                                });
                              },
                              icon: Icon(filteredFood[index].isFavorite == false 
                                  ? Icons.favorite_border
                                  : Icons.favorite),
                              color: Colors.deepOrange),
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

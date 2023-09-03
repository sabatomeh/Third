import 'package:flutter/material.dart';
import 'package:food_del/models/food_item.dart';

// ignore: must_be_immutable
class favoritesPage extends StatefulWidget {
  favoritesPage({super.key});
  List<fooditem> l1 = [];
  @override
  State<favoritesPage> createState() => _favoritesPageState();
}

class _favoritesPageState extends State<favoritesPage> {
  favoritesPage f = favoritesPage();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: f.l1.length,
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.network(f.l1[index].imgUrl,
                  height: 100, width: 70, fit: BoxFit.fill),
              title: Text(
                f.l1[index].name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${f.l1[index].category} - \$${f.l1[index].price}',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    f.l1.removeAt(index);
                  });
                },
                icon: Icon(Icons.favorite),
                color: Colors.deepOrange,
              ),
            ),
          ),
        );
      },
    );
  }
}

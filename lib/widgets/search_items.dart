import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../providers/product.dart';
import '../screens/product_detail_screen.dart';

class SearchItems extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    //Actions for appBar
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear)),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on the left side of the appBar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some results based on the selection
    return Icon(Icons.home);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //show when someone searches for something
    final productsData = Provider.of<Products>(context);
    final suggestionList = query.isEmpty
        ? productsData.favoriteItems
        : productsData.items
            .where((element) =>
                element.title.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].title.substring(0, query.length),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: suggestionList[index].title.substring(query.length),
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}

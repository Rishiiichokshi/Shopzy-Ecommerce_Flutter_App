import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    // Product(
    //   id: 'p1',
    //   title: 'Jordan x Dior',
    //   description:
    //       'One of the most highly anticipated launches of the year. The Dior x'
    //       ' Air Jordan 1 High sneakers are the first collaboration between the luxury'
    //       ' powerhouse and sneaker giant.',
    //   price: 29.99,
    //   imageUrl:
    //       'https://cdn.shopify.com/s/files/1/0360/6491/9692/products/image_ccec585c-9143-4b9e-aa65-103aae236fc2_1000x.jpg?v=1625313969',
    // ),
    // Product(
    //   id: 'p2',
    //   title: 'AIR JORDAN I',
    //   description: 'Jordans exclusive blue retro sneakers',
    //   price: 59.99,
    //   imageUrl:
    //       'https://cdn.bikayi.app/ci/images/dc7f2367-4d7d-45ea-add8-8ad2574d9820?alt=media&token=779236b8-a94f-4ec8-afb4-e8e1ca690feb',
    // ),
    // Product(
    //   id: 'p3',
    //   title: 'AIR JORDAN II',
    //   description: 'The Air Jordan series by Jordan Brand is'
    //       'considered the greatest signature shoe collection ever.',
    //   price: 500.99,
    //   imageUrl:
    //       'https://m.media-amazon.com/images/I/61mWsTKtnZL._AC_UL1200_.jpg',
    // ),
    // Product(
    //   id: 'p4',
    //   title: 'Jordan 1 White Shadow',
    //   description:
    //       'The Air Jordan 1 Mid “White Shadow” highlights the wearability'
    //       'of Michael Jordan’s first signature shoe in its mid-top design by making use of a clean,'
    //       'neutral based color scheme. The upper of this "White Shadow" colorway is complete with white'
    //       'leather on the perforated toe, upper eyelets, collar overlay, and heel. A variety of smooth'
    //       'black leather is located on the forefoot overlay and mid-panel. Light Smoke Grey Swoosh branding'
    //       'appears on the sides and a black leather “Wings” logo resides on the collar. A white Jumpman emblem'
    //       'can be found on the black nylon tongue tag stitched onto the white nylon tongue. The "White Shadow"'
    //       'nickname is in reference to this colorway appearing similar to the original black and grey'
    //       '"Shadow" colorway from 1985, just with added white panels. Release date: November 27, 2020.',
    //   price: 250,
    //   imageUrl:
    //       'https://cdn.shopify.com/s/files/1/0360/6491/9692/products/JORDAN1RETROHIGHTOKYOBIOHACK_4d0fe41f-f174-492f-9237-21f75959cda2_1000x.jpg?v=1641992106',
    // ),
    // Product(
    //   id: 'p5',
    //   title: 'Retro High',
    //   description: 'The Air Jordan series by Jordan Brand is'
    //       'considered the greatest signature shoe collection ever.',
    //   price: 500.99,
    //   imageUrl:
    //       'https://cdn.shopify.com/s/files/1/0360/6491/9692/products/image_54927220-3f8a-4437-b82b-774d9e9aa0fd_1000x.jpg?v=1616775477',
    // ),
    // Product(
    //   id: 'p6',
    //   title: 'Jordan Delta 2 x CLOT',
    //   description: 'The Air Jordan series by Jordan Brand is'
    //       'considered the greatest signature shoe collection ever.',
    //   price: 500.99,
    //   imageUrl:
    //       'https://cdn.shopify.com/s/files/1/0360/6491/9692/products/Artboard1copy3_1_1000x.png?v=1643451867',
    // ),
    // Product(
    //   id: 'p7',
    //   title: 'Jumpman Two Trey',
    //   description: 'The Air Jordan series by Jordan Brand is'
    //       'considered the greatest signature shoe collection ever.',
    //   price: 500.99,
    //   imageUrl:
    //       'https://cdn.shopify.com/s/files/1/0360/6491/9692/products/Artboard1copy3_2_1_1000x.png?v=1643087485',
    // ),
    // Product(
    //   id: 'p8',
    //   title: 'Jordan Max Aura 3',
    //   description:
    //       'Travis Scott and Jordan Brand teamed up to deliver the Air Jordan 6 Retro Travis Scott British Khaki.'
    //       'The upper of the Air Jordan 6 Retro Travis Scott British Khaki is made of British Khaki suede. From there, hits of Bright Crimson appear on the heel and tongue embroidered logos.',
    //   price: 500.99,
    //   imageUrl:
    //       'https://cdn.shopify.com/s/files/1/0360/6491/9692/products/image_7069c8e1-11d4-4310-8d0c-bf29f5e7e0c5_1000x.jpg?v=1624707625',
    // ),
    // Product(
    //   id: 'p9',
    //   title: 'highLander',
    //   description:
    //       'The Dear Summer collection, that includes the Nike Dunk Low Off-White Lot 24, '
    //       'is an extensive follow-up to Virgil Ablohs initial Nike Dunk partnership from 2019. The '
    //       'Nike Dunk Low Off-White Lot 24 has a half-leather, half-canvas foundation with grey and cream colours. '
    //       'Pink overlays, a purple snap tie, as well as a tongue are all design features.',
    //   price: 500.99,
    //   imageUrl:
    //       'https://cdn.shopify.com/s/files/1/0360/6491/9692/products/2_bed4057d-a10c-4155-b1c3-09d8107d7d2a_1000x.png?v=1636791242',
    // ),
  ];

  // var _showFavoritesOnly = false;
  final String authtoken;
  final String userId;

  Products(this.authtoken, this.userId, this._items);

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  Future<void> fetchAndSetProducts([bool filterByUser = false]) async {
    final filterString = filterByUser ? 'orderBy="creatorId"&equalTo="$userId"' : '';
    //we arr using the token here by constructor
    var url = Uri.parse('https://myshopapp-90643-default-rtdb.firebaseio.com/products.json?auth=$authtoken&$filterString');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if(extractedData == null) {
        return;
      }
      url = Uri.parse(
          'https://myshopapp-90643-default-rtdb.firebaseio.com/userFavourites/$userId.json?auth=$authtoken');
      final favouriteResponse = await http.get(url);
      final favouriteData = json.decode(favouriteResponse.body);
      final List<Product> loadedProducts = [];
      extractedData.forEach((prodId, prodData) {
        loadedProducts.add(Product(
          id: prodId,
          title: prodData['title'],
          description: prodData['description'],
          price: prodData['price'],
          isFavorite: favouriteData == null ? false : favouriteData[prodId] ?? false,
          imageUrl: prodData['imageUrl'],
        ));
      });
      _items = loadedProducts;
      notifyListeners();
    } catch(error) {
      throw(error);
    }

  }

  Future<void> addProduct(Product product) {
    var url = Uri.parse('https://myshopapp-90643-default-rtdb.firebaseio.com/products.json?auth=$authtoken');
    return http.post(url, body: json.encode({
      'title': product.title,
      'description': product.description,
      'price': product.price,
      'imageUrl': product.imageUrl,
      'creatorId': userId,
    })).then((response) {
      final newProduct = Product(
          id: json.decode(response.body)['name'],
          title: product.title,
          price: product.price,
          description: product.description,
          imageUrl: product.imageUrl,
      );
      _items.add(newProduct);

      notifyListeners();
    }).catchError((error) {
      print(error);
      throw error;
    });
  }

  Future<void> updateProduct(String id, Product newProduct) async {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if(prodIndex >= 0) {
      final url = Uri.parse('https://myshopapp-90643-default-rtdb.firebaseio.com/products/$id.json?auth=$authtoken');
      await http.patch(url, body: json.encode({
        'title': newProduct.title,
        'description': newProduct.description,
        'imageUrl': newProduct.imageUrl,
        'price': newProduct.price,
      }));
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  void deleteProducts(String id) {
    final url = Uri.parse('https://myshopapp-90643-default-rtdb.firebaseio.com/products/$id.json?auth=$authtoken');
    final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    var existingProduct = _items[existingProductIndex];
    http.delete(url).then((_) {
      existingProduct = null;
    }).catchError((_) {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
    });
    _items.removeAt(existingProductIndex);
    notifyListeners();
  }
}

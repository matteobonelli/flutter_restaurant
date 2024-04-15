import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_x/features/cart/data/models/cart_line_product.dart';

import '../features/cart/data/models/cart.dart';
import '../features/menu/data/models/product.dart';
import '../features/registration/data/models/user.dart';
import 'package:uuid/uuid.dart';

class FirestoreHelper {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<List<Product>> fetchProducts() async {
    final prodList = await _db.collection("products").get();
    List<Product> products = prodList.docs.map((doc) {
      final data = doc.data();
      return Product(
          id: doc.id,
          name: data['name'],
          price: data['price'],
          description: data['description'],
          image: data['image'],
          category: Category.values
              .where((element) => element.name == data['category'])
              .first);
    }).toList();

    return products;
  }

  // static Future<void> addProducts(List<Product> productList) async{
  //   try{
  //     for(final product in productList) {
  //       await _db.collection("products").add({
  //         'name' : product.name,
  //         'price' : product.price,
  //         'image' : product.image,
  //         'description' : product.description,
  //         'category' : product.category.name
  //       });
  //     }
  //
  //   } catch (e){
  //     print(e);
  //   }
  //
  // }

  static Future<Cart> fetchCart(String? userId) async {
    final cartSnap =
    await _db.collection("carts").where('userId', isEqualTo: userId).get();
    final cartData = cartSnap.docs[0];
    List<CartLineProduct> cartList = [];
    for (final item in cartData.data()['items']) {
      final itemProduct = await _db.collection('products')
          .doc(item['product'])
          .get();
      final newProduct = itemProduct.data();
      final Product product = Product(
          id: item['product'],
          name: newProduct?['name'],
          price: newProduct?['price'],
          description: newProduct?['description'],
          image: newProduct?['image'],
          category: Category.values
              .where((element) => element.name == newProduct?['category'])
              .first,
      );
      cartList.add(CartLineProduct(
          product: product,
          cartId: cartSnap.docs[0].id.toString(),
          quantity: item['quantity'],
          id: item['id'],
      ));
    }
    return Cart(
        items: cartList,
        userId: cartData.data()['userId'].toString(),
        id: cartSnap.docs[0].id.toString());
  }

  static Future<void> createUser(Users newUser, String? id) async {
    try {
      await _db.collection('users').doc(id).set(newUser.toJson());
    } catch (e) {
      print(e);
    }
  }

  static Future<void> createCart(String? userId) async {
    try {
      await _db
          .collection('carts')
          .doc()
          .set(Cart(items: [], userId: userId).toJson());
    } catch (e) {
      print(e);
    }
  }

  static Future<void> addItemsToCart(String? cartId,
      List<CartLineProduct> cli) async {
    try {
      final cartRef = _db.collection('carts').doc(cartId);
      final currentItems = cli.map((item) => item.toJson()).toList();
      await cartRef.set({
        'items': currentItems,
      }, SetOptions(merge: true));
    } catch (e) {
      print(e);
    }
  }

  // Metodo per creare o aggiornare un documento
  Future<void> createOrUpdate(String collectionPath, String docId,
      Map<String, dynamic> data) async {
    await _db
        .collection(collectionPath)
        .doc(docId)
        .set(data, SetOptions(merge: true));
  }

  // Metodo per leggere un singolo documento
  Future<DocumentSnapshot> readDocument(String collectionPath,
      String docId) async {
    return await _db.collection(collectionPath).doc(docId).get();
  }

  // Metodo per leggere tutti i documenti di una collezione
  Future<QuerySnapshot> readCollection(String collectionPath) async {
    return await _db.collection(collectionPath).get();
  }

  // Metodo per aggiornare un documento esistente
  Future<void> updateDocument(String collectionPath, String docId,
      Map<String, dynamic> data) async {
    await _db.collection(collectionPath).doc(docId).update(data);
  }

  // Metodo per eliminare un documento
  Future<void> deleteDocument(String collectionPath, String docId) async {
    await _db.collection(collectionPath).doc(docId).delete();
  }
}


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_x/features/cart/data/models/cart_line_product.dart';

import '../features/cart/data/models/cart.dart';
import '../features/menu/data/models/product.dart';

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
          category: Category.values.where((element) => element.name == data['category']).first
      );
    }).toList();

    return products;
  }

  static Future<void> addItemsToCart(String cartId, List<CartLineProduct> cli) async {
    try{
       var cartRef = _db.collection('carts').doc(cartId);
       var currentItems = cli.map((item) => item.toJson()).toList();

       await cartRef.set({
         'items' : currentItems,
       }, SetOptions(merge: true));
    } catch (e) {
      print(e);
    }
  }

  // Metodo per creare o aggiornare un documento
  Future<void> createOrUpdate(
      String collectionPath, String docId, Map<String, dynamic> data) async {
    await _db
        .collection(collectionPath)
        .doc(docId)
        .set(data, SetOptions(merge: true));
  }

  // Metodo per leggere un singolo documento
  Future<DocumentSnapshot> readDocument(
      String collectionPath, String docId) async {
    return await _db.collection(collectionPath).doc(docId).get();
  }

  // Metodo per leggere tutti i documenti di una collezione
  Future<QuerySnapshot> readCollection(String collectionPath) async {
    return await _db.collection(collectionPath).get();
  }

  // Metodo per aggiornare un documento esistente
  Future<void> updateDocument(
      String collectionPath, String docId, Map<String, dynamic> data) async {
    await _db.collection(collectionPath).doc(docId).update(data);
  }

  // Metodo per eliminare un documento
  Future<void> deleteDocument(String collectionPath, String docId) async {
    await _db.collection(collectionPath).doc(docId).delete();
  }
}

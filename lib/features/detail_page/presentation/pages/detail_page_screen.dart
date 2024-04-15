import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/theme/theme_controller.dart';
import '../../../menu/data/models/product.dart';

class DetailPageScreen extends StatelessWidget {
  const DetailPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final Product product = Get.arguments ?? '';
    return Scaffold(
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.secondary),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          product.name,
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                themeController.toggleTheme();
                themeController.isSwitched = !themeController.isSwitched;
              },
              icon: themeController.isSwitched
                  ? const Icon(Icons.light_mode, color: Colors.yellowAccent,)
                  : const Icon(Icons.dark_mode))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Hero(
                  tag: product.id,
                  child: CircleAvatar(
                      radius: 120,
                      backgroundImage: NetworkImage(product.image!)),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  product.name,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  product.description,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "A soli: ${product.price.toStringAsFixed(2)} €",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Categoria: ${product.category.name[0].toUpperCase() + product.category.name.substring(1)}',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

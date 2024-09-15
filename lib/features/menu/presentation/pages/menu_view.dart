import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project_x/features/cart/data/models/cart_line_product.dart';
import 'package:project_x/features/menu/data/mock_data/mock_data.dart';
import 'package:project_x/features/menu/presentation/controllers/menu_controller.dart';

import '../../../../utils/theme/theme_controller.dart';
import '../../../dashboard/presentation/controllers/user_controller.dart';
import '../widgets/menu_item_card.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return GetBuilder<MenusController>(
      builder: (controller) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text(
            "Menù",
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          ),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  themeController.toggleTheme();
                  themeController.isSwitched = !themeController.isSwitched;
                },
                icon: themeController.isSwitched
                    ? const Icon(
                        Icons.light_mode,
                        color: Colors.yellowAccent,
                      )
                    : const Icon(Icons.dark_mode))
          ],
        ),
        body: ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (BuildContext context, int index) {
              return MenuItemCard(
                  index: index, product: controller.products[index]);
            }),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).colorScheme.tertiary,
          unselectedItemColor: Theme.of(context).colorScheme.tertiary,
          currentIndex: 0,
          onTap: (index) {
            controller.getToCart(index);
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.lunch_dining,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                label: "Menù"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                label: "Carrello")
          ],
        ),
        drawer: GetBuilder<UserController>(
          builder: (userController) => Drawer(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: DrawerHeader(
                      margin: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).colorScheme.primaryContainer),
                      curve: Curves.easeInToLinear,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                      "https://t3.ftcdn.net/jpg/05/16/27/58/360_F_516275801_f3Fsp17x6HQK0xQgDQEELoTuERO4SsWV.jpg"),
                                ),
                                SizedBox(width: 12,),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Text(
                                        userController.userData.name[0]
                                                .toUpperCase() +
                                            userController.userData.name
                                                .substring(1),
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            overflow: TextOverflow.ellipsis, fontWeight: FontWeight.bold, fontSize: 20),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Flexible(
                                        flex: 2,
                                        child: Text(
                                          userController.userData.surname[0]
                                              .toUpperCase() +
                                              userController.userData.surname
                                                  .substring(1),
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary, overflow: TextOverflow.ellipsis, fontWeight: FontWeight.bold, fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.logout),
                        color: Theme.of(context).colorScheme.tertiary,
                        onPressed: () {
                          controller.logout();
                        },
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

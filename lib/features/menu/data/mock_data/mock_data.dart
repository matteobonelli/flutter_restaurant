import 'package:project_x/features/menu/data/models/product.dart';

final List<Product> products = [
  Product(
      name: "Spaghetti al pomodoro",
      price: 10.99,
      description: "Gli spaghetti più buoni del mondo, come li fa la nonna",
      category: Category.pasta,
      image:
          "https://www.vincenzosplate.com/wp-content/uploads/2023/01/1500x1500-Photo-1_2410-How-to-Make-SPAGHETTI-ALL_-ASSASSINA-Like-and-Italian-Killer-Spaghetti-V1.jpg"),
  Product(
      name: "Pappardelle con vero ragù di cinghiale",
      price: 14.99,
      description: "Pappardelle con vero ragù di cinghiale",
      category: Category.pasta,
      image:
          "https://www.casapappagallo.it/storage/21303/pappardelle-con-il-cinghiale-%28sito%29.jpg"),
  Product(
      name: "Tiramisù",
      price: 6.99,
      description: "Un tiramisù che ti tira su quando ti senti giù",
      category: Category.dolce,
      image:
          "https://www.cucchiaio.it/content/cucchiaio/it/ricette/2009/12/ricetta-tiramisu/jcr:content/header-par/image_single.img10.jpg/1448965006057.jpg"),
];

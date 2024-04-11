import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Il tuo carrello è vuoto!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
          Text("Per favore aggiungi qualche prodotto.")
        ],
      )
    );
  }
}

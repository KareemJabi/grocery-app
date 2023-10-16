import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/cart.dart';

class checkOut extends StatefulWidget {
  const checkOut({super.key});

  @override
  State<checkOut> createState() => _checkOutState();
}

class _checkOutState extends State<checkOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("check out"),
          actions: [
            Row(
              children: [
                const Icon(Icons.price_change),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Consumer<cart>(
                    builder: (context, cart, chiild) {
                      return Text("    ${cart.totalprice} JD");
                    },
                  ),
                )
              ],
            ),
          ],
        ),
        body: Consumer<cart>(
          builder: (context, cart, child) {
            return ListView.builder(
                itemCount: cart.basketitem.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      Card(
                        child: ListTile(
                          title: Text(
                              "${cart.basketitem[i].name} \n ${cart.basketitem[i].price}"),
                          trailing: IconButton(
                              onPressed: () {
                                cart.remove(cart.basketitem[i]);
                              },
                              icon: const Icon(Icons.remove)),
                        ),
                      ),
                    ],
                  );
                });
          },
        ));
  }
}

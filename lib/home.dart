import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test11/checkOut.dart';
import 'model/item.dart';
import 'model/cart.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Item> items = [
    Item(
      name: "iphone 13",
      price: 900.0,
    ),
    Item(
      name: "Samsung",
      price: 800.0,
    ),
    Item(
      name: "Iphone 13 pro",
      price: 1000.0,
    ),
    Item(
      name: "Iphone x",
      price: 600,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const checkOut()));
                  });
                },
                icon: const Icon(Icons.shopping_cart),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Consumer<cart>(
                  builder: (context, cart, chiild) {
                    return Text("${cart.count}");
                  },
                ),
              )
            ],
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, i) {
          return Card(child: Consumer<cart>(
            builder: (context, cart, child) {
              return ListTile(
                title: Text(
                  "${items[i].name}  \n ${items[i].price}JD",
                ),
                trailing: IconButton(
                    onPressed: () {
                      cart.add(items[i]);
                    },
                    icon: const Icon(Icons.add)),
              );
            },
          ));
        },
        itemCount: items.length,
      ),
    );
  }
}

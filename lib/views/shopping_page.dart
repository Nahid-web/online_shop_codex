import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop_codex/controllers/card_controller.dart';
import 'package:online_shop_codex/controllers/shopping_controller.dart';
import 'package:online_shop_codex/models/product.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({super.key});

  final ShoppingController shoppingController = Get.put(ShoppingController());
  final CardController cardController =Get.put(CardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${controller.products[index].productName}',
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                    Text(
                                        '${controller.products[index].productDescription}'),
                                  ],
                                ),
                                Text('\$${controller.products[index].price}',
                                    style: const TextStyle(fontSize: 24)),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                 cardController.addToCard(controller.products[index]);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white
                              ),
                              child: const Text('Add to Cart'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            GetX<CardController>(
              builder: (controller) {
                return Text('Total amount : \$ ${controller.totalPrice} ' , style: const TextStyle(
                  fontSize: 25, color: Colors.white
                ),);
              }
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){},
          backgroundColor: Colors.amber,
          icon: const Icon(Icons.shopping_cart_checkout_outlined,),
          label: GetX<CardController>(
            builder: (controller) {
              return Text(controller.count.toString());
            }
          )),
    );
  }
}

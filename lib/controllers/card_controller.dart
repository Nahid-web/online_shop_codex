
import 'package:get/get.dart';
import 'package:online_shop_codex/models/product.dart';

class CardController extends GetxController{
  RxList cardItems = <Product>[].obs;
  int get count => cardItems.length;
  double get totalPrice => cardItems.value.fold(0, (previousValue, element) => previousValue + element.price);
  addToCard(Product product){
    cardItems.add(product);
  }
}
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackex/fragments/cartview_model.dart';

class CartView extends StatelessWidget {
 const CartView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<CartViewModel>.reactive(
     builder: (context, model, child) => Scaffold(),
     viewModelBuilder: () => CartViewModel(),
   );
 }
}
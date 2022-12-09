import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackex/ui/secondview_model.dart';

class SecondView extends StatelessWidget {
 const SecondView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<SecondViewModel>.reactive(
     builder: (context, model, child) => Scaffold(
       appBar: AppBar(
         automaticallyImplyLeading: false,

       ),
       body: Center(child: Text("Welcome")),
     ),
     viewModelBuilder: () => SecondViewModel(),
   );
 }
}
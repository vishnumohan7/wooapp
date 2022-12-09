import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackex/fragments/blogview_model.dart';

class BlogView extends StatelessWidget {
 const BlogView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<BlogViewModel>.reactive(
     builder: (context, model, child) => Scaffold(),
     viewModelBuilder: () => BlogViewModel(),
   );
 }
}
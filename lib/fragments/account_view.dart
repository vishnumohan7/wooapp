import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackex/fragments/accountview_model.dart';

class AccountView extends StatelessWidget {
 const AccountView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<AccountViewModel>.reactive(
     builder: (context, model, child) => Scaffold(),
     viewModelBuilder: () => AccountViewModel(),
   );
 }
}
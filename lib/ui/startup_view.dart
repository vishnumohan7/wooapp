import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stackex/app/app.locator.dart';
import 'package:stackex/app/app.router.dart';
import 'package:stackex/fragments/account_view.dart';
import 'package:stackex/fragments/blog_view.dart';
import 'package:stackex/fragments/cart_view.dart';
import 'package:stackex/fragments/category_view.dart';
import 'package:stackex/fragments/home_view.dart';
import 'package:stackex/ui/second_view.dart';
import 'package:stackex/ui/startupview_model.dart';

class StartupView extends StatelessWidget {
  final _nagivationService = locator<NavigationService>();
  StartupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> fragments = [HomeView(),BlogView(),CategoryView(),CartView(),AccountView()];
    return ViewModelBuilder<StartupViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: fragments[model.selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.red,
          type: BottomNavigationBarType.fixed,
          onTap: (value){
            model.onTap(value);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.edit_note),label: "Blog"),
            BottomNavigationBarItem(icon: Icon(Icons.category_outlined),label: "Category"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_rounded),label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "Account"),

          ],
        ),
      ),
      viewModelBuilder: () => StartupViewModel(),
    );
  }
}

import 'package:stacked/stacked.dart';
class StartupViewModel extends BaseViewModel {

  int selectedIndex = 0;

  onTap(value){

    selectedIndex = value;
    notifyListeners();

  }

}
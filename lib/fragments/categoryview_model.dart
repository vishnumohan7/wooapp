import 'package:http/http.dart' as http;
import 'package:stacked/stacked.dart';
import 'package:stackex/helpers/api_service.dart';
import 'package:stackex/models/CategoryModel.dart';

class CategoryViewModel extends BaseViewModel {
  ApiService apiService = ApiService();

  Future<List<CategoryModel>> getData() {
   var response =  apiService.getAllCategories();
    print(response);
    notifyListeners();
    return response;
  }
}

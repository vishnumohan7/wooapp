import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackex/fragments/categoryview_model.dart';
import 'package:stackex/helpers/api_service.dart';
import 'package:stackex/models/CategoryModel.dart';

class CategoryView extends StatelessWidget {
  CategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategoryViewModel>.reactive(
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text("Categories"),
          ),
          body: FutureBuilder(
            future: model.getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context,index){
                    return Card(
                      elevation: 2,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(snapshot.data![index].image??""),
                          radius: 40,
                        ),
                        title: Text(snapshot.data![index].name??""),
                        subtitle: Text("No.of Products:${snapshot.data![index].count.toString()}"),
                        trailing: IconButton(onPressed: (){

                        },icon: Icon(Icons.arrow_right),),
                      ),
                    );
                  }
                );
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        );
      },
      viewModelBuilder: () => CategoryViewModel(),
    );
  }
}

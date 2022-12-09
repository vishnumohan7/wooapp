import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackex/fragments/homeview_model.dart';
import 'package:stackex/helpers/api_service.dart';
import 'package:stackex/widgets/custom_shape.dart';
import 'package:stackex/widgets/slider_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiService apiService = ApiService();

    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: Container(
              height: 40,
              child: TextFormField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide.none),
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.red,
                    ),
                    prefixIconColor: Colors.red,
                    labelText: "Search here.."),
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: false,
          actions: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.chat),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.description),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications),
                  color: Colors.white,
                ),
              ],
            )
          ],
          backgroundColor: Colors.red,
        ),
        body: Stack(
          children: [
            Positioned(
              child: Container(
                  child: ClipPath(
                clipper: CustomShape(),
                child: Container(
                  height: 230,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.red,
                  child: Container(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 12.0, bottom: 8, left: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/logo.png")),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "OnlineSHOP",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    "Pls login Here",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
            ),
            Positioned(
                width: MediaQuery.of(context).size.width,
                top: 90,
                // bottom: 50,
                // bottom: 120,
                child: SliderWidget()),
            FutureBuilder(
              future: model.getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 5.0, right: 5, top: 30),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                snapshot.data![index].image.toString()),
                            radius: 35,
                          ),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
          // child: Container(
          //     child: ClipPath(
          //   clipper: CustomShape(),
          //   child: Container(
          //     height: 230,
          //     width: MediaQuery.of(context).size.width,
          //     color: Colors.red,
          //     child: Container(
          //       child: Padding(
          //         padding: const EdgeInsets.only(top: 12.0, bottom: 8, left: 20),
          //         child: Column(
          //           children: [
          //             Row(
          //               children: [
          //                 Container(
          //                   width: 70,
          //                   height: 70,
          //                   decoration: BoxDecoration(
          //                       image: DecorationImage(
          //                           image: AssetImage("assets/images/logo.png")),
          //                       borderRadius: BorderRadius.circular(5)),
          //                 ),
          //                 SizedBox(
          //                   width: 10,
          //                 ),
          //                 Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Text(
          //                       "OnlineSHOP",
          //                       style: TextStyle(
          //                           color: Colors.white,
          //                           fontWeight: FontWeight.bold,
          //                           fontSize: 20),
          //                     ),
          //                     Text(
          //                       "Pls login Here",
          //                       style: TextStyle(color: Colors.white),
          //                     )
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // )),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}

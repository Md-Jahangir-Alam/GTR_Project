import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../utilis/colors.dart';
import '../widgets/text_widget.dart';


class GetAllProduct extends StatefulWidget {
  String text;
  GetAllProduct({super.key, required this.text});

  @override
  State<GetAllProduct> createState() => _GetAllProductState();
}

class _GetAllProductState extends State<GetAllProduct> {

  List _alldata = [];

  List get alldata => _alldata;

  set alldata(List value) {
    _alldata = value;
  }

  Future<void> getApi() async {
    try {
      final apiKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiI0MTMiLCJDdXJyZW50Q29tSWQiOiIxIiwibmJmIjoxNjk1NDQyMjgxLCJleHAiOjE2OTYwNDcwODEsImlhdCI6MTY5NTQ0MjI4MX0.bYhMEKguSHsthNc_4gORhBmN6lzSvj4rqyM6x011usU'; // Replace with your actual API key
      final response = await http.get(
        Uri.parse("https://www.pqstec.com/InvoiceApps/Values/GetProductList?pageNo=1&pageSize=100&search=boys"),
        headers: {
          'Authorization': 'Bearer $apiKey',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        alldata = data['ProductList'];
      } else {
        // Handle the case where the request was not successful (e.g., status code is not 200)
        // You can throw an exception or handle it as needed.
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request.
    }
  }

  bool favorite = true;

  favorite_check(){
    setState(() {
      favorite != favorite;
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    getApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorsCode.spscreen_appbar_text_indecator_arow_favorit_nav,
        title: Text(widget.text),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Row(
              children: [
                Icon(
                  Icons.local_grocery_store_outlined,
                  size: 25,
                ),
              ],
            ),
          )
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Catagory_Text(alldata.length.toString()+" Products Founds"),
                        IconButton(onPressed: (){}, icon: Icon(Icons.menu, color: ColorsCode.skip_welcomepagetext_prodetails,))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FutureBuilder(
                    future: getApi(),
                    builder: (context, snapshot){
                      if(!snapshot.hasData){
                        return GridView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: alldata.length + 1, // Add 1 for the loading indicator
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            mainAxisExtent: 300,
                          ),
                          itemBuilder: (context, index) {
                            return Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Card(
                                  child: Column(
                                    children: [
                                      Image.network(alldata[index]["ImagePath"]??"https://media.istockphoto.com/id/1205195470/vector/cloud-storage-icon-vector-isolated-contour-symbol-illustration.jpg?s=1024x1024&w=is&k=20&c=Cm4MlxUBO42E9PFyFXTroMJO5tttCVGuDw96nNBAlEo=", scale: 4,),
                                      Product_Name(alldata[index]["Name"].toString()),
                                      Product_Price("Price: "+alldata[index]["Price"].toString()),
                                      Divider(
                                        height: 3,
                                      ),
                                      TextButton(onPressed: (){}, child: Product_Price("Add To Card")),
                                    ],
                                  ),
                                ),
                                Positioned(
                                    left: 130,
                                    child: IconButton(onPressed: (){
                                      favorite_check();
                                    }, icon: Icon(Icons.favorite_border, size: 35, color: favorite == false ? ColorsCode.spscreen_appbar_text_indecator_arow_favorit_nav : ColorsCode.skip_welcomepagetext_prodetails))
                                )
                              ],
                            );
                          },
                        );
                      }else{
                        return Center(child: CircularProgressIndicator(),);
                      }
                    },
                  ),
                )

              ],
            ),
          )
      ),
    );
  }
}

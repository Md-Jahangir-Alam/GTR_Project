import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../data_model/data_model.dart'; // Import GetX if you're using GetX for state management



// class GetProductData{
//   RxList alldata = [].obs;
//   // Future<Object> getData() async {
//   //   const String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiI0MTMiLCJDdXJyZW50Q29tSWQiOiIxIiwibmJmIjoxNjk1NDQyMjgxLCJleHAiOjE2OTYwNDcwODEsImlhdCI6MTY5NTQ0MjI4MX0.bYhMEKguSHsthNc_4gORhBmN6lzSvj4rqyM6x011usU'; // Replace with your API token
//   //
//   //   try {
//   //     final response = await http.get(
//   //       Uri.parse("https://www.pqstec.com/InvoiceApps/Values/GetProductList?pageNo=1&pageSize=100&search=boys"),
//   //       headers: {
//   //         'Authorization': 'Bearer $token', // Add your bearer token here
//   //       },
//   //     );
//   //
//   //     if (response.statusCode == 200) {
//   //       var data = jsonDecode(response.body);
//   //       print(data);
//   //       alldata.add(data["ProductList"]);
//   //       return productDetailsFromJson(data);
//   //     } else {
//   //       // Handle error responses here
//   //       print('Request failed with status: ${response.statusCode}');
//   //       return alldata; // You may want to handle this differently based on your app's requirements
//   //     }
//   //   } catch (error) {
//   //     // Handle network and other errors here
//   //     print('Error: $error');
//   //     return alldata; // You may want to handle this differently based on your app's requirements
//   //   }
//   // }
//
//   Future<void> getData() async {
//     try {
//       final apiKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiI0MTMiLCJDdXJyZW50Q29tSWQiOiIxIiwibmJmIjoxNjk1NDQyMjgxLCJleHAiOjE2OTYwNDcwODEsImlhdCI6MTY5NTQ0MjI4MX0.bYhMEKguSHsthNc_4gORhBmN6lzSvj4rqyM6x011usU'; // Replace with your actual API key
//       final response = await http.get(
//         Uri.parse("https://www.pqstec.com/InvoiceApps/Values/GetProductList?pageNo=1&pageSize=100&search=boys"),
//         headers: {
//           'Authorization': 'Bearer $apiKey',
//         },
//       );
//
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         print(alldata);
//         alldata = data['ProductList'];
//         print(alldata);
//       } else {
//         // Handle the case where the request was not successful (e.g., status code is not 200)
//         // You can throw an exception or handle it as needed.
//       }
//     } catch (e) {
//       // Handle any exceptions that may occur during the request.
//     }
//   }
//
// }

class ProductController extends GetxController {
  RxList productDetails = [].obs;

  Future fetchProductDetails() async {
    final apiKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySWQiOiI0MTMiLCJDdXJyZW50Q29tSWQiOiIxIiwibmJmIjoxNjk1NDQyMjgxLCJleHAiOjE2OTYwNDcwODEsImlhdCI6MTY5NTQ0MjI4MX0.bYhMEKguSHsthNc_4gORhBmN6lzSvj4rqyM6x011usU'; // Replace with your actual API key

    try {
      final response = await http.get(
        Uri.parse("https://www.pqstec.com/InvoiceApps/Values/GetProductList?pageNo=1&pageSize=100&search=boys"), // Replace with your API endpoint
        headers: {
          'Authorization': 'Bearer $apiKey',
        },
      );

      if (response.statusCode == 200) {
        final jsonBody = json.decode(response.body);
        print(jsonBody);
        productDetails = ProductDetails.fromJson(jsonBody) as RxList;
      } else {
        // Handle the case where the request was not successful.
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request.
    }
  }
}





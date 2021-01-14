// import 'profile.dart';
// import 'package:http/http.dart' as http;
//
// Future<List<Welcome>> fetchInformation() async {
//   String url = "https://reqres.in/api/users/2" ;
//   final response = await http.get(url);
//   return welcomeFromJson(response.body);
// }


import 'profile.dart';
import 'package:http/http.dart' as http;

Future<Welcome> fetchWelcome() async {
  String url = "https://reqres.in/api/users/2" ;
  final response = await http.get(url);
  return welcomeFromJson(response.body);
}
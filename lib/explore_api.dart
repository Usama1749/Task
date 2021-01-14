import 'explore.dart';
import 'package:http/http.dart' as http;

Future<List<Welcome>> fetchWelcome() async {
  String url = "https://jsonplaceholder.typicode.com/posts" ;
  final response = await http.get(url);
  return welcomeFromJson(response.body);
}
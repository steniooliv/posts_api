import 'package:posts_api/shared/model/post_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePageController {
  List<Post> posts = [];

  Future getPosts() async {
    final baseURL = "http://jsonplaceholder.typicode.com";
    var url = Uri.parse(
      '$baseURL/posts',
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      posts = json.map((e) => Post.fromJson(e)).toList();
    }
  }
}

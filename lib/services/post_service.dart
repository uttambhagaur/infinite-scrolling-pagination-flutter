import 'dart:convert';

import 'package:http/http.dart';
import 'package:infinite_scrolling_pagination_flutter/model/post.dart';
import 'package:infinite_scrolling_pagination_flutter/utils/consts.dart';

class PostService{
  static Future fetchPostData(int pageNumber, int numberOfPostsPerRequest) async {
    try{
      String query = "?_page=$pageNumber&_limit=$numberOfPostsPerRequest";
      final response = await get(Uri.parse(Constants.api_url+query));
       final responseList = json.decode(response.body);
      return responseList.map<Post>(Post.fromJson).toList();
    } catch(e){
      return Null;
    }
    
  }
}
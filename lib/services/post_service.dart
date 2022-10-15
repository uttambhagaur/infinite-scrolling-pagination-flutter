import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:infinite_scrolling_pagination_flutter/model/post.dart';
import 'package:infinite_scrolling_pagination_flutter/utils/consts.dart';

class PostService{
  static Future<List<Post>> fetchPostData(int pageNumber, int numberOfPostsPerRequest, BuildContext context) async {
    late List<Post> result ;
    try{
      String query = "?_page=$pageNumber&_limit=$numberOfPostsPerRequest";
      final response = await get(Uri.parse(Constants.api_url+query));
       final responseList = json.decode(response.body);
          result = responseList.map<Post>(Post.fromJson).toList();
    } catch(e){
      ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text('Please try after sometimes')));
    }
    return result;
  }
}
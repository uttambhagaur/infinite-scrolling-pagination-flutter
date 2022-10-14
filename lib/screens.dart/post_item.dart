import 'package:flutter/material.dart';
import 'package:infinite_scrolling_pagination_flutter/model/post.dart';

class PostItem extends StatelessWidget {
  final Post post;
   const PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(post.title),
        subtitle: Text(post.body),
        isThreeLine: true,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:infinite_scrolling_pagination_flutter/model/post.dart';

class PostItem extends StatelessWidget {
  final Post post;
  const PostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          post.title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          post.body,
        ),
        isThreeLine: true,
      ),
    );
  }
}

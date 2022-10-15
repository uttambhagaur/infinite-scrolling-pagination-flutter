import 'package:flutter/material.dart';
import 'package:infinite_scrolling_pagination_flutter/model/post.dart';
import 'package:infinite_scrolling_pagination_flutter/screens.dart/post_item.dart';
import 'package:infinite_scrolling_pagination_flutter/services/post_service.dart';
import 'package:infinite_scrolling_pagination_flutter/states/post_state.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
     Provider.of<PostState>(context,listen: false).getPostsData(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infinite Posts'),
        centerTitle: true,
      ),
      body: buildPostsView(),
    );
  }

  Widget buildPostsView() {
    return Consumer<PostState>(
      builder: (context, provider, child) {
        if (provider.posts.isEmpty) {
          if (provider.loading) {
            return const Center(
              child: Padding(
                  padding: EdgeInsets.all(8),
                  child: CircularProgressIndicator()),
            );
          } else if (provider.error) {
            return const Center(
              child: Text(
                'Error Occured',
                style: TextStyle(color: Colors.red),
              ),
            );
          }
        }
        return ListView.builder(
          itemCount: provider.posts.length + (provider.isLastPage ? 0 : 1),
          itemBuilder: (context, index) {
            if(index == provider.posts.length - provider.nextPageTrigger){
              Future<List<Post>> data =  PostService.fetchPostData(provider.pageNumber, provider.numberOfPostsPerRequest, context);
              data.then((value) => provider.setPosts(value));
              provider.setLoading(false);
              provider.setPageNumber(provider.pageNumber+1);
              provider.setIsLastPage(provider.posts.length < provider.numberOfPostsPerRequest);
            }
            if(index == provider.posts.length){
              if(provider.error){
                return const Center(child: Text('Error Occured', style: TextStyle(color: Colors.red),),);
              } else {
                return const Center(child: Padding(padding: EdgeInsets.all(8),child: CircularProgressIndicator()),);
              }
            }
            final Post post = provider.posts[index];
            return PostItem(post: post);
        },);
      },
    );
  }
}

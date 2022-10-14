import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:infinite_scrolling_pagination_flutter/model/post.dart';
import 'package:infinite_scrolling_pagination_flutter/services/post_service.dart';

class PostsOverviewPage extends StatefulWidget {
  const PostsOverviewPage({super.key});

  @override
  State<PostsOverviewPage> createState() => _PostsOverviewPageState();
}

class _PostsOverviewPageState extends State<PostsOverviewPage> {

// to check whether there is more data to fetch
late bool _isLastPage;

// determines the segment of the paginated data to fetch
late int _pageNumber;

// indicates whether or not an error has occured at the point of fetching the data
late bool _error;

// to indicate application is fetching data or not
late bool _loading;

// Determines the number of elements to fetch per request
final int _numberOfPostsPerRequest = 10;

// holds all the fetched posts
late List<Post> _posts;

// detatermines when to fetch next data, in below case when 3 posts left than fetch new data
final int _nextPageTrigger = 3;

@override
  void initState(){
    super.initState();
    _pageNumber = 0;
    _posts = [];
    _isLastPage = false;
    _loading = true;
    _error = false;
    PostService.fetchPostData(_pageNumber,_numberOfPostsPerRequest);
}

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
import 'package:flutter/cupertino.dart';
import 'package:infinite_scrolling_pagination_flutter/model/post.dart';
import 'package:infinite_scrolling_pagination_flutter/services/post_service.dart';

class PostState extends ChangeNotifier {
  getPostsData(BuildContext context) async {
    _pageNumber = 0;
    _posts = [];
    _isLastPage = false;
    _loading = true;
    _error = false;
    List<Post> data = await
      PostService.fetchPostData(pageNumber, numberOfPostsPerRequest, context);
    // data.then((value) => setPosts(value));
    posts.addAll(data);
    setLoading(false);
    setPageNumber(pageNumber + 1);
    setIsLastPage(posts.length < numberOfPostsPerRequest);
    notifyListeners();
  }

  // to check whether there is more data to fetch
  late bool _isLastPage;

// determines the segment of the paginated data to fetch
  late int _pageNumber;

// indicates whether or not an error has occured at the point of fetching the data
  late bool _error;

// to indicate application is fetching data or not
  late bool _loading;

// Determines the number of elements to fetch per request
  int _numberOfPostsPerRequest = 10;

// holds all the fetched posts
  late List<Post> _posts;

// detatermines when to fetch next data, in below case when 3 posts left than fetch new data
  late int _nextPageTrigger = 3;

  bool get lastPage => _isLastPage;

  void updateLastPage(bool isLastPage) {
    _isLastPage = isLastPage;
    notifyListeners();
  }

  bool get isLastPage => _isLastPage;

  void setIsLastPage(bool isLastPage) {
    _isLastPage = isLastPage;
    notifyListeners();
  }

  int get pageNumber => _pageNumber;

  void setPageNumber(int pageNumber) {
    _pageNumber = pageNumber;
    notifyListeners();
  }

  bool get error => _error;

  void setError(bool error) {
    _error = error;
    notifyListeners();
  }

  bool get loading => _loading;

  void setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  int get numberOfPostsPerRequest => _numberOfPostsPerRequest;

  void setNumberOfPostsPerRequest(int numberOfPostsPerRequest) {
    _numberOfPostsPerRequest = numberOfPostsPerRequest;
    notifyListeners();
  }

  List<Post> get posts => _posts;

  void setPosts(List<Post> posts) {
    _posts.addAll(posts);
    notifyListeners();
  }

  int get nextPageTrigger => _nextPageTrigger;

  void setNextPageTrigger(int nextPageTrigger) {
    _nextPageTrigger = nextPageTrigger;
    notifyListeners();
  }
}

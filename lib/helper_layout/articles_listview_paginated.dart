import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:united_mania/helper_layout/article_list_item.dart';
import 'package:united_mania/models/ApiResponse.dart';

class ArticlesPagination extends StatefulWidget {
  @override
  _ArticlesListViewState createState() => _ArticlesListViewState();
}

class _ArticlesListViewState extends State<ArticlesPagination> {
  static const pageSize = 5;

  final PagingController<int, Article> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int page) async {
    try {
      List<Article> articles = await fetchArticles(pageSize, page);
      page = page + 1;
      _pagingController.appendPage(articles, page);
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) => PagedListView<int, Article>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Article>(
          itemBuilder: (context, item, index) => ArticleListItem(article: item),
        ),
      );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<dynamic> fetchArticles(int pageSize, int page) async {
    Response response = await get(Uri.parse(
        ApiResponseBody.API_URL + "&pageSize=$pageSize" + "&page=$page"));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonParsed = json.decode(response.body);
      ApiResponseBody responseBody = ApiResponseBody.fromJson(jsonParsed);
      return responseBody.articles;
    } else
      throw Exception('Failed to load data!');
  }
}

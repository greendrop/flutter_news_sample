import 'package:dio/dio.dart';
import 'package:flutter_news_sample/feature/news_api/dto/news_top_headlines_response.dart';
import 'package:retrofit/retrofit.dart';

part 'news_top_headlines_client.g.dart';

@RestApi(baseUrl: 'https://newsapi.org/v2/top-headlines')
abstract class NewsTopHeadlinesClient {
  factory NewsTopHeadlinesClient(Dio dio, {String baseUrl}) =
      _NewsTopHeadlinesClient;

  @GET('')
  Future<NewsTopHeadlinesResponse> get({
    @Query('apiKey') required String apiKey,
    @Query('country') required String country,
    @Query('category') required String category,
    @Query('pageSize') int? pageSize,
    @Query('page') int? page,
  });
}

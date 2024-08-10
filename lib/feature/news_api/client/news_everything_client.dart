import 'package:dio/dio.dart';
import 'package:flutter_news_sample/feature/news_api/dto/news_top_headlines_response.dart';
import 'package:retrofit/retrofit.dart';

part 'news_everything_client.g.dart';

@RestApi(baseUrl: 'https://newsapi.org/v2/everything')
abstract class NewsEverythingClient {
  factory NewsEverythingClient(Dio dio, {String baseUrl}) =
      _NewsEverythingClient;

  @GET('')
  Future<NewsTopHeadlinesResponse> get({
    @Query('apiKey') String apiKey,
    @Query('q') String query,
    @Query('pageSize') int pageSize,
    @Query('page') int page,
  });
}

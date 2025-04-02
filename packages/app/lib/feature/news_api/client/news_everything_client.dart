import 'package:app/feature/news_api/dto/news_everything_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'news_everything_client.g.dart';

const _baseUrl = 'https://newsapi.org';
const newsEverythingClientPath = '/v2/everything';

@RestApi(baseUrl: _baseUrl + newsEverythingClientPath)
// dioを使用するため
// ignore: one_member_abstracts
abstract class NewsEverythingClient {
  factory NewsEverythingClient(Dio dio, {String baseUrl}) =
      _NewsEverythingClient;

  @GET('')
  Future<NewsEverythingResponse> get({
    @Query('apiKey') required String apiKey,
    @Query('q') required String query,
    @Query('pageSize') int? pageSize,
    @Query('page') int? page,
  });
}

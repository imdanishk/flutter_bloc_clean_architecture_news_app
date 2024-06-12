import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:flutter_bloc_clean_architecture_news_app/features/daily_news/data/models/article.dart';

import '../../../../../core/constants/constants.dart';

part 'news_api_service.g.dart';


// Retrofit API service interface for fetching news articles.
@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;  // Factory constructor to create an instance with Dio.

  // Method to fetch news articles with optional query parameters.
  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}

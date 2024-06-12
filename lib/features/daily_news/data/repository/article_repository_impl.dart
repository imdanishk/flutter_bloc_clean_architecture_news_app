import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc_clean_architecture_news_app/features/daily_news/domain/entities/article_entity.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/repository/article_repository.dart';
import '../data_sources/remote/news_api_service.dart';
import '../models/article.dart';

// Implementation of the ArticleRepository interface.
class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService; // Dependency on NewsApiService.

  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(
            httpResponse.data); // Return success if HTTP status is OK.
      } else {
        return DataFailed(
          DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioErrorType.response,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioError catch (e) {
      return DataFailed(e); // Return failure if there is a DioError.
    }
  }

  @override
  Future<List<ArticleEntity>> getSavedArticles() {
    // Method to be implemented for fetching saved articles from the database.
    throw UnimplementedError();
  }

  @override
  Future<void> removeArticle(ArticleEntity article) {
    // Method to be implemented for removing an article from the database.
    throw UnimplementedError();
  }

  @override
  Future<void> saveArticle(ArticleEntity article) {
    // Method to be implemented for saving an article to the database.
    throw UnimplementedError();
  }
}

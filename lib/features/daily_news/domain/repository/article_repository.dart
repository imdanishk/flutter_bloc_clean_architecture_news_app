import 'package:flutter_bloc_clean_architecture_news_app/core/resources/data_state.dart';
import 'package:flutter_bloc_clean_architecture_news_app/features/daily_news/domain/entities/article_entity.dart';

// Abstract repository interface for articles.
abstract class ArticleRepository {
  // Method to fetch news articles from the API.
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

  // Method to fetch saved articles from the database.
  Future<List<ArticleEntity>> getSavedArticles();

  // Method to save an article to the database.
  Future<void> saveArticle(ArticleEntity article);

  // Method to remove an article from the database.
  Future<void> removeArticle(ArticleEntity article);
}

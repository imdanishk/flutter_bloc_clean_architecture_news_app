import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

import '../../../../domain/entities/article_entity.dart';

// Abstract state class for remote articles, implementing Equatable for value comparison.
abstract class RemoteArticlesState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioError? error;

  const RemoteArticlesState({this.articles, this.error});

  @override
  List<Object> get props => [articles!, error!];
}

// State representing loading of articles.
class RemoteArticlesLoading extends RemoteArticlesState {
  const RemoteArticlesLoading();
}

// State representing successful loading of articles.
class RemoteArticlesDone extends RemoteArticlesState {
  const RemoteArticlesDone(List<ArticleEntity> article)
      : super(articles: article);
}

// State representing an error in loading articles.
class RemoteArticlesError extends RemoteArticlesState {
  const RemoteArticlesError(DioError error) : super(error: error);
}

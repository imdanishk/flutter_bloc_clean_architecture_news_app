import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../features/daily_news/data/data_sources/local/app_database.dart';
import '../features/daily_news/data/data_sources/remote/news_api_service.dart';
import '../features/daily_news/data/repository/article_repository_impl.dart';
import '../features/daily_news/domain/repository/article_repository.dart';
import '../features/daily_news/domain/usecases/get_article.dart';
import '../features/daily_news/domain/usecases/get_saved_article.dart';
import '../features/daily_news/domain/usecases/remove_article.dart';
import '../features/daily_news/domain/usecases/save_article.dart';
import '../features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

// Dependency injection container using GetIt.
final sl = GetIt.instance; // sl - service locator

Future<void> initializeDependencies() async {
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  // Registering a singleton instance of Dio for HTTP requests.
  sl.registerSingleton<Dio>(Dio());

  // Registering a singleton instance of NewsApiService, which depends on Dio.
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  // Registering a singleton instance of ArticleRepository implementation.
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl(), sl()));

  // Registering a singleton instance of GetArticleUseCase, which depends on ArticleRepository.
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  sl.registerSingleton<GetSavedArticleUseCase>(
    GetSavedArticleUseCase(sl())
  );

  sl.registerSingleton<SaveArticleUseCase>(
    SaveArticleUseCase(sl())
  );
  
  sl.registerSingleton<RemoveArticleUseCase>(
    RemoveArticleUseCase(sl())
  );


  // Registering a factory for RemoteArticlesBloc, which depends on GetArticleUseCase.
  sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));
}

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../../domain/usecases/get_article.dart';
import 'remote_article_event.dart';
import 'remote_article_state.dart';

// Bloc for handling remote articles events and states.
class RemoteArticlesBloc
    extends Bloc<RemoteArticlesEvent, RemoteArticlesState> {
  final GetArticleUseCase _getArticleUseCase;  // Dependency on GetArticleUseCase.

  RemoteArticlesBloc(this._getArticleUseCase)
      : super(const RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);  // Registers the event handler for GetArticles.
  }

  // Event handler for GetArticles event.
  void onGetArticles(
      GetArticles event, Emitter<RemoteArticlesState> emit) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesDone(dataState.data!));  // Emit success state if data is fetched successfully.
    }

    if (dataState is DataFailed) {
      emit(RemoteArticlesError(dataState.error!));  // Emit error state if there is a failure.
    }
  }
}


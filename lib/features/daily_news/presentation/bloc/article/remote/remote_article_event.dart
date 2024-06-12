// Abstract event class for remote articles.
abstract class RemoteArticlesEvent {
  const RemoteArticlesEvent();
}

// Event to get articles.
class GetArticles extends RemoteArticlesEvent {
  const GetArticles();
}


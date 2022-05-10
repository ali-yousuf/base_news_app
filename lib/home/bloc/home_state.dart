part of 'home_bloc.dart';

enum HomeStatus { initial, success, failure }

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.articles = const <Article>[],
    this.hasReachedMax = false,
  });

  final HomeStatus status;
  final List<Article> articles;
  final bool hasReachedMax;

  HomeState copyWith({
    HomeStatus? status,
    List<Article>? articles,
    bool? hasReachedMax,
  }) {
    return HomeState(
      status: status ?? this.status,
      articles: articles ?? this.articles,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''HomeState { status: $status, hasReachedMax: $hasReachedMax, articles: ${articles.length} }''';
  }

  @override
  List<Object> get props => [status, articles, hasReachedMax];
}

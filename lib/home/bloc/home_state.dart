part of 'home_bloc.dart';

enum HomeStatus { initial, success, failure }

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.articles = const <Article>[],
    this.hasReachedMax = false,
    this.page = 1,
    this.isRefresh = false,
  });

  final HomeStatus status;
  final List<Article> articles;
  final bool hasReachedMax;
  final int page;
  final bool isRefresh;

  HomeState copyWith({
    HomeStatus? status,
    List<Article>? articles,
    bool? hasReachedMax,
    int? page,
    bool? isRefresh,
  }) {
    return HomeState(
        status: status ?? this.status,
        articles: articles ?? this.articles,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        page: page ?? this.page,
        isRefresh: isRefresh ?? this.isRefresh);
  }

  @override
  String toString() {
    return '''HomeState { status: $status, hasReachedMax: $hasReachedMax, articles: ${articles.length}, isRefresh: $isRefresh page: $page }''';
  }

  @override
  List<Object> get props => [status, articles, hasReachedMax, page];
}

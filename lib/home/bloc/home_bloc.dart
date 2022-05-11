import 'dart:async';
import 'dart:developer';

import 'package:base_news_app/core/network/http_client.dart';
import 'package:base_news_app/home/models/news_response.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../../core/helpers.dart';

part 'home_event.dart';

part 'home_state.dart';

const _pageSize = 20;
const apiKey = '4c61ba3397134cccacc3cc3e0cf7edb6';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.httpClient}) : super(const HomeState()) {
    on<NewsListFetched>((event, emit) async {
      await _onNewsFetched(emit);
    });
    on<NewsListReFetched>((event, emit) async {
      await _onNewsFetched(emit);
    });
  }

  final BaseHttpClient httpClient;

  Future<void> _onNewsFetched(
    Emitter<HomeState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == HomeStatus.initial) {
        final articles = await _fetchNews();
        return emit(
          state.copyWith(
              status: HomeStatus.success,
              articles: articles,
              hasReachedMax: false,
              page: state.page + 1),
        );
      }
      final articles = await _fetchNews(state.page);
      articles!.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(state.copyWith(
              status: HomeStatus.success,
              articles: List.of(state.articles)..addAll(articles),
              hasReachedMax: false,
              page: state.page + 1));
    } catch (_) {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  Future<List<Article>?> _fetchNews([int startIndex = 1]) async {
    final data = await httpCallWrapper(() async {
      log('top-headlines?country=us&apiKey=$apiKey&pageSize=$_pageSize&page=$startIndex');
      final response = await httpClient.authenticatedClient.get(
        'top-headlines?country=us&apiKey=$apiKey&pageSize=$_pageSize&page=$startIndex',
      );

      try {
        final data = NewsResponse.fromMap(response.data);
        return data;
      } catch (_, st) {
        log(st.toString());
      }
    });
    return data?.articles!;
  }
}

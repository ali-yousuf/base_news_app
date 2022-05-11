import 'package:base_news_app/core/di/dependency_injection.dart';
import 'package:base_news_app/core/network/http_client.dart';
import 'package:base_news_app/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(httpClient: sl.get<BaseHttpClient>())
        ..add(NewsListFetched()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          switch (state.status) {
            case HomeStatus.initial:
              return const Center(child: CircularProgressIndicator());
            case HomeStatus.success:
              return Center(
                  child: Text('news length: ${state.articles.length}'));
            case HomeStatus.failure:
              return const Center(
                  child: Text('Something went wrong!'));
          }
        },
      ),
    );
  }
}

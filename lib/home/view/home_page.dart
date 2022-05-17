import 'dart:developer';

import 'package:base_news_app/core/di/dependency_injection.dart';
import 'package:base_news_app/core/network/http_client.dart';
import 'package:base_news_app/home/bloc/home_bloc.dart';
import 'package:base_news_app/home/models/news_response.dart';
import 'package:base_news_app/news_details/view/news_details_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{
  late final RefreshController _refreshController;

  @override
  void initState() {
    _refreshController = RefreshController(initialRefresh: false);
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  void _onLoading(BuildContext ctx) {
    ctx.read<HomeBloc>().add(NewsListFetched());
  }

  void _onRefresh(BuildContext ctx) {
    print('_HomePageState._onRefresh');
    ctx.read<HomeBloc>().add(NewsListReFetched());
  }

  void _onListener(BuildContext ctx, HomeState state) {
    if (state.status == HomeStatus.success) {
      _refreshController
        ..loadComplete()
        ..refreshCompleted();
    } else if (state.status == HomeStatus.failure) {
      _refreshController
        ..loadComplete()
        ..refreshCompleted();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(httpClient: sl.get<BaseHttpClient>())
        ..add(NewsListFetched()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: _onListener,
        builder: (context, state) {
          switch (state.status) {
            case HomeStatus.initial:
              return const Center(child: CircularProgressIndicator());
            case HomeStatus.success:
              return SmartRefresher(
                controller: _refreshController,
                enablePullUp: !state.hasReachedMax,
                onLoading: () => _onLoading(context),
                onRefresh: () => _onRefresh(context),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.articles.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return NewsItem(article: state.articles[index]);
                      }),
                ),
              );
            case HomeStatus.failure:
              return const Center(child: Text('Something went wrong!'));
          }
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class NewsItem extends StatelessWidget {
  const NewsItem({Key? key, required this.article}) : super(key: key);
  final Article article;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => NewsDetailsPage(
                  article: article,
                )));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10)),
          height: 130,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage!,
                  width: 140,
                  height: 130,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    height: 140,
                    color: Colors.grey,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title!,
                      style: textTheme.headline6,
                      maxLines: 4,
                    ),
                    Text(
                      article.author!,
                      style: textTheme.subtitle1,
                      maxLines: 1,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

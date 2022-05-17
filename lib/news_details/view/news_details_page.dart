import 'package:base_news_app/favourite/cubit/favourite_cubit.dart';
import 'package:base_news_app/favourite/models/favourite.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/models/news_response.dart';

class NewsDetailsPage extends StatelessWidget {
  const NewsDetailsPage({Key? key, required this.article}) : super(key: key);
  final Article article;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final iconTheme = Theme.of(context).iconTheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: true,
            title: Text(article.title!),
            actions: [
              IconButton(onPressed: () {
                if (isFavouritesContainsThisArticle(
                    context.read<FavouriteCubit>().state.favourites!,
                    article)) {
                  context
                      .read<FavouriteCubit>()
                      .deleteArticleFromFavourite(article);
                } else {
                  context.read<FavouriteCubit>().insertIntoFavourite(article);
                }
              }, icon: BlocBuilder<FavouriteCubit, FavouriteState>(
                builder: (context, state) {
                  return isFavouritesContainsThisArticle(
                          state.favourites!, article)
                      ? Icon(
                          Icons.favorite,
                          color: iconTheme.color,
                        )
                      : Icon(
                          Icons.favorite_border,
                          color: iconTheme.color,
                        );
                },
              ))
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl: article.urlToImage!,
                    width: double.infinity,
                    height: 130,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      height: 140,
                      color: Colors.grey,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    article.source!.name,
                    style: textTheme.titleMedium,
                  ),
                  Text(
                    article.author!,
                    style: textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    article.description!,
                    style: textTheme.bodyMedium,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  bool isFavouritesContainsThisArticle(
      List<Favourite> favourites, Article article) {
    bool isArticleMatch = false;
    for (var element in favourites) {
      if (element.title == article.title) {
        isArticleMatch = true;
      }
    }
    return isArticleMatch;
  }
}

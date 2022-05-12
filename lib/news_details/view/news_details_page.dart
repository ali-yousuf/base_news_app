import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../home/models/news_response.dart';

class NewsDetailsPage extends StatelessWidget {
  const NewsDetailsPage({Key? key, required this.article}) : super(key: key);
  final Article article;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: true,
            title: Text(article.title!),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.favorite_border))
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
}

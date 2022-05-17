import 'package:base_news_app/favourite/cubit/favourite_cubit.dart';
import 'package:base_news_app/favourite/models/favourite.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  void initState() {
    context.read<FavouriteCubit>().getFavourites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteCubit, FavouriteState>(
      builder: (context, state) {
        switch (state.favouriteStatus) {
          case FavouriteStatus.initial:
            return const Center(child: CircularProgressIndicator());
          case FavouriteStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case FavouriteStatus.success:
            return state.favourites!.isNotEmpty
                ? ListView.builder(
                    itemCount: state.favourites!.length,
                    itemBuilder: (context, index) {
                      return NewsItem(favourite: state.favourites![index]);
                    })
                : const Center(child: Text('No item added!'));
          default:
            return const Center(child: Text('Something went wrong!'));
        }
      },
    );
  }

}

class NewsItem extends StatelessWidget {
  const NewsItem({Key? key, required this.favourite}) : super(key: key);
  final Favourite favourite;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
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
                imageUrl: favourite.urlToImage!,
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
                    favourite.title!,
                    style: textTheme.headline6,
                    maxLines: 4,
                  ),
                  Text(
                    favourite.author!,
                    style: textTheme.subtitle1,
                    maxLines: 1,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

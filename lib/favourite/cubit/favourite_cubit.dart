import 'package:base_news_app/core/db/news_database.dart';
import 'package:base_news_app/favourite/models/favourite.dart';
import 'package:base_news_app/home/models/news_response.dart';
import 'package:bloc/bloc.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteState());

  Future<void> insertIntoFavourite(Article article) async {
    try {
      await NewsDatabase.instance.insertArticle(Favourite(
          author: article.author,
          title: article.title,
          description: article.description,
          url: article.url,
          urlToImage: article.urlToImage,
          publishedAt: article.publishedAt,
          content: article.content));
      final favourites = await NewsDatabase.instance.getArticles();
      emit(FavouriteState().copyWith(favourites: favourites));
    } catch (_) {
      rethrow;
    }
  }

  Future<void> getFavourites() async {
    emit(FavouriteState().copyWith(favouriteStatus: FavouriteStatus.loading));
    Future.delayed(const Duration(microseconds: 500), () async {
      final favourites = await NewsDatabase.instance.getArticles();
      emit(FavouriteState().copyWith(
          favourites: favourites, favouriteStatus: FavouriteStatus.success));
    });
  }

  Future<void> deleteArticleFromFavourite(Article article) async {
    await NewsDatabase.instance.deleteFavorite(article.title!);
    final favourites = await NewsDatabase.instance.getArticles();
    emit(FavouriteState().copyWith(favourites: favourites));
  }
}

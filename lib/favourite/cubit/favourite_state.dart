part of 'favourite_cubit.dart';

enum FavouriteStatus { initial, loading, success }

class FavouriteState {
  final List<Favourite>? favourites;
  final FavouriteStatus? favouriteStatus;

  FavouriteState({this.favourites, this.favouriteStatus});

  FavouriteState copyWith(
      {List<Favourite>? favourites, FavouriteStatus? favouriteStatus}) {
    return FavouriteState(
        favourites: favourites ?? this.favourites,
        favouriteStatus: favouriteStatus ?? this.favouriteStatus);
  }
}

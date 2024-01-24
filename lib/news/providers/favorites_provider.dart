import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_provider.g.dart';

@riverpod
class FavoritesNotifier extends _$FavoritesNotifier {
  @override
  List<int> build() {
    return [];
  }

  void setFavorite(int id) {
    final favorites = state;
    if (favorites.contains(id)) {
      favorites.remove(id);
    } else {
      favorites.add(id);
    }
    state = favorites;
    ref.notifyListeners();
  }
}

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'favorites_provider.g.dart';

@riverpod
class FavoritesNotifier extends _$FavoritesNotifier {
  @override
  List<int> build() {
    getIds();
    return [];
  }

  Future<void> getIds() async {
    var prefs = await SharedPreferences.getInstance();
    final List<String>? favoriteIdsString = prefs.getStringList('favoriteIds');
    if (favoriteIdsString != null) {
      final List<int> favoriteIds =
          favoriteIdsString.map((id) => int.parse(id)).toList();
      state = favoriteIds;
    } else {
      state = [];
    }
  }

  void setFavorite(int id) {
    final favorites = state;
    if (favorites.contains(id)) {
      favorites.remove(id);
    } else {
      favorites.add(id);
    }
    state = favorites;
    setIds(favorites);
    ref.notifyListeners();
  }

  Future<void> setIds(List<int> ids) async {
    var prefs = await SharedPreferences.getInstance();
    final List<String> favoriteIdsString =
        ids.map((id) => id.toString()).toList();
    prefs.setStringList('favoriteIds', favoriteIdsString);
  }
}

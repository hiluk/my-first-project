import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'favorites_provider.g.dart';

@riverpod
class FavoritesNotifier extends _$FavoritesNotifier {
  @override
  Future<List<int>> build() async {
    return await getCacheIds();
  }

  Future<List<int>> getCacheIds() async {
    var prefs = await SharedPreferences.getInstance();
    final List<String>? favoriteIdsString = prefs.getStringList('favoriteIds');
    if (favoriteIdsString != null) {
      final List<int> favoriteIds =
          favoriteIdsString.map((id) => int.parse(id)).toList();
      return favoriteIds;
    } else {
      return [];
    }
  }

  Future<void> setCacheIds(List<int> ids) async {
    var prefs = await SharedPreferences.getInstance();
    final List<String> favoriteIdsString =
        ids.map((id) => id.toString()).toList();
    prefs.setStringList('favoriteIds', favoriteIdsString);
  }

  void setFavorite(int id) {
    if (state.value == null) return;
    final favorites = state.value!;
    if (favorites.contains(id)) {
      favorites.remove(id);
    } else {
      favorites.add(id);
    }
    state = AsyncData(favorites);
    setCacheIds(favorites);
    ref.notifyListeners();
  }
}

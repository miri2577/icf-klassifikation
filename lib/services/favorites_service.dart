import 'package:shared_preferences/shared_preferences.dart';

class FavoritesService {
  static const _key = 'icf_favorites';
  final SharedPreferences _prefs;

  FavoritesService(this._prefs);

  List<String> getFavorites() {
    return _prefs.getStringList(_key) ?? [];
  }

  Future<void> toggleFavorite(String code) async {
    final favorites = getFavorites();
    if (favorites.contains(code)) {
      favorites.remove(code);
    } else {
      favorites.add(code);
    }
    await _prefs.setStringList(_key, favorites);
  }

  bool isFavorite(String code) {
    return getFavorites().contains(code);
  }

  Future<void> removeFavorite(String code) async {
    final favorites = getFavorites();
    favorites.remove(code);
    await _prefs.setStringList(_key, favorites);
  }

  Future<void> clearAll() async {
    await _prefs.remove(_key);
  }
}

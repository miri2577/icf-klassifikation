import 'package:shared_preferences/shared_preferences.dart';

class SearchHistoryService {
  static const _key = 'icf_search_history';
  static const _maxItems = 10;
  final SharedPreferences _prefs;

  SearchHistoryService(this._prefs);

  List<String> getQueries() {
    return _prefs.getStringList(_key) ?? [];
  }

  Future<void> addQuery(String query) async {
    final trimmed = query.trim();
    if (trimmed.length < 2) return;
    final queries = getQueries();
    queries.removeWhere(
        (q) => q.toLowerCase() == trimmed.toLowerCase());
    queries.insert(0, trimmed);
    if (queries.length > _maxItems) {
      queries.removeRange(_maxItems, queries.length);
    }
    await _prefs.setStringList(_key, queries);
  }

  Future<void> clear() async {
    await _prefs.remove(_key);
  }
}

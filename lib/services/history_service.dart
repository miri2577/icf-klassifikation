import 'package:shared_preferences/shared_preferences.dart';

class HistoryService {
  static const _key = 'icf_history';
  static const _maxItems = 20;
  final SharedPreferences _prefs;

  HistoryService(this._prefs);

  List<String> getHistory() {
    return _prefs.getStringList(_key) ?? [];
  }

  Future<void> addToHistory(String code) async {
    final history = getHistory();
    history.remove(code); // Remove if already exists
    history.insert(0, code); // Add to front
    if (history.length > _maxItems) {
      history.removeRange(_maxItems, history.length);
    }
    await _prefs.setStringList(_key, history);
  }

  Future<void> clearHistory() async {
    await _prefs.remove(_key);
  }
}

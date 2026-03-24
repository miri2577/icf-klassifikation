import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/icf_data_service.dart';
import '../services/favorites_service.dart';
import '../services/history_service.dart';

// SharedPreferences provider
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('Must be overridden in main');
});

// Settings: Theme Mode
final themeModeProvider =
    StateNotifierProvider<ThemeModeNotifier, ThemeMode>((ref) {
  final prefs = ref.read(sharedPreferencesProvider);
  return ThemeModeNotifier(prefs);
});

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  final SharedPreferences _prefs;
  static const _key = 'theme_mode';

  ThemeModeNotifier(this._prefs)
      : super(_themeModeFromString(_prefs.getString(_key)));

  static ThemeMode _themeModeFromString(String? value) {
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    state = mode;
    await _prefs.setString(_key, mode.name);
  }
}

// Settings: Locale
final localeProvider =
    StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  final prefs = ref.read(sharedPreferencesProvider);
  return LocaleNotifier(prefs);
});

class LocaleNotifier extends StateNotifier<Locale> {
  final SharedPreferences _prefs;
  static const _key = 'locale';

  LocaleNotifier(this._prefs)
      : super(Locale(_prefs.getString(_key) ?? 'de'));

  Future<void> setLocale(Locale locale) async {
    state = locale;
    await _prefs.setString(_key, locale.languageCode);
  }
}

// ICF Data Service
final icfDataServiceProvider = Provider<IcfDataService>((ref) {
  return IcfDataService();
});

final icfDataLoadedProvider = FutureProvider<bool>((ref) async {
  final service = ref.read(icfDataServiceProvider);
  final locale = ref.watch(localeProvider);
  await service.loadData(locale: locale.languageCode);
  return true;
});

// Favorites
final favoritesServiceProvider = Provider<FavoritesService>((ref) {
  final prefs = ref.read(sharedPreferencesProvider);
  return FavoritesService(prefs);
});

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, List<String>>((ref) {
  final service = ref.read(favoritesServiceProvider);
  return FavoritesNotifier(service);
});

class FavoritesNotifier extends StateNotifier<List<String>> {
  final FavoritesService _service;

  FavoritesNotifier(this._service) : super(_service.getFavorites());

  Future<void> toggle(String code) async {
    await _service.toggleFavorite(code);
    state = _service.getFavorites();
  }

  bool isFavorite(String code) => state.contains(code);
}

// History
final historyServiceProvider = Provider<HistoryService>((ref) {
  final prefs = ref.read(sharedPreferencesProvider);
  return HistoryService(prefs);
});

final historyProvider =
    StateNotifierProvider<HistoryNotifier, List<String>>((ref) {
  final service = ref.read(historyServiceProvider);
  return HistoryNotifier(service);
});

class HistoryNotifier extends StateNotifier<List<String>> {
  final HistoryService _service;

  HistoryNotifier(this._service) : super(_service.getHistory());

  Future<void> add(String code) async {
    await _service.addToHistory(code);
    state = _service.getHistory();
  }

  Future<void> clear() async {
    await _service.clearHistory();
    state = [];
  }
}

// Search
final searchQueryProvider = StateProvider<String>((ref) => '');

final searchResultsProvider =
    Provider<List<MapEntry<String, String>>>((ref) {
  final query = ref.watch(searchQueryProvider);
  if (query.isEmpty) return [];
  final service = ref.read(icfDataServiceProvider);
  return service.search(query);
});

// Search domain filter
final searchDomainFilterProvider = StateProvider<String?>((ref) => null);

// Selected domain tab
final selectedDomainIndexProvider = StateProvider<int>((ref) => 0);

// Debounced search
final debouncedSearchQueryProvider = StateProvider<String>((ref) => '');

class SearchDebouncer {
  Timer? _timer;

  void debounce(String value, void Function(String) callback) {
    _timer?.cancel();
    _timer = Timer(const Duration(milliseconds: 300), () {
      callback(value);
    });
  }

  void dispose() {
    _timer?.cancel();
  }
}

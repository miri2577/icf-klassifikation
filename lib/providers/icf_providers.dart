import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/code_collection.dart';
import '../services/icf_data_service.dart';
import '../services/favorites_service.dart';
import '../services/history_service.dart';
import '../services/collections_service.dart';
import '../services/search_history_service.dart';
import '../services/qualifier_memory_service.dart';
import '../services/review_service.dart';

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

// Collections
final collectionsServiceProvider = Provider<CollectionsService>((ref) {
  final prefs = ref.read(sharedPreferencesProvider);
  return CollectionsService(prefs);
});

final collectionsProvider =
    StateNotifierProvider<CollectionsNotifier, List<CodeCollection>>((ref) {
  final service = ref.read(collectionsServiceProvider);
  return CollectionsNotifier(service);
});

class CollectionsNotifier extends StateNotifier<List<CodeCollection>> {
  final CollectionsService _service;

  CollectionsNotifier(this._service) : super(_service.getAll());

  void _refresh() => state = _service.getAll();

  Future<CodeCollection> create(String name) async {
    final collection = await _service.create(name);
    _refresh();
    return collection;
  }

  Future<void> rename(String id, String newName) async {
    await _service.rename(id, newName);
    _refresh();
  }

  Future<void> delete(String id) async {
    await _service.delete(id);
    _refresh();
  }

  Future<void> addEntry(String collectionId, CollectionEntry entry) async {
    await _service.addEntry(collectionId, entry);
    _refresh();
  }

  Future<void> updateEntry(
      String collectionId, String code, CollectionEntry entry) async {
    await _service.updateEntry(collectionId, code, entry);
    _refresh();
  }

  Future<void> removeEntry(String collectionId, String code) async {
    await _service.removeEntry(collectionId, code);
    _refresh();
  }

  void reload() => _refresh();
}

// Search history
final searchHistoryServiceProvider = Provider<SearchHistoryService>((ref) {
  final prefs = ref.read(sharedPreferencesProvider);
  return SearchHistoryService(prefs);
});

final searchHistoryProvider =
    StateNotifierProvider<SearchHistoryNotifier, List<String>>((ref) {
  final service = ref.read(searchHistoryServiceProvider);
  return SearchHistoryNotifier(service);
});

class SearchHistoryNotifier extends StateNotifier<List<String>> {
  final SearchHistoryService _service;

  SearchHistoryNotifier(this._service) : super(_service.getQueries());

  Future<void> add(String query) async {
    await _service.addQuery(query);
    state = _service.getQueries();
  }

  Future<void> clear() async {
    await _service.clear();
    state = [];
  }
}

// Qualifier memory
final qualifierMemoryProvider = Provider<QualifierMemoryService>((ref) {
  final prefs = ref.read(sharedPreferencesProvider);
  return QualifierMemoryService(prefs);
});

// In-App Review
final reviewServiceProvider = Provider<ReviewService>((ref) {
  final prefs = ref.read(sharedPreferencesProvider);
  return ReviewService(prefs);
});

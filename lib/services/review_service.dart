import 'package:flutter/foundation.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Fragt nach einigen angesehenen Codes einmalig per Play-In-App-Review
/// nach einer Bewertung.
class ReviewService {
  static const _countKey = 'icf_detail_view_count';
  static const _askedKey = 'icf_review_requested';
  static const _threshold = 10;

  final SharedPreferences _prefs;

  ReviewService(this._prefs);

  Future<void> onDetailViewed() async {
    if (kIsWeb) return;
    final count = (_prefs.getInt(_countKey) ?? 0) + 1;
    await _prefs.setInt(_countKey, count);
    if (count < _threshold || (_prefs.getBool(_askedKey) ?? false)) {
      return;
    }
    await _prefs.setBool(_askedKey, true);
    try {
      final review = InAppReview.instance;
      if (await review.isAvailable()) {
        await review.requestReview();
      }
    } catch (_) {
      // Review-Dialog ist rein optional — Fehler still ignorieren.
    }
  }
}

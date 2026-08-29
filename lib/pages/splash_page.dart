import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeIn;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeIn = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeIn),
    );
    _fadeController.forward();

    Timer(const Duration(seconds: 3), _navigateToApp);
  }

  void _navigateToApp() {
    if (!mounted) return;
    context.go('/home');
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  bool get _isDesktop {
    if (kIsWeb) return false;
    return Platform.isMacOS || Platform.isWindows || Platform.isLinux;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor =
        isDark ? const Color(0xFF16262E) : const Color(0xFFD6E8F0);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      // Kein AppBar: Statusbar-Icons passend zum Hintergrund erzwingen.
      value: isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: bgColor,
        body: GestureDetector(
          onTap: _navigateToApp,
          child: FadeTransition(
            opacity: _fadeIn,
            child: Center(
              child: Padding(
                padding: _isDesktop
                    ? const EdgeInsets.all(48)
                    : const EdgeInsets.all(24),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(_isDesktop ? 20 : 16),
                  child: Image.asset(
                    _isDesktop
                        ? 'assets/splash/splash_desktop.webp'
                        : 'assets/splash/splash_mobile.webp',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

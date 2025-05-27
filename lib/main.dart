import 'package:flutter/material.dart';
import 'package:cinema_application/app_router.dart';
import 'package:cinema_application/config/theme/app_theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Theme mode provider to allow switching between light and dark themes
final themeProvider = StateProvider<ThemeMode>((ref) {
  return ThemeMode.dark; // Default to dark theme
});

Future<void> main() async {
  // Load environment variables from .env file
  await dotenv.load(fileName: ".env");
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      themeMode: themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
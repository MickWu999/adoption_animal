import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: '.env');
    await Supabase.initialize(
      url: _readEnv('APP_SUPABASE_URL', fallback: 'SUPABASE_URL'),
      anonKey: _readEnv(
        'APP_SUPABASE_ANON_KEY',
        fallback: 'SUPABASE_ANON_KEY',
      ),
    );
  } catch (error, stackTrace) {
    debugPrint('Supabase bootstrap failed: $error');
    debugPrintStack(stackTrace: stackTrace);
    rethrow;
  }
  runApp(const ProviderScope(child: MyApp()));
}

String _readEnv(String key, {String? fallback}) {
  final value = dotenv.env[key];
  if (value != null && value.isNotEmpty) {
    return value;
  }
  if (fallback != null) {
    final fallbackValue = dotenv.env[fallback];
    if (fallbackValue != null && fallbackValue.isNotEmpty) {
      return fallbackValue;
    }
  }
  throw StateError('Missing required environment variable: $key');
}

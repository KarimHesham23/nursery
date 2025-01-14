import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerSingletonAsync<SharedPreferences>(() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  });
  await getIt.allReady(); // Ensure all async singletons are ready
}

import 'package:akukom/app/locator.dart';
import 'package:akukom/features/main_layout/__main_layout.dart';

void setupMainLayoutLocator() {
  // Cubit
  // BottomNavCubit
  getIt.registerLazySingleton(
    () => BottomNavCubit(),
  );
}

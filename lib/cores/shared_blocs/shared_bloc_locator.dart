import 'package:akukom/app/locator.dart';
import 'package:akukom/cores/shared_blocs/__shared_bloc.dart';

void setUpSharedBlocLocator() {
  // Bloc
  getIt.registerLazySingleton(
    () => UserBloc(),
  );
}

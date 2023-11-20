import 'package:akukom/app/locator.dart';
import 'package:akukom/cores/utils/http_helper.dart';
import 'package:akukom/features/auth/__auth.dart';

void setAuthLocator() {
  // Data Sources
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(httpHelper: getIt<HttpHelper>()),
  );

  // Repositories
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: getIt<AuthRemoteDataSource>(),
    ),
  );

  // usecase
  getIt.registerLazySingleton(
    () => ChangePasswordUseCase(repository: getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton(
    () => CompleteSignupUseCase(repository: getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton(
    () => ForgotPasswordUseCase(repository: getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton(
    () => ForgotPasswordVerificationUseCase(
      repository: getIt<AuthRepository>(),
    ),
  );

  getIt.registerLazySingleton(
    () => LoginUseCase(repository: getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton(
    () => RefreshTokenUseCase(repository: getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton(
    () => SignupUseCase(repository: getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton(
    () => VerifyPhoneNumberUseCase(repository: getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton(
    () => CheckPhoneUsageUseCase(repository: getIt<AuthRepository>()),
  );

  // Bloc
  
}

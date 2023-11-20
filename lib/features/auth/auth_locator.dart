import 'package:akukom/app/locator.dart';
import 'package:akukom/cores/utils/http_helper.dart';
import 'package:akukom/features/auth/__auth.dart';

void setupAuthLocator() {
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
  getIt.registerFactory(
    () => ChangePasswordBloc(
      changePasswordUseCase: getIt<ChangePasswordUseCase>(),
    ),
  );

  getIt.registerFactory(
    () => CheckPhoneUsageBloc(
      checkPhoneUsageUseCase: getIt<CheckPhoneUsageUseCase>(),
    ),
  );

  getIt.registerFactory(
    () => CompleteSignupBloc(
      completeSignupUseCase: getIt<CompleteSignupUseCase>(),
    ),
  );

  getIt.registerFactory(
    () => ForgotPasswordOtpBloc(
      forgotPasswordUseCase: getIt<ForgotPasswordUseCase>(),
    ),
  );

  getIt.registerFactory(
    () => SigninBloc(
      loginUseCase: getIt<LoginUseCase>(),
    ),
  );

  getIt.registerFactory(
    () => SignupBloc(
      signupUseCase: getIt<SignupUseCase>(),
    ),
  );

  getIt.registerFactory(
    () => VerifyForgotPasswordOtpBloc(
      forgotPasswordVerificationUseCase:
          getIt<ForgotPasswordVerificationUseCase>(),
    ),
  );

  getIt.registerFactory(
    () => VerifyPhoneBloc(
      verifyPhoneNumberUseCase: getIt<VerifyPhoneNumberUseCase>(),
    ),
  );

  // Cubits
  getIt.registerLazySingleton(
    () => CreateNewPasswordCubit(),
  );


  getIt.registerLazySingleton(
    () => ForgotPasswordCubit(),
  );

  getIt.registerLazySingleton(
    () => LoginCubit(),
  );

  getIt.registerLazySingleton(
    () => SignupCompleteCubit(),
  );

  getIt.registerLazySingleton(
    () => SignupCubit(),
  );
}

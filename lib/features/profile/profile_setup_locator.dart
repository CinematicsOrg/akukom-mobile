import 'package:akukom/app/locator.dart';
import 'package:akukom/features/profile/__profile.dart';

void setUpProfileLocator() {
  // data sources
  getIt.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(
      httpHelper: getIt(),
    ),
  );

  // repositories
  getIt.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      remoteDataSource: getIt(),
    ),
  );

  // use cases
  getIt.registerLazySingleton(
    () => EditProfileUseCase(
      repository: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => UploadProfileImageUseCase(
      profileRepository: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => ProfileChangePasswordUseCase(
      repository: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => DeleteAccountUseCase(
      repository: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => DeactivateAccountUseCase(
      repository: getIt(),
    ),
  );

  // blocs
  getIt.registerFactory(
    () => EditProfileBloc(
      editProfileUseCase: getIt(),
    ),
  );

  getIt.registerFactory(
    () => DeleteAccountBloc(
      deleteAccountUseCase: getIt(),
    ),
  );
  getIt.registerFactory(
    () => ProfileChangePasswordBloc(
      profileChangePasswordUseCase: getIt(),
    ),
  );

  getIt.registerFactory(
    () => ProfileUploadImageBloc(
      uploadProfileImageUseCase: getIt(),
    ),
  );

  // cubits
  getIt.registerLazySingleton(
    () => EditProfileCubit(),
  );

  getIt.registerLazySingleton(
    () => PasswordCubitCubit(),
  );
}

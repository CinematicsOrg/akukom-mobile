import 'package:akukom/app/locator.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/family_group/__family_group.dart';

void setupFamilyGroupLocator() {
  // Data Sources
  getIt.registerLazySingleton<FamilyGroupRemoteDataSource>(
    () => FamilyGroupRemoteDataSourceImpl(httpHelper: getIt<HttpHelper>()),
  );

  // Repositories
  getIt.registerLazySingleton<FamilyGroupRepository>(
    () => FamilyGroupRepositoryImpl(
      familyGroupRemoteDataSource: getIt<FamilyGroupRemoteDataSource>(),
    ),
  );

  // usecase
  getIt.registerLazySingleton(
    () => AcceptOrRejectRequestUseCase(
        familyGroupRepository: getIt<FamilyGroupRepository>()),
  );

  getIt.registerLazySingleton(
    () => AddFamilyMembersUseCase(
        familyGroupRepository: getIt<FamilyGroupRepository>()),
  );

  getIt.registerLazySingleton(
    () => CreateFamilyUseCase(
        familyGroupRepository: getIt<FamilyGroupRepository>()),
  );

  getIt.registerLazySingleton(
    () => GetFamilyDetailsUseCase(
        familyGroupRepository: getIt<FamilyGroupRepository>()),
  );

  getIt.registerLazySingleton(
    () => GetFamilyMembersUseCase(
        familyGroupRepository: getIt<FamilyGroupRepository>()),
  );

  getIt.registerLazySingleton(
    () => ListFamilyUserCanJoinUseCase(
        familyGroupRepository: getIt<FamilyGroupRepository>()),
  );

  getIt.registerLazySingleton(
    () => GetUserFamilyUseCase(
        familyGroupRepository: getIt<FamilyGroupRepository>()),
  );

  getIt.registerLazySingleton(
    () =>
        GetUsersUseCase(familyGroupRepository: getIt<FamilyGroupRepository>()),
  );

  getIt.registerLazySingleton(
    () => ListPendingFamilyUseCase(
        familyGroupRepository: getIt<FamilyGroupRepository>()),
  );

  getIt.registerLazySingleton(
    () => RequestToJoinFamilyUseCase(
        familyGroupRepository: getIt<FamilyGroupRepository>()),
  );

  getIt.registerLazySingleton(
    () => UpdateFamilyUseCase(
        familyGroupRepository: getIt<FamilyGroupRepository>()),
  );

  getIt.registerLazySingleton(
    () => UserInFamilyUseCase(
        familyGroupRepository: getIt<FamilyGroupRepository>()),
  );

  // cubit
  getIt.registerFactory(
    () => CreateFamilyFormCubit(),
  );

  getIt.registerLazySingleton(
    () => AddFamilyMemberListCubit(),
  );

  //blocs
  getIt.registerLazySingleton(
    () => GetUserListBloc(
      getUsersUseCase: getIt<GetUsersUseCase>(),
    ),
  );

  getIt.registerFactory(
    () => CreateFamilyBloc(
      createFamilyUseCase: getIt<CreateFamilyUseCase>(),
    ),
  );

  getIt.registerFactory(
    () => AddFamilyMembersBloc(
      addFamilyMembersUseCase: getIt<AddFamilyMembersUseCase>(),
    ),
  );

  getIt.registerFactory(
    () => GetFamilyFamilyUserCanJoinBloc(
      listFamilyUserCanJoinUseCase: getIt<ListFamilyUserCanJoinUseCase>(),
    ),
  );

  getIt.registerFactory(
    () => RequestsToJoinFamilyBloc(
      requestToJoinFamilyUseCase: getIt<RequestToJoinFamilyUseCase>(),
    ),
  );

  getIt.registerLazySingleton(
    () => GetUserFamilyBloc(
      getUserFamilyUseCase: getIt<GetUserFamilyUseCase>(),
    ),
  );
}

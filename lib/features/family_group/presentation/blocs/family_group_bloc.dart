// import 'dart:async';

// import 'package:equatable/equatable.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:akukom/features/family_group/domain/entities/family_group_entity.dart';
// import 'package:akukom/features/family_group/domain/usecases/fetch_family_group_usecase.dart';

// part 'family_group_event.dart';
// part 'family_group_state.dart';

// class FamilyGroupBloc extends Bloc<FamilyGroupEvent, FamilyGroupState> {
//   final FetchFamilyGroupUseCase fetchFamilyGroupUseCase;

//   FamilyGroupBloc({
//     @required FetchFamilyGroupUseCase fetchFamilyGroupUseCase
//   })  : this.fetchFamilyGroupUseCase = fetchFamilyGroupUseCase,
//         super(FamilyGroupState(status: FamilyGroupStateStatus.init));

//   @override
//   Stream<FamilyGroupState> mapEventToState(FamilyGroupEvent event) async* {
//     if (event is EventFetchFamilyGroup) {
//       yield* _handleFetchPD(event);
//     }
//   }

//   Stream<FamilyGroupState> _handleFetchPD(EventFetchFamilyGroup event) async* {
//     yield state.copyWith(status: FamilyGroupStateStatus.showLoading);
//     final result = await fetchFamilyGroupUseCase(FetchFamilyGroupParam(id: event.id));
//     yield state.copyWith(status: FamilyGroupStateStatus.hideLoading);
//     yield result.fold(
//       (failure) => state.copyWith(status: FamilyGroupStateStatus.loadedFailed, errorMessage: 'Có lỗi xảy ra. Vui lòng thử lại.'),
//       (data) => state.copyWith(status: FamilyGroupStateStatus.loadedSuccess, detail: data)
//     );
//   }
// }

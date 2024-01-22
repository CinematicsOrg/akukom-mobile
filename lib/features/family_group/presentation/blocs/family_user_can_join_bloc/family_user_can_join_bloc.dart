import 'package:akukom/features/family_group/__family_group.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'family_user_can_join_event.dart';
part 'family_user_can_join_state.dart';

class FamilyUserCanJoinBloc
    extends Bloc<FamilyUserCanJoinEvent, FamilyUserCanJoinState> {
  final ListFamilyUserCanJoinUseCase listFamilyUserCanJoinUseCase;
  FamilyUserCanJoinBloc({
    required this.listFamilyUserCanJoinUseCase,
  }) : super(FamilyUserCanJoinState.initial()) {
    on<GetFamilyListUserCanJoinEvent>(_onGetFamilyListUserCanJoinEventHandler);
  }

  Future<void> _onGetFamilyListUserCanJoinEventHandler(
    GetFamilyListUserCanJoinEvent event,
    Emitter<FamilyUserCanJoinState> emit,
  ) async {
    emit(state.copyWith(status: FamilyUserCanJoinStatus.loading));
    final result = await listFamilyUserCanJoinUseCase(event.param);
    result.fold(
      (failures) {
        emit(state.copyWith(
          status: FamilyUserCanJoinStatus.failure,
          message: failures.message,
        ));
      },
      (data) {
        emit(state.copyWith(
          status: FamilyUserCanJoinStatus.success,
          data: data,
        ));
      },
    );
  }
}

import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_family_details_event.dart';
part 'get_family_details_state.dart';

class GetFamilyDetailsBloc
    extends Bloc<GetFamilyDetailsEvent, GetFamilyDetailsState> {
  final GetFamilyDetailsUseCase getFamilyDetailsUseCase;
  GetFamilyDetailsBloc({
    required this.getFamilyDetailsUseCase,
  }) : super(GetFamilyDetailsState.initial()) {
    on<GetFamilyDetailsUserEvent>(_onGetFamilyDetailsUserEvent);
  }

  void _onGetFamilyDetailsUserEvent(
    GetFamilyDetailsUserEvent event,
    Emitter<GetFamilyDetailsState> emit,
  ) async {
    emit(state.copyWith(status: GetFamilyDetailsStatus.loading));
    final result = await getFamilyDetailsUseCase(event.param);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: GetFamilyDetailsStatus.failure,
          failure: failure,
        ),
      ),
      (data) => emit(
        state.copyWith(
          status: GetFamilyDetailsStatus.success,
          data: data,
        ),
      ),
    );
  }
}

import 'package:akukom/cores/entity/base_entity.dart';
import 'package:akukom/cores/failures/base.dart';
import 'package:akukom/cores/usecase/usecase.dart';
import 'package:akukom/features/profile/__profile.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'delete_account_event.dart';
part 'delete_account_state.dart';

class DeleteAccountBloc extends Bloc<DeleteAccountEvent, DeleteAccountState> {
  final DeleteAccountUseCase deleteAccountUseCase;
  DeleteAccountBloc({
    required this.deleteAccountUseCase,
  }) : super(DeleteAccountState.initial()) {
    on<DeleteAccountUserEvent>(_onDeleteAccountUserEventHandler);
  }

  void _onDeleteAccountUserEventHandler(
    DeleteAccountUserEvent event,
    Emitter<DeleteAccountState> emit,
  ) async {
    emit(state.copyWith(status: DeleteAccountStatus.loading));
    final result = await deleteAccountUseCase(event.params);
    result.fold(
      (failures) {
        emit(state.copyWith(
          status: DeleteAccountStatus.failure,
          failures: failures,
        ));
      },
      (data) {
        emit(state.copyWith(
          status: DeleteAccountStatus.success,
          deleteAccountEntity: data,
        ));
      },
    );
  }
}

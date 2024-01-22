part of 'delete_account_bloc.dart';

abstract class DeleteAccountEvent extends Equatable {
  const DeleteAccountEvent();

  @override
  List<Object> get props => [];
}

class DeleteAccountUserEvent extends DeleteAccountEvent {
  final NoParams params;

  const DeleteAccountUserEvent({
    required this.params,
  });

  @override
  List<Object> get props => [params];
}

part of 'user_bloc.dart';

enum UserStatus { initial, loading, loaded, error }

class UserState extends Equatable {
  final UserStatus status;
  final User? user;
  final String? message;

  const UserState({
    this.status = UserStatus.initial,
    this.user,
    this.message,
  });

  factory UserState.initial() => const UserState(
        status: UserStatus.initial,
      );

  UserState copyWith({
    UserStatus? status,
    User? user,
    String? message,
  }) {
    return UserState(
      status: status ?? this.status,
      user: user ?? this.user,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        status,
        user,
        message,
      ];
}

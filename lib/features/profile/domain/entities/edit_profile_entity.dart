
import 'package:akukom/features/auth/__auth.dart';
import 'package:equatable/equatable.dart';

class EditProfileEntity extends Equatable {
  final User? user;

  const EditProfileEntity({
    required this.user,
  });

  @override
  List<Object?> get props => [
        user,
      ];

  
}
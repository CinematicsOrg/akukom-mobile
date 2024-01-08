part of 'edit_profile_cubit.dart';

enum EditProfileCubitStatus {
  readonly,
  editing,
}

extension EditProfileCubitStatusX on EditProfileCubitStatus {
  bool get isReadonly => this == EditProfileCubitStatus.readonly;
  bool get isEditing => this == EditProfileCubitStatus.editing;
}

class EditProfileCubitState extends Equatable {
  final EditProfileCubitStatus status;
  final Required firstName;
  final Required lastName;
  final Required country;
  final Required tribe;
  final Required email;
  final bool isValid;

  const EditProfileCubitState({
    this.status = EditProfileCubitStatus.readonly,
    this.firstName = const Required.pure(),
    this.lastName = const Required.pure(),
    this.country = const Required.pure(),
    this.tribe = const Required.pure(),
    this.email = const Required.pure(),
    this.isValid = false,
  });

  factory EditProfileCubitState.initial() => const EditProfileCubitState();

  EditProfileCubitState copyWith({
    EditProfileCubitStatus? status,
    Required? firstName,
    Required? lastName,
    Required? country,
    Required? tribe,
    bool? isValid,
    Required? email,
  }) {
    bool? updatedIsValid = (firstName ?? this.firstName).isValid &&
        (lastName ?? this.lastName).isValid &&
        (country ?? this.country).isValid &&
        // (tribe ?? this.tribe).isValid &&
        (email ?? this.email).isValid;

    return EditProfileCubitState(
      status: status ?? this.status,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      country: country ?? this.country,
      tribe: tribe ?? this.tribe,
      email: email ?? this.email,
      isValid: updatedIsValid,
    );
  }

  bool get isReadonly => status.isReadonly;
  bool get isEditing => status.isEditing;

  @override
  List<Object?> get props => [
        status,
        firstName,
        lastName,
        country,
        tribe,
        isValid,
        email,
      ];

  @override
  bool get stringify => true;
}

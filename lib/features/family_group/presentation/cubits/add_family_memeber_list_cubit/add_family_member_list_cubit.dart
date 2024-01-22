import 'package:akukom/features/family_group/__family_group.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddFamilyMemberListCubit extends Cubit<AddFamilyMemberListState> {
  AddFamilyMemberListCubit() : super(AddFamilyMemberListState.initial());

  void addFamilyMember(UsersListDocEntity? value) {
    if (value == null) return; // No action if the value is null

    // Initialize an empty set
    final Set<UsersListDocEntity> familyMembers = {};

    // If the current state's family members are not null, add them to the set
    if (state.familyMembers != null) {
      familyMembers.addAll(state.familyMembers!);
    }

    // Add the new member
    familyMembers.add(value);

    // Emit the new state
    emit(state.copyWith(familyMembers: familyMembers));
  }

  void resetFamilyMembers() {
    emit(state.copyWith(familyMembers: null));
  }
}

class AddFamilyMemberListState extends Equatable {
  // Use a Set instead of a List to store unique values
  final Set<UsersListDocEntity>? familyMembers;

  const AddFamilyMemberListState({
    this.familyMembers,
  });

  factory AddFamilyMemberListState.initial() =>
      const AddFamilyMemberListState();

  AddFamilyMemberListState copyWith({
    Set<UsersListDocEntity>? familyMembers,
  }) {
    return AddFamilyMemberListState(
      familyMembers: familyMembers ?? this.familyMembers,
    );
  }

  @override
  List<Object?> get props => [
        familyMembers,
      ];

  @override
  bool get stringify => true;
}

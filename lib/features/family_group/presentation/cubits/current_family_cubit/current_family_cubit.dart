import 'package:akukom/features/family_group/__family_group.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentFamilyCubit extends Cubit<CurrentFamilyState> {
  CurrentFamilyCubit() : super(CurrentFamilyState.initial());

  void setCurrentFamily(FamilyDataEntity? family) {
    emit(state.copyWith(currentFamily: family));
  }

  void resetCurrentFamily() {
    emit(state.copyWith(currentFamily: null));
  }
}

class CurrentFamilyState extends Equatable {
  final FamilyDataEntity? currentFamily;
  const CurrentFamilyState({
    required this.currentFamily,
  });

  factory CurrentFamilyState.initial() {
    return const CurrentFamilyState(
      currentFamily: null,
    );
  }

  CurrentFamilyState copyWith({
    FamilyDataEntity? currentFamily,
  }) {
    return CurrentFamilyState(
      currentFamily: currentFamily ?? this.currentFamily,
    );
  }

  @override
  List<Object?> get props => [currentFamily];

  @override
  bool get stringify => true;
}

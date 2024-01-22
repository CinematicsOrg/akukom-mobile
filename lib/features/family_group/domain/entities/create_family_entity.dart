import 'package:akukom/features/family_group/__family_group.dart';
import 'package:equatable/equatable.dart';

class CreateFamilyEntity extends Equatable {
  final FamilyDataEntity? data;

  const CreateFamilyEntity({
    required this.data,
  });

  @override
  List<Object?> get props => [
        data,
      ];
}

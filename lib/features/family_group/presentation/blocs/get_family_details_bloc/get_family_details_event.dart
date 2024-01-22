part of 'get_family_details_bloc.dart';

abstract class GetFamilyDetailsEvent extends Equatable {
  const GetFamilyDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetFamilyDetailsUserEvent extends GetFamilyDetailsEvent {
  final dynamic param;

  const GetFamilyDetailsUserEvent({
    required this.param,
  });

  @override
  List<Object> get props => [
        param,
      ];
}

part of 'bottom_nav_cubit.dart';

class BottomNavState extends Equatable {
  final int index;

  const BottomNavState({
    required this.index,
  });

  factory BottomNavState.initial() => const BottomNavState(index: 0);

  BottomNavState copyWith({
    required int index,
  }) {
    return BottomNavState(
      index: index,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        index,
      ];
}

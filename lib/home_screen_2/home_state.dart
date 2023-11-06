///Khai báo biến
part of 'home_cubit.dart';

class HomeState extends Equatable {
  final int selectedIndex;
  final int displayNumber;

  const HomeState({
    this.selectedIndex = 0,
    this.displayNumber = 0,
  });

  @override
  List<Object?> get props => [
        selectedIndex,
    displayNumber,
      ];

  HomeState copyWith({
    int? selectedIndex,
    int? displayNumber,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      displayNumber: displayNumber ?? this.displayNumber,
    );
  }
}

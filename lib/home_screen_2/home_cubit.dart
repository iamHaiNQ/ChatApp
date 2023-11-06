import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///Viết logic
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void changeTab(int index) {
    emit(state.copyWith(
      selectedIndex: index,
    ));
  }

  void increase() {
    emit(state.copyWith(
      displayNumber: state.displayNumber +1,
    ));
  }
}

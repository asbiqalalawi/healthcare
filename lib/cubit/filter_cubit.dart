import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<int> {
  FilterCubit() : super(0);

  void updateIndex(int index) {
    emit(index);
  }
}

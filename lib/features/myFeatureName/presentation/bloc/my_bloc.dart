import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/my_use_case.dart';
import 'my_bloc_events.dart';
import 'my_bloc_states.dart';

class MyBloc extends Bloc<MyEvents, MyStates> {
  final GetMyListUseCase getMyListUseCase;
  final GetMyEntityUseCase getMyEntityUseCase;

  MyBloc(super.initialState, this.getMyListUseCase, this.getMyEntityUseCase)
      : super() {
    on<MyEvents>((event, emit) async {
      if (event is FetchDataEvent) {
        emit(LoadingState("Please wait"));
        var myEvent = await getMyEntityUseCase(event.id);
        myEvent.fold(
            (error) => emit(ErrorState(error.msg ?? "Something went wrong")),
            (entity) => emit(ShowData(entity)));
      } else if (event is FetchDataListEvent) {
        emit(LoadingState("Please wait"));
        var myEvent = await getMyListUseCase();
        myEvent.fold(
            (error) => emit(ErrorState(error.msg ?? "Something went wrong")),
            (list) => emit(ShowListData(list)));
      }
    });
  }
}

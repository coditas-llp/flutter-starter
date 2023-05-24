import 'package:equatable/equatable.dart';

///Events
sealed class MyEvents extends Equatable {}

class FetchDataEvent extends MyEvents {
  final int id;

  FetchDataEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class FetchDataListEvent extends MyEvents {
  FetchDataListEvent();

  @override
  List<Object?> get props => [];
}

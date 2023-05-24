import 'package:equatable/equatable.dart';
import 'package:scaffold/features/myFeatureName/domain/entities/my_entity.dart';

///Events
abstract class MyStates extends Equatable {}

class InitState extends MyStates {
  InitState();

  @override
  List<Object?> get props => [];
}

class LoadingState extends MyStates {
  final String msg;

  LoadingState(this.msg);

  @override
  List<Object?> get props => [msg];
}

class ErrorState extends MyStates {
  final String msg;

  ErrorState(this.msg);

  @override
  List<Object?> get props => [msg];
}

class ShowData extends MyStates {
  final MyEntity model;

  ShowData(this.model);

  @override
  List<Object?> get props => [model];
}

class ShowListData extends MyStates {
  final List<MyEntity> list;

  ShowListData(this.list);

  @override
  List<Object?> get props => [list];
}

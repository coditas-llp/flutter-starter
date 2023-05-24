import 'package:equatable/equatable.dart';

/// create a class extend it with [Equatable]
/// add only parameter from the data model which will be required on view side
/// no need to add all of the parameter
/// to save time create object of model or list of model inside the [MyEntity]

class MyEntity extends Equatable {
  final String userName;
  final int userAge;

  const MyEntity({required this.userName, required this.userAge});

  @override
  List<Object?> get props {
    return [userName, userAge];
  }
}

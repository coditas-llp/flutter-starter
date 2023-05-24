import 'package:json_annotation/json_annotation.dart';
import 'package:scaffold/features/myFeatureName/domain/entities/my_entity.dart';

part 'my_model.g.dart';

@JsonSerializable()
class MyEntityModel extends MyEntity {
  final int id;

  const MyEntityModel(
      {required this.id, required super.userName, required super.userAge});

  factory MyEntityModel.fromJson(Map<String, dynamic> json) =>
      _$MyEntityModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyEntityModelToJson(this);
}

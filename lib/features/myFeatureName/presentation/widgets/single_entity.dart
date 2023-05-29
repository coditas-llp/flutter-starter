import 'package:flutter/cupertino.dart';

import '../../../../core/constants/dimen.dart';
import '../../domain/entities/my_entity.dart';

class SingleEntity extends StatelessWidget {
  final MyEntity myEntity;

  const SingleEntity(this.myEntity, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(padding),
      child: Column(mainAxisSize: MainAxisSize.min,
        children: [
          Text("Name: ${myEntity.userName}"),
          Text("Age: ${myEntity.userAge}"),
        ],
      ),
    );
  }
}

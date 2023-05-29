import 'package:flutter/cupertino.dart';
import '../../../../core/constants/dimen.dart';

import '../../domain/entities/my_entity.dart';
import 'single_entity.dart';

class EntityList extends StatelessWidget {
  final List<MyEntity> list;

  const EntityList(this.list, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(padding),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Container(
            padding:  EdgeInsets.symmetric(vertical: padding),
            child: SingleEntity(list[index]),
            // Text(list[index].userName),
          );
        },
      ),
    );
  }
}

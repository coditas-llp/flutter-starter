import 'package:flutter/cupertino.dart';
import 'package:scaffold/core/constants/dimen.dart';

import '../../domain/entities/my_entity.dart';
import 'single_entity.dart';

class EntityList extends StatelessWidget {
  List<MyEntity> list;

  EntityList(this.list, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(padding),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: padding),
            child: SingleEntity(list[index]),
            // Text(list[index].userName),
          );
        },
      ),
    );
  }
}

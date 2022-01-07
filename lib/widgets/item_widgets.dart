import 'package:flutter/material.dart';
import 'package:my_shop/models/data.dart';

// import 'package:network_to_file_image/network_to_file_image.dart';
class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white10,

      // shape: StadiumBorder(),
      child: ListTile(
        // horizontalTitleGap: 30,
        onTap: () {
          print("${item.name}");
        },
        leading: Image.asset(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "Rs.${item.price.toString()}",
          style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
          textScaleFactor: 1.2,
        ),
      ),
    );
  }
}

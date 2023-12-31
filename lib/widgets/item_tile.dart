import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:technical_dz/models/smartphones_model.dart';

class ItemTile extends StatefulWidget {
  final List<SmartphoneModel> smartphones;
  final SmartphoneModel smartphone;
  const ItemTile({
    Key? key,
    required this.smartphone,
    required this.smartphones,
  }) : super(key: key);

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  final formatter = intl.NumberFormat.decimalPattern();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 5),
      height: 100,
      color: Colors.white,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 100,
              height: 100,
              child: Image.asset(widget.smartphone.imagePath),
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.smartphone.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        '${widget.smartphone.memory} | ${widget.smartphone.processor}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  widget.smartphone.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '${formatter.format(widget.smartphone.price)} ₽',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../core/ui/styles/text_styles.dart';

class TileItem extends StatefulWidget {
  final String title;
  final String subtitle;

  const TileItem({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  State<TileItem> createState() => _TileItemState();
}

class _TileItemState extends State<TileItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        elevation: 7,
        child: InkWell(
          onTap: () {},
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Icon(
                  Icons.work,
                  color: Colors.black54,
                  size: 36,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    height: 36,
                    width: 1,
                    color: Colors.black54,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyles.instance.textRegular.copyWith(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      widget.subtitle,
                      style: TextStyles.instance.textRegular
                          .copyWith(fontSize: 16, color: Colors.black54),
                    ),
                    Text(
                      'Finalização: 29/05/1999',
                      style: TextStyles.instance.textRegular
                          .copyWith(fontSize: 16, color: Colors.black54),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

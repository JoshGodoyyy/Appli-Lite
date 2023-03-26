import 'package:appli_lite/app/core/ui/styles/text_styles.dart';
import 'package:appli_lite/app/pages/edit_item_page/edit_item_page.dart';
import 'package:flutter/material.dart';

//enum Items { editar, remover, transferir }

class TileItem extends StatefulWidget {
  final Map data;

  const TileItem({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<TileItem> createState() => _TileItemState();
}

class _TileItemState extends State<TileItem> {
  //Items? itemSelecionado;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 5,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EditItemPage(
                  data: widget.data,
                  type: 'tools',
                ),
              ),
            );
          },
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Icon(
                  Icons.handyman_rounded,
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
                      widget.data['title'],
                      style: TextStyles.instance.textRegular.copyWith(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      widget.data['details'],
                      style: TextStyles.instance.textRegular
                          .copyWith(fontSize: 16, color: Colors.black54),
                    ),
                    Text(
                      'Quantidade: ${widget.data['amount']}',
                      style: TextStyles.instance.textRegular
                          .copyWith(fontSize: 16, color: Colors.black54),
                    )
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

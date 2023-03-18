import 'package:appli_lite/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

enum Items { editar, remover, transferir }

class TileItem extends StatefulWidget {
  final Map data;

  const TileItem({Key? key, required this.data}) : super(key: key);

  @override
  State<TileItem> createState() => _TileItemState();
}

class _TileItemState extends State<TileItem> {
  Items? itemSelecionado;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5.0,
              spreadRadius: 0.7,
              offset: Offset(5, 5),
            ),
          ],
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
              // const Spacer(),
              // PopupMenuButton<Items>(
              //   initialValue: itemSelecionado,
              //   itemBuilder: (context) => <PopupMenuEntry<Items>>[
              //     const PopupMenuItem<Items>(
              //       value: Items.editar,
              //       child: Text('Editar'),
              //     ),
              //     const PopupMenuItem<Items>(
              //       value: Items.remover,
              //       child: Text('Remover'),
              //     ),
              //     const PopupMenuItem<Items>(
              //       value: Items.transferir,
              //       child: Text('Transferir'),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

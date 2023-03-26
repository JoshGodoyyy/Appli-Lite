import 'package:flutter/material.dart';

import '../../core/ui/styles/colors_app.dart';
import '../../core/ui/styles/text_styles.dart';
import 'widgets/edit_button.dart';
import 'widgets/text_field_item.dart';

class EditItemPage extends StatefulWidget {
  final Map data;
  final String type;

  const EditItemPage({
    Key? key,
    required this.data,
    required this.type,
  }) : super(key: key);

  @override
  State<EditItemPage> createState() => _EditItemPageState();
}

class _EditItemPageState extends State<EditItemPage> {
  final titleController = TextEditingController();
  final detailsController = TextEditingController();
  final itemController = TextEditingController();

  @override
  void initState() {
    titleController.text = widget.data['title'];
    detailsController.text = widget.data['details'];
    if (widget.type == 'tools') {
      itemController.text = widget.data['amount'];
    } else {
      itemController.text = widget.data['id'];
    }
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    detailsController.dispose();
    itemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: ColorsApp.instance.primary,
        title: Text(
          widget.data['title'],
          style: TextStyles.instance.textRegular.copyWith(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Icon(
              widget.type.toLowerCase() == 'tools'
                  ? Icons.hardware
                  : Icons.handyman_rounded,
              size: MediaQuery.of(context).size.width - 86,
              color: Colors.black12,
            ),
          ),
          TextFieldItem(
            controller: titleController,
            hintText: 'Item',
            icon: Icons.hardware,
            title: 'Nome',
          ),
          TextFieldItem(
            controller: detailsController,
            hintText: 'Detalhes',
            icon: Icons.edit,
            title: 'Detalhes',
          ),
          TextFieldItem(
            controller: itemController,
            hintText: 'Quantidade',
            icon: Icons.pin,
            title: widget.type.toLowerCase() == 'tools'
                ? 'Quantidade:'
                : 'Nº Patrimônio:',
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              EditButton(
                color: Colors.green,
                text: 'Salvar',
                icon: Icons.check,
                onTap: () {},
              ),
              EditButton(
                color: Colors.red,
                text: 'Remover',
                icon: Icons.close,
                onTap: () {},
              ),
              EditButton(
                color: Colors.blue,
                text: 'Informar',
                icon: Icons.info_outline_rounded,
                onTap: () {},
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

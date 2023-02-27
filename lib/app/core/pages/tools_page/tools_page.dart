import 'package:appli_lite/app/core/pages/tools_page/widgets/text_field_tools.dart';
import 'package:appli_lite/app/core/pages/tools_page/widgets/tile_item.dart';
import 'package:appli_lite/app/core/ui/styles/colors_app.dart';
import 'package:appli_lite/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ToolsPage extends StatefulWidget {
  const ToolsPage({Key? key}) : super(key: key);

  @override
  State<ToolsPage> createState() => _ToolsPageState();
}

class _ToolsPageState extends State<ToolsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Ferramentas',
          style: TextStyles.instance.textRegular.copyWith(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: ColorsApp.instance.primary,
      ),
      body: ListView(
        children: const [
          TileItem(
            title: 'Chave de fenda',
            amount: 10,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModal(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<dynamic> showModal(BuildContext context) {
    final itemController = TextEditingController();
    final detailsController = TextEditingController();
    final amountController = TextEditingController();

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: 100,
                  height: 5,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.black45,
                  ),
                ),
              ),
              TextFieldTools(
                controller: itemController,
                hintText: 'Item',
                icon: Icons.hardware,
              ),
              TextFieldTools(
                controller: detailsController,
                hintText: 'Detalhes',
                icon: Icons.edit,
              ),
              TextFieldTools(
                controller: amountController,
                hintText: 'Quantidade',
                icon: Icons.home_repair_service,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    showTopSnackBar(
                      Overlay.of(context),
                      const CustomSnackBar.info(
                        message: "Em desenvolvimento",
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffeaddff),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Salvar',
                          style: TextStyles.instance.textRegular
                              .copyWith(fontSize: 16),
                        ),
                        const Icon(Icons.check)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

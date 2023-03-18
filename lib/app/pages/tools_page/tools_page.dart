import 'package:appli_lite/app/pages/tools_page/widgets/text_field_tools.dart';
import 'package:appli_lite/app/pages/tools_page/widgets/tile_item.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:appli_lite/app/core/ui/styles/colors_app.dart';
import 'package:appli_lite/app/core/ui/styles/text_styles.dart';
import 'package:appli_lite/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ToolsPage extends StatefulWidget {
  const ToolsPage({Key? key}) : super(key: key);

  @override
  State<ToolsPage> createState() => _ToolsPageState();
}

class _ToolsPageState extends State<ToolsPage> {
  final databaseReference = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL: 'https://appli-lite-default-rtdb.firebaseio.com/',
  ).ref();

  Query data = FirebaseDatabase.instance.ref().child('tools');

  getData() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

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
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Ocorreu um erro',
                style: TextStyles.instance.textRegular,
              ),
            );
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return FirebaseAnimatedList(
              query: data,
              itemBuilder: (
                context,
                snapshot,
                animation,
                index,
              ) {
                Map tool = snapshot.value as Map;
                tool['key'] = snapshot.key;
                return TileItem(data: tool);
              },
            );
          }
        },
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
                    databaseReference
                        .child('tools')
                        .child(itemController.text)
                        .set({
                      'title': itemController.text,
                      'details': detailsController.text,
                      'amount': amountController.text,
                    });
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

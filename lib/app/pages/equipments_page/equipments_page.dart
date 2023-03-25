import 'package:appli_lite/app/pages/equipments_page/widgets/text_field_equipments.dart';
import 'package:appli_lite/app/pages/equipments_page/widgets/tile_item.dart';
import 'package:appli_lite/app/core/ui/styles/colors_app.dart';
import 'package:appli_lite/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:appli_lite/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class EquipmentsPage extends StatefulWidget {
  const EquipmentsPage({Key? key}) : super(key: key);

  @override
  State<EquipmentsPage> createState() => _EquipmentsPageState();
}

class _EquipmentsPageState extends State<EquipmentsPage> {
  final databaseReference = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL: 'https://appli-lite-default-rtdb.firebaseio.com/',
  ).ref();

  Query data = FirebaseDatabase.instance.ref().child('equipments');

  getData() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
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
          'Equipamentos',
          style: TextStyles.instance.textRegular.copyWith(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
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
                Map equipment = snapshot.value as Map;
                equipment['key'] = snapshot.key;
                return TileItem(data: equipment);
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModal(context);
        },
      ),
    );
  }

  Future<dynamic> showModal(BuildContext context) {
    final itemController = TextEditingController();
    final detailsController = TextEditingController();
    final idController = TextEditingController();

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
              TextFieldEquipments(
                controller: itemController,
                hintText: 'Ferramenta',
                icon: Icons.handyman_rounded,
              ),
              TextFieldEquipments(
                controller: detailsController,
                hintText: 'Detalhes',
                icon: Icons.edit,
              ),
              TextFieldEquipments(
                controller: idController,
                hintText: 'Nº Patrimônio',
                icon: Icons.pin,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    databaseReference
                        .child('equipments')
                        .child(idController.text)
                        .set({
                      'title': itemController.text,
                      'details': detailsController.text,
                      'id': idController.text,
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

import 'package:appli_lite/app/pages/equipments_page/widgets/tile_item.dart';
import 'package:appli_lite/app/core/ui/styles/colors_app.dart';
import 'package:appli_lite/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class EquipmentsPage extends StatefulWidget {
  const EquipmentsPage({Key? key}) : super(key: key);

  @override
  State<EquipmentsPage> createState() => _EquipmentsPageState();
}

class _EquipmentsPageState extends State<EquipmentsPage> {
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
      body: ListView(
        children: const [
          TileItem(
            title: 'Compressor',
            details: '750pcm',
            id: 123456,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

import 'package:appli_lite/app/core/ui/styles/colors_app.dart';
import 'package:appli_lite/app/core/ui/styles/text_styles.dart';
import 'package:appli_lite/app/pages/works_page/widgets/tile_item.dart';
import 'package:flutter/material.dart';

class WorksPage extends StatefulWidget {
  const WorksPage({Key? key}) : super(key: key);

  @override
  State<WorksPage> createState() => _WorksPageState();
}

class _WorksPageState extends State<WorksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.instance.primary,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'Obras',
          style: TextStyles.instance.textRegular.copyWith(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          TileItem(
            title: 'Carvalho e Santos',
            subtitle: 'Rua Columbia, 1033',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

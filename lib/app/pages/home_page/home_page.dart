import 'package:appli_lite/app/pages/equipments_page/equipments_page.dart';
import 'package:appli_lite/app/pages/login_page/login_page.dart';
import 'package:appli_lite/app/pages/tools_page/tools_page.dart';
import 'package:appli_lite/app/core/ui/styles/colors_app.dart';
import 'package:appli_lite/app/core/ui/styles/text_styles.dart';
import 'package:appli_lite/app/pages/home_page/widgets/horizontal_calendar.dart';
import 'package:appli_lite/app/pages/home_page/widgets/main_button.dart';
import 'package:appli_lite/app/pages/works_page/works_page.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.instance.primary,
        elevation: 0,
        title: Text(
          'Appli',
          style: context.textStyles.textRegular.copyWith(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: ColorsApp.instance.primary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      //! Perfil de Usuário
                      showTopSnackBar(
                        Overlay.of(context),
                        const CustomSnackBar.info(
                          message: "Em desenvolvimento",
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Olá, Josh',
                    style: context.textStyles.textRegular.copyWith(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const HorizontalCalendar(),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        MainButton(
                          title: 'Ferramentas',
                          subtitle: 15,
                          icon: Icons.home_repair_service,
                          color: ColorsApp.instance.deepBlue,
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ToolsPage(),
                            ),
                          ),
                        ),
                        MainButton(
                          title: 'Equipamentos',
                          subtitle: 10,
                          icon: Icons.widgets_rounded,
                          color: ColorsApp.instance.orange,
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const EquipmentsPage(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MainButton(
                          title: 'Obras em andamento',
                          subtitle: 8,
                          icon: Icons.construction,
                          color: ColorsApp.instance.pink,
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const WorksPage(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

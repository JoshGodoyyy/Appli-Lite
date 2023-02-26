import 'package:appli_lite/app/core/pages/login_page.dart';
import 'package:appli_lite/app/core/ui/styles/colors_app.dart';
import 'package:appli_lite/app/core/ui/styles/text_styles.dart';
import 'package:appli_lite/app/core/ui/widgets/horizontal_calendar.dart';
import 'package:appli_lite/app/core/ui/widgets/main_button.dart';
import 'package:flutter/material.dart';

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
          style: context.textStyles.textRegular,
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
            icon: const Icon(Icons.logout),
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
                    bottomRight: Radius.circular(10))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
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
                          icon: Icons.hardware_rounded,
                          color: ColorsApp.instance.deepBlue,
                        ),
                        MainButton(
                          title: 'Equipamentos',
                          subtitle: 10,
                          icon: Icons.widgets_rounded,
                          color: ColorsApp.instance.orange,
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

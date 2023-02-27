import 'package:appli_lite/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String title;
  final int subtitle;
  final IconData icon;
  final Color color;
  final Function() onTap;

  const MainButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: InkWell(
          onTap: () => onTap(),
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    spreadRadius: 5,
                    offset: Offset(5, 5))
              ],
            ),
            height: MediaQuery.of(context).size.width / 2 - 20,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Icon(
                      icon,
                      size: 74,
                      color: color,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    title,
                    style: TextStyles.instance.textRegular.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    'Total: $subtitle',
                    style: TextStyles.instance.textRegular.copyWith(
                      color: Colors.black54,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

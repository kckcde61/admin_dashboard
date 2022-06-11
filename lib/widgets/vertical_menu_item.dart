import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_world/widgets/custom_text.dart';
import '../constants/controllers.dart';
import '../constants/style.dart';

class VerticalMenuItem extends StatelessWidget {
  const VerticalMenuItem({Key? key, this.itemName, this.onTap})
      : super(key: key);
  final String? itemName;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap!(),
      onHover: (value) {
        value
            ? menuController.onHover(itemName!)
            : menuController.onHover('not hovering');
      },
      child: Obx(() => Container(
            color: menuController.isHovering(itemName!)
                ? lightGrey.withOpacity(0.1)
                : Colors.transparent,
            child: Row(children: [
              Visibility(
                visible: menuController.isHovering(itemName!) ||
                    menuController.isActive(itemName!),
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
                child: Container(
                  width: 3,
                  height: 72,
                  color: dark,
                ),
              ),
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: menuController.returnIconFor(itemName!),
                  ),
                  if (!menuController.isActive(itemName!))
                    Flexible(
                      child: CustomText(
                        text: itemName,
                        color: dark,
                        size: 18,
                        weight: FontWeight.bold,
                      ),
                    )
                ],
              ))
            ]),
          )),
    );
  }
}

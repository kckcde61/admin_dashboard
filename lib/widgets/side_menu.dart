import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/controllers.dart';
import '../constants/style.dart';
import '../helpers/responsiveness.dart';
import '../routing/routes.dart';
import 'custom_text.dart';
import 'side_menu_item.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      color: light,
      child: ListView(children: [
        if (ResponsiveWidget.isSmallScreen(context))
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 40),
              Row(
                children: [
                  SizedBox(width: _width / 48),
                  Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Image.asset(
                      'assets/icons/logo.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  Flexible(
                      child: CustomText(
                    text: 'Dash',
                    size: 20,
                    weight: FontWeight.bold,
                    color: active,
                  )),
                  SizedBox(
                    width: _width / 48,
                  )
                ],
              ),
            ],
          ),
        Divider(
          color: lightGrey.withOpacity(0.1),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: sideMenuItems
              .map((itemName) => SideMenuItem(
                  itemName: itemName == AuthenticationPageRoute
                      ? 'Log Out'
                      : itemName,
                  onTap: () {
                    if (itemName == AuthenticationPageRoute) {
                      //TODO:: go to authentication page

                    }
                    if (!menuController.isActive(itemName)) {
                      menuController.changeActiveItemTo(itemName);
                      if (ResponsiveWidget.isSmallScreen(context)) {
                        Get.back();
                        // TODO:: go to item name Route
                      }
                    }
                  }))
              .toList(),
        )
      ]),
    );
  }
}

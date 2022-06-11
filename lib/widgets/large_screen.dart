import 'package:flutter/material.dart';

import 'side_menu.dart';
import 'top_nav.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // ignore: always_specify_types
      children: [
        const Expanded(
            // ignore: avoid_redundant_argument_values
            flex: 1,
            child: Drawer(child: SideMenu())

            // Container(
            //   color: Colors.transparent,
            // ),
            ),
        Expanded(
            flex: 5,
            child: Container(
              color: Colors.blue,
            ))
      ],
    );
  }
}

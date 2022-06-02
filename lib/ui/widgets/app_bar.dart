import 'package:flutter/material.dart';

import '/helpers/colors.dart';
import '/helpers/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.YELLOW,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Text('$title', style: appBarTitleDarkTextStyle),
        leading: null,
        bottom: null,
        actions: const [],
      ),
    );
  }

}

import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import '/helpers/styles.dart';
import '/helpers/colors.dart';

Widget getErrorWidget(BuildContext context, FlutterErrorDetails error) {
  return Center(
    child: Text('SomethingWentWrongWidget'.tr(), textScaleFactor: 0.7, style: Theme.of(context).textTheme.subtitle1!.copyWith(color: AppColors.GRAY_DARK)),
  );
}

class NotFoundPage extends StatelessWidget {

  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: AppColors.SILVER,
        appBar: AppBar(
          backgroundColor: AppColors.WHITE,
          centerTitle: false,
          title: Text('Error', textScaleFactor: 1.0, style: appBarTitleDarkTextStyle),
          elevation: 0.0,
          iconTheme: IconThemeData(color: AppColors.BLACK),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Pages Not Found', style: textStyleLabel18),
            ],
          ),
        ),
      ),
    );
  }
}

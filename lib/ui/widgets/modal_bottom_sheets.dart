import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import '/helpers/colors.dart';
import '/helpers/styles.dart';

import '/configs/locator.dart';

import '/services/navigation_service.dart';

Future showStatusWidget(String desc, bool success) {
  return showModalBottomSheet(
    context: locator<NavigationService>().context(),
    isScrollControlled: true,
    isDismissible: false,
    enableDrag: false,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20.0),
      ),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    backgroundColor: AppColors.SILVER,
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setModalState) {
          return WillPopScope(
            onWillPop: () {
              return Future.value(false);
            },
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10.0),
                          Text('$desc', textAlign: TextAlign.center, style: textStyleLabel18),
                          SizedBox(height: 10.0),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.ORANGE,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text('Back'.tr(), style: textStyleButton18),
                      ),
                    ),
                    SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}

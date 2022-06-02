import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:io';
import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:countdown_widget/countdown_widget.dart';

import '/helpers/enums.dart';
import '/helpers/colors.dart';
import '/helpers/styles.dart';
import '/helpers/constants.dart';
import '/helpers/argument.dart';
import '/helpers/utils.dart';

import '/configs/locator.dart';
import '/configs/routes_handler.dart';

import '/models/data_model.dart';

import '/stores/base_store.dart';

import '/services/navigation_service.dart';

import '/ui/widgets/app_bar.dart';

class DashboardPage extends StatefulWidget {

  const DashboardPage({Key? key}) : super(key: key);

  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> with WidgetsBindingObserver, AfterLayoutMixin<DashboardPage> {

  final _baseStore = BaseStore();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    init();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _baseStore.globalState.setBaseStore(null);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
    } else if (state == AppLifecycleState.resumed) {
    } else if (state == AppLifecycleState.inactive) {
    } else if (state == AppLifecycleState.detached) {
    }
    _baseStore.globalState.isInForeground = state == AppLifecycleState.resumed;
    print('foreground : ${_baseStore.globalState.isInForeground}');
  }

  @override
  void afterFirstLayout(BuildContext context) {
    loadData();
  }

  init() async {

    _baseStore.initBaseData(_baseStore);

  }

  Future loadData() async {

  }

  buildListView() {
    return Expanded(
      child: Observer(
        builder: (_) {
          var list = _baseStore.getTodoList;
          if (list.isEmpty) {
            return Container();
          }
          return ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                itemCount: list.length,
                itemBuilder: (_, int index) {
                  return Observer(
                    builder: (_) {
                      TodoListBase data = list[index];
                      return todoContentWidget(index, data);
                    },
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget todoContentWidget(int index, TodoListBase data) {
    var title = data.title;
    var startDate = data.startDate;
    var endDate = data.endDate;

    var startDateString = formatTimestamp(startDate, context.deviceLocale.languageCode == Constants.ZH ? Constants.FORMAT_DATE3 : Constants.FORMAT_DATE1);
    var endDateString = formatTimestamp(endDate, context.deviceLocale.languageCode == Constants.ZH ? Constants.FORMAT_DATE3 : Constants.FORMAT_DATE1);

    bool isToday = DateTime.fromMillisecondsSinceEpoch(data.startDate!).isToday();
    Duration duration = DateTime.fromMillisecondsSinceEpoch(data.endDate!).difference(DateTime.now());

    var status = data.checked ? StatusEnum.COMPLETE.toShortString() : StatusEnum.INCOMPLETE.toShortString();
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.focusedChild?.unfocus();
        }

        _baseStore.setIsEditing(true);
        _baseStore.setTodoListData(data);

        Routes.router.navigateTo(context, Routes.details, routeSettings: RouteSettings(arguments: BaseArguments(_baseStore)), transition: TransitionType.none).then((onValue) {
          if (onValue != null && onValue) {

          }
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.0),
        decoration: BoxDecoration(
          color: AppColors.WHITE,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: Text('$title', style: textStyleTitle24),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 1.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text('StartDate'.tr(), style: textStyleLabel16),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text('EndDate'.tr(), style: textStyleLabel16),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text('TimeLeft'.tr(), style: textStyleLabel16),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 1.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text('$startDateString', style: textStyleTitle16),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text('$endDateString', style: textStyleTitle16),
                  ),
                  Expanded(
                    flex: 1,
                    child: isToday ? CountDownWidget(
                      duration: duration,
                      builder: (context, duration) {
                        return Text('${duration.inHours.toString()} hrs ${duration.inMinutes.remainder(60).toString().padLeft(2, '0')} min', style: textStyleTitle16);
                      },
                      onDurationRemainChanged: (duration) {
                        print('duration:${duration.toString()}');
                      },
                    ) : Text('${duration.inHours.toString()} hrs ${duration.inMinutes.remainder(60).toString().padLeft(2, '0')} min', style: textStyleTitle16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
              decoration: BoxDecoration(
                color: AppColors.GREY,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Status'.tr(), style: textStyleLabel16),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Text('$status', style: data.checked ? textStyleTitleGreen18 : textStyleTitle18),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('TickDesc'.tr(), style: textStyleLabel16),
                        Observer(
                          builder: (_) => Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            side: MaterialStateBorderSide.resolveWith((states) => BorderSide(width: 1.0, color: AppColors.GRAY_DARK)),
                            checkColor: AppColors.ORANGE,
                            fillColor: MaterialStateProperty.all(AppColors.TRANSPARENT),
                            value: data.checked,
                            onChanged: (bool? value) {
                              print('checked : $value');

                              data.checked = !data.checked;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.focusedChild?.unfocus();
        }

      },
      child: WillPopScope(
        onWillPop: () {
          DateTime? now = DateTime.now();
          bool doubleTap = _baseStore.getCurrentBackPressTime == null ? true : now.difference(_baseStore.getCurrentBackPressTime ?? DateTime.now()) > Duration(seconds: 2);

          if (doubleTap) {
            BotToast.showText(text: 'ExitAppDesc'.tr());

            _baseStore.setCurrentBackPressTime(now);
            return Future.value(false);
          }
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          return Future.value(true);
        },
        child: SafeArea(
          bottom: Platform.isAndroid,
          child: Observer(
            builder: (_) => Scaffold(
              key: locator<NavigationService>().dashboardScaffoldKey,
              backgroundColor: AppColors.WHITE,
              appBar: CustomAppBar(title: 'AppName'.tr()),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.focusedChild?.unfocus();
                  }

                  _baseStore.setIsEditing(false);

                  Routes.router.navigateTo(context, Routes.details, routeSettings: RouteSettings(arguments: BaseArguments(_baseStore)), transition: TransitionType.none).then((onValue) {
                    if (onValue != null && onValue) {

                    }
                  });
                },
                child: Icon(Icons.add, color: AppColors.WHITE),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
              body: Container(
                padding: EdgeInsets.only(top: 10.0),
                color: AppColors.SILVER,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildListView(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}

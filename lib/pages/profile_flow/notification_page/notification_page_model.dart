import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/main_appbar/main_appbar_widget.dart';
import '/pages/components/notification_component/notification_component_widget.dart';
import '/pages/empty_components/no_notification_component/no_notification_component_widget.dart';
import 'notification_page_widget.dart' show NotificationPageWidget;
import 'package:flutter/material.dart';

class NotificationPageModel extends FlutterFlowModel<NotificationPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MainAppbar component.
  late MainAppbarModel mainAppbarModel;
  // Models for NotificationComponent dynamic component.
  late FlutterFlowDynamicModels<NotificationComponentModel>
      notificationComponentModels;
  // Model for NoNotificationComponent component.
  late NoNotificationComponentModel noNotificationComponentModel1;
  // Model for NoNotificationComponent component.
  late NoNotificationComponentModel noNotificationComponentModel2;

  @override
  void initState(BuildContext context) {
    mainAppbarModel = createModel(context, () => MainAppbarModel());
    notificationComponentModels =
        FlutterFlowDynamicModels(() => NotificationComponentModel());
    noNotificationComponentModel1 =
        createModel(context, () => NoNotificationComponentModel());
    noNotificationComponentModel2 =
        createModel(context, () => NoNotificationComponentModel());
  }

  @override
  void dispose() {
    mainAppbarModel.dispose();
    notificationComponentModels.dispose();
    noNotificationComponentModel1.dispose();
    noNotificationComponentModel2.dispose();
  }
}

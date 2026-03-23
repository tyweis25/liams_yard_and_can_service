import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/main_appbar/main_appbar_widget.dart';
import '/index.dart';
import 'select_date_page_widget.dart' show SelectDatePageWidget;
import 'package:flutter/material.dart';

class SelectDatePageModel extends FlutterFlowModel<SelectDatePageWidget> {
  ///  Local state fields for this page.

  String? timeSlot;

  ///  State fields for stateful widgets in this page.

  // Model for MainAppbar component.
  late MainAppbarModel mainAppbarModel;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;

  @override
  void initState(BuildContext context) {
    mainAppbarModel = createModel(context, () => MainAppbarModel());
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    mainAppbarModel.dispose();
  }
}

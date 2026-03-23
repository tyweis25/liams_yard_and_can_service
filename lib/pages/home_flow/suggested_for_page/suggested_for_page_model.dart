import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/main_appbar/main_appbar_widget.dart';
import '/pages/components/main_row_component/main_row_component_widget.dart';
import '/index.dart';
import 'suggested_for_page_widget.dart' show SuggestedForPageWidget;
import 'package:flutter/material.dart';

class SuggestedForPageModel extends FlutterFlowModel<SuggestedForPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MainAppbar component.
  late MainAppbarModel mainAppbarModel;
  // Models for MainRowComponent dynamic component.
  late FlutterFlowDynamicModels<MainRowComponentModel> mainRowComponentModels;

  @override
  void initState(BuildContext context) {
    mainAppbarModel = createModel(context, () => MainAppbarModel());
    mainRowComponentModels =
        FlutterFlowDynamicModels(() => MainRowComponentModel());
  }

  @override
  void dispose() {
    mainAppbarModel.dispose();
    mainRowComponentModels.dispose();
  }
}

import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/main_appbar/main_appbar_widget.dart';
import '/pages/components/main_component/main_component_widget.dart';
import '/index.dart';
import 'trending_service_page_widget.dart' show TrendingServicePageWidget;
import 'package:flutter/material.dart';

class TrendingServicePageModel
    extends FlutterFlowModel<TrendingServicePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MainAppbar component.
  late MainAppbarModel mainAppbarModel;
  // Models for MainComponent dynamic component.
  late FlutterFlowDynamicModels<MainComponentModel> mainComponentModels;

  @override
  void initState(BuildContext context) {
    mainAppbarModel = createModel(context, () => MainAppbarModel());
    mainComponentModels = FlutterFlowDynamicModels(() => MainComponentModel());
  }

  @override
  void dispose() {
    mainAppbarModel.dispose();
    mainComponentModels.dispose();
  }
}

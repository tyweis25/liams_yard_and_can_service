import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/main_appbar/main_appbar_widget.dart';
import '/pages/components/main_component/main_component_widget.dart';
import '/pages/empty_components/no_data_component/no_data_component_widget.dart';
import '/index.dart';
import 'cat_related_page_widget.dart' show CatRelatedPageWidget;
import 'package:flutter/material.dart';

class CatRelatedPageModel extends FlutterFlowModel<CatRelatedPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MainAppbar component.
  late MainAppbarModel mainAppbarModel;
  // Models for MainComponent dynamic component.
  late FlutterFlowDynamicModels<MainComponentModel> mainComponentModels;
  // Model for NoDataComponent component.
  late NoDataComponentModel noDataComponentModel;

  @override
  void initState(BuildContext context) {
    mainAppbarModel = createModel(context, () => MainAppbarModel());
    mainComponentModels = FlutterFlowDynamicModels(() => MainComponentModel());
    noDataComponentModel = createModel(context, () => NoDataComponentModel());
  }

  @override
  void dispose() {
    mainAppbarModel.dispose();
    mainComponentModels.dispose();
    noDataComponentModel.dispose();
  }
}

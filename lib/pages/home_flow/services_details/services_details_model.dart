import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/main_component/main_component_widget.dart';
import '/pages/components/review_component/review_component_widget.dart';
import '/pages/components/row_title_componant/row_title_componant_widget.dart';
import '/index.dart';
import 'services_details_widget.dart' show ServicesDetailsWidget;
import 'package:flutter/material.dart';

class ServicesDetailsModel extends FlutterFlowModel<ServicesDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for RowTitleComponant component.
  late RowTitleComponantModel rowTitleComponantModel1;
  // Models for ReviewComponent dynamic component.
  late FlutterFlowDynamicModels<ReviewComponentModel> reviewComponentModels;
  // Model for RowTitleComponant component.
  late RowTitleComponantModel rowTitleComponantModel2;
  // Models for MainComponent dynamic component.
  late FlutterFlowDynamicModels<MainComponentModel> mainComponentModels;

  @override
  void initState(BuildContext context) {
    rowTitleComponantModel1 =
        createModel(context, () => RowTitleComponantModel());
    reviewComponentModels =
        FlutterFlowDynamicModels(() => ReviewComponentModel());
    rowTitleComponantModel2 =
        createModel(context, () => RowTitleComponantModel());
    mainComponentModels = FlutterFlowDynamicModels(() => MainComponentModel());
  }

  @override
  void dispose() {
    rowTitleComponantModel1.dispose();
    reviewComponentModels.dispose();
    rowTitleComponantModel2.dispose();
    mainComponentModels.dispose();
  }
}

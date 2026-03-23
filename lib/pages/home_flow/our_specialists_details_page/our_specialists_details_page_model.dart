import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/main_appbar/main_appbar_widget.dart';
import '/pages/components/main_component/main_component_widget.dart';
import '/pages/components/row_title_componant/row_title_componant_widget.dart';
import '/index.dart';
import 'our_specialists_details_page_widget.dart'
    show OurSpecialistsDetailsPageWidget;
import 'package:flutter/material.dart';

class OurSpecialistsDetailsPageModel
    extends FlutterFlowModel<OurSpecialistsDetailsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MainAppbar component.
  late MainAppbarModel mainAppbarModel;
  // Model for RowTitleComponant component.
  late RowTitleComponantModel rowTitleComponantModel;
  // Models for MainComponent dynamic component.
  late FlutterFlowDynamicModels<MainComponentModel> mainComponentModels;

  @override
  void initState(BuildContext context) {
    mainAppbarModel = createModel(context, () => MainAppbarModel());
    rowTitleComponantModel =
        createModel(context, () => RowTitleComponantModel());
    mainComponentModels = FlutterFlowDynamicModels(() => MainComponentModel());
  }

  @override
  void dispose() {
    mainAppbarModel.dispose();
    rowTitleComponantModel.dispose();
    mainComponentModels.dispose();
  }
}

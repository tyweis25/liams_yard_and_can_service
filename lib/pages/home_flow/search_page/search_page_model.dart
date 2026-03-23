import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/main_appbar/main_appbar_widget.dart';
import '/pages/components/main_component/main_component_widget.dart';
import '/pages/empty_components/no_search_component/no_search_component_widget.dart';
import '/index.dart';
import 'search_page_widget.dart' show SearchPageWidget;
import 'package:flutter/material.dart';

class SearchPageModel extends FlutterFlowModel<SearchPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MainAppbar component.
  late MainAppbarModel mainAppbarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for NoSearchComponent component.
  late NoSearchComponentModel noSearchComponentModel1;
  // Models for MainComponent dynamic component.
  late FlutterFlowDynamicModels<MainComponentModel> mainComponentModels;
  // Model for NoSearchComponent component.
  late NoSearchComponentModel noSearchComponentModel2;

  @override
  void initState(BuildContext context) {
    mainAppbarModel = createModel(context, () => MainAppbarModel());
    noSearchComponentModel1 =
        createModel(context, () => NoSearchComponentModel());
    mainComponentModels = FlutterFlowDynamicModels(() => MainComponentModel());
    noSearchComponentModel2 =
        createModel(context, () => NoSearchComponentModel());
  }

  @override
  void dispose() {
    mainAppbarModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    noSearchComponentModel1.dispose();
    mainComponentModels.dispose();
    noSearchComponentModel2.dispose();
  }
}

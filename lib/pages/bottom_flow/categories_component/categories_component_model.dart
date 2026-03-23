import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/category_component/category_component_widget.dart';
import '/pages/components/center_appbar/center_appbar_widget.dart';
import 'categories_component_widget.dart' show CategoriesComponentWidget;
import 'package:flutter/material.dart';

class CategoriesComponentModel
    extends FlutterFlowModel<CategoriesComponentWidget> {
  ///  Local state fields for this component.

  String? categoryName = 'All';

  ///  State fields for stateful widgets in this component.

  // Model for CenterAppbar component.
  late CenterAppbarModel centerAppbarModel;
  // Models for CategoryComponent dynamic component.
  late FlutterFlowDynamicModels<CategoryComponentModel> categoryComponentModels;

  @override
  void initState(BuildContext context) {
    centerAppbarModel = createModel(context, () => CenterAppbarModel());
    categoryComponentModels =
        FlutterFlowDynamicModels(() => CategoryComponentModel());
  }

  @override
  void dispose() {
    centerAppbarModel.dispose();
    categoryComponentModels.dispose();
  }
}

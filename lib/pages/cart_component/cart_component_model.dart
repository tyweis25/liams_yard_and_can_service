import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/center_appbar/center_appbar_widget.dart';
import '/pages/empty_components/no_cart_component/no_cart_component_widget.dart';
import 'cart_component_widget.dart' show CartComponentWidget;
import 'package:flutter/material.dart';

class CartComponentModel extends FlutterFlowModel<CartComponentWidget> {
  ///  Local state fields for this component.

  bool? serviceTap = false;

  ///  State fields for stateful widgets in this component.

  // Model for CenterAppbar component.
  late CenterAppbarModel centerAppbarModel;
  // Model for NoCartComponent component.
  late NoCartComponentModel noCartComponentModel;

  @override
  void initState(BuildContext context) {
    centerAppbarModel = createModel(context, () => CenterAppbarModel());
    noCartComponentModel = createModel(context, () => NoCartComponentModel());
  }

  @override
  void dispose() {
    centerAppbarModel.dispose();
    noCartComponentModel.dispose();
  }
}

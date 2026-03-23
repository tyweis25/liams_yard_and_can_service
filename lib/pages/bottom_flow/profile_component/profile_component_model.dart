import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/center_appbar/center_appbar_widget.dart';
import 'profile_component_widget.dart' show ProfileComponentWidget;
import 'package:flutter/material.dart';

class ProfileComponentModel extends FlutterFlowModel<ProfileComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for CenterAppbar component.
  late CenterAppbarModel centerAppbarModel;
  // State field(s) for Switch widget.
  bool? switchValue;

  @override
  void initState(BuildContext context) {
    centerAppbarModel = createModel(context, () => CenterAppbarModel());
  }

  @override
  void dispose() {
    centerAppbarModel.dispose();
  }
}

import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/main_appbar/main_appbar_widget.dart';
import '/pages/components/review_component/review_component_widget.dart';
import '/pages/empty_components/no_review_component/no_review_component_widget.dart';
import 'my_reviews_page_widget.dart' show MyReviewsPageWidget;
import 'package:flutter/material.dart';

class MyReviewsPageModel extends FlutterFlowModel<MyReviewsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MainAppbar component.
  late MainAppbarModel mainAppbarModel;
  // Models for ReviewComponent dynamic component.
  late FlutterFlowDynamicModels<ReviewComponentModel> reviewComponentModels;
  // Model for NoReviewComponent component.
  late NoReviewComponentModel noReviewComponentModel;

  @override
  void initState(BuildContext context) {
    mainAppbarModel = createModel(context, () => MainAppbarModel());
    reviewComponentModels =
        FlutterFlowDynamicModels(() => ReviewComponentModel());
    noReviewComponentModel =
        createModel(context, () => NoReviewComponentModel());
  }

  @override
  void dispose() {
    mainAppbarModel.dispose();
    reviewComponentModels.dispose();
    noReviewComponentModel.dispose();
  }
}

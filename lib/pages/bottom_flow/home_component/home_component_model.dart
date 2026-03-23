import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/category_component/category_component_widget.dart';
import '/pages/components/main_component/main_component_widget.dart';
import '/pages/components/main_row_component/main_row_component_widget.dart';
import '/pages/components/row_title_componant/row_title_componant_widget.dart';
import '/pages/components/staff_member_common_component/staff_member_common_component_widget.dart';
import 'home_component_widget.dart' show HomeComponentWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeComponentModel extends FlutterFlowModel<HomeComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController1;
  int carouselCurrentIndex1 = 1;

  // Model for RowTitleComponant component.
  late RowTitleComponantModel rowTitleComponantModel1;
  // Models for CategoryComponent dynamic component.
  late FlutterFlowDynamicModels<CategoryComponentModel> categoryComponentModels;
  // Model for RowTitleComponant component.
  late RowTitleComponantModel rowTitleComponantModel2;
  // Models for MainComponent dynamic component.
  late FlutterFlowDynamicModels<MainComponentModel> mainComponentModels1;
  // Model for RowTitleComponant component.
  late RowTitleComponantModel rowTitleComponantModel3;
  // Models for MainRowComponent dynamic component.
  late FlutterFlowDynamicModels<MainRowComponentModel> mainRowComponentModels1;
  // Model for RowTitleComponant component.
  late RowTitleComponantModel rowTitleComponantModel4;
  // Models for MainComponent dynamic component.
  late FlutterFlowDynamicModels<MainComponentModel> mainComponentModels2;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController2;
  int carouselCurrentIndex2 = 1;

  // Model for RowTitleComponant component.
  late RowTitleComponantModel rowTitleComponantModel5;
  // Models for MainRowComponent dynamic component.
  late FlutterFlowDynamicModels<MainRowComponentModel> mainRowComponentModels2;
  // Model for RowTitleComponant component.
  late RowTitleComponantModel rowTitleComponantModel6;
  // Models for StaffMemberCommonComponent dynamic component.
  late FlutterFlowDynamicModels<StaffMemberCommonComponentModel>
      staffMemberCommonComponentModels;
  // Model for RowTitleComponant component.
  late RowTitleComponantModel rowTitleComponantModel7;

  @override
  void initState(BuildContext context) {
    rowTitleComponantModel1 =
        createModel(context, () => RowTitleComponantModel());
    categoryComponentModels =
        FlutterFlowDynamicModels(() => CategoryComponentModel());
    rowTitleComponantModel2 =
        createModel(context, () => RowTitleComponantModel());
    mainComponentModels1 = FlutterFlowDynamicModels(() => MainComponentModel());
    rowTitleComponantModel3 =
        createModel(context, () => RowTitleComponantModel());
    mainRowComponentModels1 =
        FlutterFlowDynamicModels(() => MainRowComponentModel());
    rowTitleComponantModel4 =
        createModel(context, () => RowTitleComponantModel());
    mainComponentModels2 = FlutterFlowDynamicModels(() => MainComponentModel());
    rowTitleComponantModel5 =
        createModel(context, () => RowTitleComponantModel());
    mainRowComponentModels2 =
        FlutterFlowDynamicModels(() => MainRowComponentModel());
    rowTitleComponantModel6 =
        createModel(context, () => RowTitleComponantModel());
    staffMemberCommonComponentModels =
        FlutterFlowDynamicModels(() => StaffMemberCommonComponentModel());
    rowTitleComponantModel7 =
        createModel(context, () => RowTitleComponantModel());
  }

  @override
  void dispose() {
    rowTitleComponantModel1.dispose();
    categoryComponentModels.dispose();
    rowTitleComponantModel2.dispose();
    mainComponentModels1.dispose();
    rowTitleComponantModel3.dispose();
    mainRowComponentModels1.dispose();
    rowTitleComponantModel4.dispose();
    mainComponentModels2.dispose();
    rowTitleComponantModel5.dispose();
    mainRowComponentModels2.dispose();
    rowTitleComponantModel6.dispose();
    staffMemberCommonComponentModels.dispose();
    rowTitleComponantModel7.dispose();
  }
}

import '/flutter_flow/flutter_flow_util.dart';
import '/pages/bottom_flow/booking_component/booking_component_widget.dart';
import '/pages/bottom_flow/categories_component/categories_component_widget.dart';
import '/pages/bottom_flow/home_component/home_component_widget.dart';
import '/pages/bottom_flow/profile_component/profile_component_widget.dart';
import '/pages/cart_component/cart_component_widget.dart';
import 'home_main_page_widget.dart' show HomeMainPageWidget;
import 'package:flutter/material.dart';

class HomeMainPageModel extends FlutterFlowModel<HomeMainPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for HomeComponent component.
  late HomeComponentModel homeComponentModel;
  // Model for CategoriesComponent component.
  late CategoriesComponentModel categoriesComponentModel;
  // Model for CartComponent component.
  late CartComponentModel cartComponentModel;
  // Model for BookingComponent component.
  late BookingComponentModel bookingComponentModel;
  // Model for ProfileComponent component.
  late ProfileComponentModel profileComponentModel;

  @override
  void initState(BuildContext context) {
    homeComponentModel = createModel(context, () => HomeComponentModel());
    categoriesComponentModel =
        createModel(context, () => CategoriesComponentModel());
    cartComponentModel = createModel(context, () => CartComponentModel());
    bookingComponentModel = createModel(context, () => BookingComponentModel());
    profileComponentModel = createModel(context, () => ProfileComponentModel());
  }

  @override
  void dispose() {
    homeComponentModel.dispose();
    categoriesComponentModel.dispose();
    cartComponentModel.dispose();
    bookingComponentModel.dispose();
    profileComponentModel.dispose();
  }
}

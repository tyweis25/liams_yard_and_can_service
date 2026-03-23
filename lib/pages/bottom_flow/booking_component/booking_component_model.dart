import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/center_appbar/center_appbar_widget.dart';
import '/pages/components/my_booking_container/my_booking_container_widget.dart';
import '/pages/empty_components/no_booking_component/no_booking_component_widget.dart';
import 'booking_component_widget.dart' show BookingComponentWidget;
import 'package:flutter/material.dart';

class BookingComponentModel extends FlutterFlowModel<BookingComponentWidget> {
  ///  Local state fields for this component.

  int? myTripIndex = 0;

  ///  State fields for stateful widgets in this component.

  // Model for CenterAppbar component.
  late CenterAppbarModel centerAppbarModel;
  // Models for MyBookingContainer dynamic component.
  late FlutterFlowDynamicModels<MyBookingContainerModel>
      myBookingContainerModels;
  // Model for NoBookingComponent component.
  late NoBookingComponentModel noBookingComponentModel;

  @override
  void initState(BuildContext context) {
    centerAppbarModel = createModel(context, () => CenterAppbarModel());
    myBookingContainerModels =
        FlutterFlowDynamicModels(() => MyBookingContainerModel());
    noBookingComponentModel =
        createModel(context, () => NoBookingComponentModel());
  }

  @override
  void dispose() {
    centerAppbarModel.dispose();
    myBookingContainerModels.dispose();
    noBookingComponentModel.dispose();
  }
}

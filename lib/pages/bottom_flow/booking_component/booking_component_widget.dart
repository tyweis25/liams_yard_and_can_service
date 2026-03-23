import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/center_appbar/center_appbar_widget.dart';
import '/pages/components/my_booking_container/my_booking_container_widget.dart';
import '/pages/empty_components/no_booking_component/no_booking_component_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'booking_component_model.dart';
export 'booking_component_model.dart';

class BookingComponentWidget extends StatefulWidget {
  const BookingComponentWidget({super.key});

  @override
  State<BookingComponentWidget> createState() => _BookingComponentWidgetState();
}

class _BookingComponentWidgetState extends State<BookingComponentWidget> {
  late BookingComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          wrapWithModel(
            model: _model.centerAppbarModel,
            updateCallback: () => safeSetState(() {}),
            child: CenterAppbarWidget(
              title: 'My booking',
            ),
          ),
          Expanded(
            child: Builder(
              builder: (context) {
                if (FFAppState().connected) {
                  return Builder(
                    builder: (context) {
                      if (FFAppState().bookingListQA.isNotEmpty) {
                        return ListView(
                          padding: EdgeInsets.fromLTRB(
                            0,
                            8.0,
                            0,
                            8.0,
                          ),
                          scrollDirection: Axis.vertical,
                          children: [
                            Builder(
                              builder: (context) {
                                final bookingList =
                                    FFAppState().bookingListQA.toList();

                                return Wrap(
                                  spacing: 0.0,
                                  runSpacing: 0.0,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: List.generate(bookingList.length,
                                      (bookingListIndex) {
                                    final bookingListItem =
                                        bookingList[bookingListIndex];
                                    return Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: wrapWithModel(
                                        model: _model.myBookingContainerModels
                                            .getModel(
                                          bookingListItem.orderId,
                                          bookingListIndex,
                                        ),
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: MyBookingContainerWidget(
                                          key: Key(
                                            'Key2sa_${bookingListItem.orderId}',
                                          ),
                                          name: bookingListItem
                                              .serviceDetail.name,
                                          width: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                810.0) {
                                              return double.infinity;
                                            } else if ((MediaQuery.sizeOf(
                                                            context)
                                                        .width >=
                                                    810.0) &&
                                                (MediaQuery.sizeOf(context)
                                                        .width <
                                                    1280.0)) {
                                              return ((MediaQuery.sizeOf(
                                                              context)
                                                          .width -
                                                      48) *
                                                  1 /
                                                  2);
                                            } else if ((MediaQuery.sizeOf(
                                                            context)
                                                        .width >=
                                                    1280.0) &&
                                                (MediaQuery.sizeOf(context)
                                                        .width <
                                                    2560.0)) {
                                              return ((MediaQuery.sizeOf(
                                                              context)
                                                          .width -
                                                      80) *
                                                  1 /
                                                  4);
                                            } else {
                                              return ((MediaQuery.sizeOf(
                                                              context)
                                                          .width -
                                                      112) *
                                                  1 /
                                                  6);
                                            }
                                          }(),
                                          status: bookingListItem.status,
                                          price: bookingListItem.totalPayment,
                                          bookingId: bookingListItem.orderId,
                                          duration: bookingListItem
                                              .serviceDetail.duration,
                                          isMainTap: () async {
                                            context.pushNamed(
                                              BookingDetailsPageWidget
                                                  .routeName,
                                              queryParameters: {
                                                'bookingDetail': serializeParam(
                                                  bookingListItem,
                                                  ParamType.DataStruct,
                                                ),
                                                'bookingIndex': serializeParam(
                                                  bookingListIndex,
                                                  ParamType.int,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  }),
                                );
                              },
                            ),
                          ],
                        );
                      } else {
                        return wrapWithModel(
                          model: _model.noBookingComponentModel,
                          updateCallback: () => safeSetState(() {}),
                          child: NoBookingComponentWidget(),
                        );
                      }
                    },
                  );
                } else {
                  return Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Lottie.asset(
                      'assets/jsons/No_Wifi.json',
                      width: 120.0,
                      height: 120.0,
                      fit: BoxFit.contain,
                      animate: true,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

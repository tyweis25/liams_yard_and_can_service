import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/main_appbar/main_appbar_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'select_date_page_model.dart';
export 'select_date_page_model.dart';

class SelectDatePageWidget extends StatefulWidget {
  const SelectDatePageWidget({
    super.key,
    required this.serviceDetail,
  });

  final ServicesModelStruct? serviceDetail;

  static String routeName = 'SelectDatePage';
  static String routePath = '/selectDatePage';

  @override
  State<SelectDatePageWidget> createState() => _SelectDatePageWidgetState();
}

class _SelectDatePageWidgetState extends State<SelectDatePageWidget> {
  late SelectDatePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectDatePageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.mainAppbarModel,
                updateCallback: () => safeSetState(() {}),
                child: MainAppbarWidget(
                  title: 'Select date',
                  isBack: false,
                  isEdit: false,
                  backAction: () async {},
                  editAction: () async {},
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (FFAppState().connected) {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ListView(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                16.0,
                                0,
                                8.0,
                              ),
                              scrollDirection: Axis.vertical,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      valueOrDefault<double>(
                                        FFAppConstants.primaryPadding,
                                        0.0,
                                      ),
                                      0.0,
                                      valueOrDefault<double>(
                                        FFAppConstants.primaryPadding,
                                        0.0,
                                      ),
                                      0.0),
                                  child: Text(
                                    'Select schedule date',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'SF Pro Display',
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.all(valueOrDefault<double>(
                                    FFAppConstants.primaryPadding,
                                    0.0,
                                  )),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          valueOrDefault<double>(
                                        FFAppConstants.radius2Xl,
                                        0.0,
                                      )),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .borderColor,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: FlutterFlowCalendar(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      iconColor:
                                          FlutterFlowTheme.of(context).primary,
                                      weekFormat: true,
                                      weekStartsMonday: false,
                                      rowHeight: 48.0,
                                      onChange:
                                          (DateTimeRange? newSelectedDate) {
                                        safeSetState(() =>
                                            _model.calendarSelectedDay =
                                                newSelectedDate);
                                      },
                                      titleStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'SF Pro Display',
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            lineHeight: 1.0,
                                          ),
                                      dayOfWeekStyle:
                                          FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'SF Pro Display',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                lineHeight: 1.0,
                                              ),
                                      dateStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'SF Pro Display',
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            lineHeight: 1.0,
                                          ),
                                      selectedDateStyle:
                                          FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'SF Pro Display',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .white,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                lineHeight: 1.0,
                                              ),
                                      inactiveDateStyle:
                                          FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'SF Pro Display',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      valueOrDefault<double>(
                                        FFAppConstants.primaryPadding,
                                        0.0,
                                      ),
                                      8.0,
                                      valueOrDefault<double>(
                                        FFAppConstants.primaryPadding,
                                        0.0,
                                      ),
                                      8.0),
                                  child: Text(
                                    'Available time slots',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'SF Pro Display',
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                ),
                                Builder(
                                  builder: (context) {
                                    final availableTimeSlots = FFAppState()
                                        .availableTimeSlots
                                        .toList();

                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: List.generate(
                                          availableTimeSlots.length,
                                          (availableTimeSlotsIndex) {
                                        final availableTimeSlotsItem =
                                            availableTimeSlots[
                                                availableTimeSlotsIndex];
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      valueOrDefault<double>(
                                                        FFAppConstants
                                                            .primaryPadding,
                                                        0.0,
                                                      ),
                                                      0.0,
                                                      valueOrDefault<double>(
                                                        FFAppConstants
                                                            .primaryPadding,
                                                        0.0,
                                                      ),
                                                      0.0),
                                              child: Text(
                                                availableTimeSlotsItem.type,
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          lineHeight: 1.28,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final timeList =
                                                      availableTimeSlotsItem
                                                          .time
                                                          .toList();

                                                  return Wrap(
                                                    spacing: 0.0,
                                                    runSpacing: 0.0,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .start,
                                                    direction: Axis.horizontal,
                                                    runAlignment:
                                                        WrapAlignment.start,
                                                    verticalDirection:
                                                        VerticalDirection.down,
                                                    clipBehavior: Clip.none,
                                                    children: List.generate(
                                                        timeList.length,
                                                        (timeListIndex) {
                                                      final timeListItem =
                                                          timeList[
                                                              timeListIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if (timeListItem
                                                                    .isDone !=
                                                                true) {
                                                              _model.timeSlot =
                                                                  timeListItem
                                                                      .time;
                                                              safeSetState(
                                                                  () {});
                                                            }
                                                          },
                                                          child: Container(
                                                            width: () {
                                                              if (MediaQuery.sizeOf(
                                                                          context)
                                                                      .width <
                                                                  810.0) {
                                                                return ((MediaQuery.sizeOf(context)
                                                                            .width -
                                                                        48) *
                                                                    1 /
                                                                    2);
                                                              } else if ((MediaQuery.sizeOf(
                                                                              context)
                                                                          .width >=
                                                                      810.0) &&
                                                                  (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      1280.0)) {
                                                                return ((MediaQuery.sizeOf(context)
                                                                            .width -
                                                                        80) *
                                                                    1 /
                                                                    4);
                                                              } else if ((MediaQuery.sizeOf(
                                                                              context)
                                                                          .width >=
                                                                      1280.0) &&
                                                                  (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      2560.0)) {
                                                                return ((MediaQuery.sizeOf(context)
                                                                            .width -
                                                                        112) *
                                                                    1 /
                                                                    6);
                                                              } else {
                                                                return ((MediaQuery.sizeOf(context)
                                                                            .width -
                                                                        144) *
                                                                    1 /
                                                                    8);
                                                              }
                                                            }(),
                                                            height: 59.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: timeListItem
                                                                          .isDone ==
                                                                      true
                                                                  ? FlutterFlowTheme
                                                                          .of(
                                                                              context)
                                                                      .grey
                                                                  : (timeListItem
                                                                              .time ==
                                                                          _model
                                                                              .timeSlot
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground),
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                      valueOrDefault<
                                                                          double>(
                                                                FFAppConstants
                                                                    .radiusSm,
                                                                0.0,
                                                              )),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .borderColor,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                              child: Text(
                                                                timeListItem
                                                                    .time,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'SF Pro Display',
                                                                      color: timeListItem.isDone ==
                                                                              true
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .grey30
                                                                          : (timeListItem.time == _model.timeSlot
                                                                              ? FlutterFlowTheme.of(context).white
                                                                              : FlutterFlowTheme.of(context).grey30WhiteColor),
                                                                      fontSize:
                                                                          17.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      lineHeight:
                                                                          1.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  );
                                                },
                                              ),
                                            ),
                                          ]
                                              .divide(SizedBox(height: 8.0))
                                              .addToStart(
                                                  SizedBox(height: 8.0)),
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                valueOrDefault<double>(
                                  FFAppConstants.primaryPadding,
                                  0.0,
                                ),
                                6.0,
                                valueOrDefault<double>(
                                  FFAppConstants.primaryPadding,
                                  0.0,
                                ),
                                24.0),
                            child: FFButtonWidget(
                              onPressed: (_model.timeSlot == null ||
                                      _model.timeSlot == '')
                                  ? null
                                  : () async {
                                      if (_model.timeSlot != null &&
                                          _model.timeSlot != '') {
                                        FFAppState().homePageIndex = 2;
                                        FFAppState().cartDetail =
                                            CartModelStruct(
                                          id: 1,
                                          serviceDetail: widget.serviceDetail,
                                          bookingDate: dateTimeFormat(
                                              "yMMMd",
                                              _model
                                                  .calendarSelectedDay?.start),
                                          bookingTime: _model.timeSlot,
                                        );
                                        FFAppState().update(() {});

                                        context.goNamed(
                                            HomeMainPageWidget.routeName);
                                      } else {
                                        await action_blocks.mainSnackbar(
                                          context,
                                          title: 'Please select time',
                                        );
                                        safeSetState(() {});
                                      }
                                    },
                              text: 'Continue',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 56.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'SF Pro Display',
                                      color: FlutterFlowTheme.of(context).white,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      lineHeight: 1.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(12.0),
                                disabledColor:
                                    FlutterFlowTheme.of(context).grey,
                                disabledTextColor:
                                    FlutterFlowTheme.of(context).grey30,
                              ),
                            ),
                          ),
                        ],
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
        ),
      ),
    );
  }
}

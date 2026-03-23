import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/main_component/main_component_widget.dart';
import '/pages/components/review_component/review_component_widget.dart';
import '/pages/components/row_title_componant/row_title_componant_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'services_details_model.dart';
export 'services_details_model.dart';

class ServicesDetailsWidget extends StatefulWidget {
  const ServicesDetailsWidget({
    super.key,
    required this.serviceDetail,
  });

  final ServicesModelStruct? serviceDetail;

  static String routeName = 'ServicesDetails';
  static String routePath = '/servicesDetails';

  @override
  State<ServicesDetailsWidget> createState() => _ServicesDetailsWidgetState();
}

class _ServicesDetailsWidgetState extends State<ServicesDetailsWidget> {
  late ServicesDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ServicesDetailsModel());

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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    valueOrDefault<double>(
                      FFAppConstants.primaryPadding,
                      0.0,
                    ),
                    11.0,
                    valueOrDefault<double>(
                      FFAppConstants.primaryPadding,
                      0.0,
                    ),
                    12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.safePop();
                      },
                      child: SafeArea(
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).grey,
                            shape: BoxShape.circle,
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            FFIcons.karrowLeftGl,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Service details',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'SF Pro Display',
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              lineHeight: 1.2,
                            ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await action_blocks.addAndRemoveFavourite(
                          context,
                          isAvilable: FFAppState()
                              .favouriteList
                              .where((e) => e.id == widget.serviceDetail?.id)
                              .toList()
                              .isNotEmpty,
                          product: widget.serviceDetail,
                        );
                        safeSetState(() {});
                      },
                      child: SafeArea(
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).grey,
                            shape: BoxShape.circle,
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              if (FFAppState()
                                  .favouriteList
                                  .where(
                                      (e) => e.id == widget.serviceDetail?.id)
                                  .toList()
                                  .isNotEmpty) {
                                return Icon(
                                  FFIcons.kfavFillGl,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 20.0,
                                );
                              } else {
                                return Icon(
                                  FFIcons.kfavouritePrimaryGl,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 20.0,
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 4.0)),
                ),
              ),
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
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
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
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(valueOrDefault<double>(
                            FFAppConstants.radius2Xl,
                            0.0,
                          )),
                          child: CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 500),
                            fadeOutDuration: Duration(milliseconds: 500),
                            imageUrl: widget.serviceDetail!.image,
                            width: () {
                              if (MediaQuery.sizeOf(context).width < 810.0) {
                                return double.infinity;
                              } else if ((MediaQuery.sizeOf(context).width >=
                                      810.0) &&
                                  (MediaQuery.sizeOf(context).width < 1280.0)) {
                                return 750.0;
                              } else if ((MediaQuery.sizeOf(context).width >=
                                      1280.0) &&
                                  (MediaQuery.sizeOf(context).width < 2560.0)) {
                                return 810.0;
                              } else {
                                return 810.0;
                              }
                            }(),
                            height: () {
                              if (MediaQuery.sizeOf(context).width < 810.0) {
                                return 240.0;
                              } else if ((MediaQuery.sizeOf(context).width >=
                                      810.0) &&
                                  (MediaQuery.sizeOf(context).width < 1280.0)) {
                                return 260.0;
                              } else if ((MediaQuery.sizeOf(context).width >=
                                      1280.0) &&
                                  (MediaQuery.sizeOf(context).width < 2560.0)) {
                                return 280.0;
                              } else {
                                return 280.0;
                              }
                            }(),
                            fit: BoxFit.cover,
                            errorWidget: (context, error, stackTrace) =>
                                Image.asset(
                              'assets/images/error_image.png',
                              width: () {
                                if (MediaQuery.sizeOf(context).width < 810.0) {
                                  return double.infinity;
                                } else if ((MediaQuery.sizeOf(context).width >=
                                        810.0) &&
                                    (MediaQuery.sizeOf(context).width <
                                        1280.0)) {
                                  return 750.0;
                                } else if ((MediaQuery.sizeOf(context).width >=
                                        1280.0) &&
                                    (MediaQuery.sizeOf(context).width <
                                        2560.0)) {
                                  return 810.0;
                                } else {
                                  return 810.0;
                                }
                              }(),
                              height: () {
                                if (MediaQuery.sizeOf(context).width < 810.0) {
                                  return 240.0;
                                } else if ((MediaQuery.sizeOf(context).width >=
                                        810.0) &&
                                    (MediaQuery.sizeOf(context).width <
                                        1280.0)) {
                                  return 260.0;
                                } else if ((MediaQuery.sizeOf(context).width >=
                                        1280.0) &&
                                    (MediaQuery.sizeOf(context).width <
                                        2560.0)) {
                                  return 280.0;
                                } else {
                                  return 280.0;
                                }
                              }(),
                              fit: BoxFit.cover,
                            ),
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
                          16.0,
                          valueOrDefault<double>(
                            FFAppConstants.primaryPadding,
                            0.0,
                          ),
                          6.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              valueOrDefault<String>(
                                widget.serviceDetail?.name,
                                'Name',
                              ),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    lineHeight: 1.2,
                                  ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).bgBorderColor,
                              borderRadius: BorderRadius.circular(26.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).borderColor,
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 6.0, 10.0, 6.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Icon(
                                      FFIcons.kclockPrimaryGl,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 18.0,
                                    ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      widget.serviceDetail?.duration,
                                      'Duration',
                                    ),
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'SF Pro Display',
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          lineHeight: 1.33,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 6.0)),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 4.0)),
                      ),
                    ),
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
                          6.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: SvgPicture.asset(
                              'assets/images/start_yellow_gl.svg',
                              width: 18.0,
                              height: 18.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              valueOrDefault<String>(
                                widget.serviceDetail?.reviews,
                                'Review',
                              ),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'SF Pro Display',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    lineHeight: 1.33,
                                  ),
                            ),
                          ),
                        ].divide(SizedBox(width: 2.0)),
                      ),
                    ),
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
                          16.0),
                      child: Text(
                        '${FFAppState().currencyType}${widget.serviceDetail?.price}',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'SF Pro Display',
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              lineHeight: 1.28,
                            ),
                      ),
                    ),
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
                          8.0),
                      child: Text(
                        'About this service',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'SF Pro Display',
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              lineHeight: 1.28,
                            ),
                      ),
                    ),
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
                          16.0),
                      child: custom_widgets.ReadMoreTextWidget(
                        width: double.infinity,
                        height: 80.0,
                        text: valueOrDefault<String>(
                          widget.serviceDetail?.description,
                          'Description',
                        ),
                      ),
                    ),
                    if (FFAppState()
                        .reviewAllList
                        .where(
                            (e) => e.serviceName == widget.serviceDetail?.name)
                        .toList()
                        .isNotEmpty)
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                            child: wrapWithModel(
                              model: _model.rowTitleComponantModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: RowTitleComponantWidget(
                                title: 'Our reviews',
                                isView: true,
                                viewAllAction: () async {
                                  context.pushNamed(
                                    ReviewsPageWidget.routeName,
                                    queryParameters: {
                                      'reviewList': serializeParam(
                                        FFAppState()
                                            .reviewAllList
                                            .where((e) =>
                                                e.serviceName ==
                                                widget.serviceDetail?.name)
                                            .toList(),
                                        ParamType.DataStruct,
                                        isList: true,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                              ),
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              final serviceRelatedReviewLiost = FFAppState()
                                  .reviewAllList
                                  .where((e) =>
                                      e.serviceName ==
                                      widget.serviceDetail?.name)
                                  .toList()
                                  .take(3)
                                  .toList();

                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(
                                          serviceRelatedReviewLiost.length,
                                          (serviceRelatedReviewLiostIndex) {
                                    final serviceRelatedReviewLiostItem =
                                        serviceRelatedReviewLiost[
                                            serviceRelatedReviewLiostIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 8.0),
                                      child: wrapWithModel(
                                        model: _model.reviewComponentModels
                                            .getModel(
                                          serviceRelatedReviewLiostIndex
                                              .toString(),
                                          serviceRelatedReviewLiostIndex,
                                        ),
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: ReviewComponentWidget(
                                          key: Key(
                                            'Key2pg_${serviceRelatedReviewLiostIndex.toString()}',
                                          ),
                                          image: serviceRelatedReviewLiostItem
                                              .image,
                                          name: serviceRelatedReviewLiostItem
                                              .name,
                                          description:
                                              serviceRelatedReviewLiostItem
                                                  .description,
                                          review: serviceRelatedReviewLiostItem
                                              .review,
                                          width: 350.0,
                                        ),
                                      ),
                                    );
                                  })
                                      .divide(SizedBox(width: 16.0))
                                      .addToStart(SizedBox(
                                          width: FFAppConstants.primaryPadding))
                                      .addToEnd(SizedBox(
                                          width:
                                              FFAppConstants.primaryPadding)),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          wrapWithModel(
                            model: _model.rowTitleComponantModel2,
                            updateCallback: () => safeSetState(() {}),
                            child: RowTitleComponantWidget(
                              title: 'Suggested service',
                              isView: true,
                              viewAllAction: () async {
                                context.pushNamed(
                                    SuggestedservicePageWidget.routeName);
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final popularServiceHomeList = FFAppState()
                                    .allServicesList
                                    .where((e) => e.popularServices == true)
                                    .toList()
                                    .take(() {
                                  if (MediaQuery.sizeOf(context).width <
                                      810.0) {
                                    return 2;
                                  } else if ((MediaQuery.sizeOf(context)
                                              .width >=
                                          810.0) &&
                                      (MediaQuery.sizeOf(context).width <
                                          1280.0)) {
                                    return 4;
                                  } else if ((MediaQuery.sizeOf(context)
                                              .width >=
                                          1280.0) &&
                                      (MediaQuery.sizeOf(context).width <
                                          2560.0)) {
                                    return 6;
                                  } else {
                                    return 8;
                                  }
                                }()).toList();

                                return Wrap(
                                  spacing: 0.0,
                                  runSpacing: 0.0,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: List.generate(
                                      popularServiceHomeList.length,
                                      (popularServiceHomeListIndex) {
                                    final popularServiceHomeListItem =
                                        popularServiceHomeList[
                                            popularServiceHomeListIndex];
                                    return Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: wrapWithModel(
                                        model:
                                            _model.mainComponentModels.getModel(
                                          popularServiceHomeListIndex
                                              .toString(),
                                          popularServiceHomeListIndex,
                                        ),
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: MainComponentWidget(
                                          key: Key(
                                            'Key870_${popularServiceHomeListIndex.toString()}',
                                          ),
                                          image:
                                              popularServiceHomeListItem.image,
                                          name: popularServiceHomeListItem.name,
                                          isLike: FFAppState()
                                              .favouriteList
                                              .where((e) =>
                                                  e.id ==
                                                  popularServiceHomeListItem.id)
                                              .toList()
                                              .isNotEmpty,
                                          width: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                810.0) {
                                              return ((MediaQuery.sizeOf(
                                                              context)
                                                          .width -
                                                      48) *
                                                  1 /
                                                  2);
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
                                                      80) *
                                                  1 /
                                                  4);
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
                                                      112) *
                                                  1 /
                                                  6);
                                            } else {
                                              return ((MediaQuery.sizeOf(
                                                              context)
                                                          .width -
                                                      144) *
                                                  1 /
                                                  8);
                                            }
                                          }(),
                                          review: popularServiceHomeListItem
                                              .reviews,
                                          price:
                                              popularServiceHomeListItem.price,
                                          duration: popularServiceHomeListItem
                                              .duration,
                                          catName: popularServiceHomeListItem
                                              .categoriesName,
                                          isMainTap: () async {
                                            context.pushNamed(
                                              ServicesDetailsWidget.routeName,
                                              queryParameters: {
                                                'serviceDetail': serializeParam(
                                                  popularServiceHomeListItem,
                                                  ParamType.DataStruct,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          likeAction: () async {
                                            await action_blocks
                                                .addAndRemoveFavourite(
                                              context,
                                              isAvilable: FFAppState()
                                                  .favouriteList
                                                  .where((e) =>
                                                      e.id ==
                                                      popularServiceHomeListItem
                                                          .id)
                                                  .toList()
                                                  .isNotEmpty,
                                              product:
                                                  popularServiceHomeListItem,
                                            );
                                            safeSetState(() {});
                                          },
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
                            .addToStart(SizedBox(height: 8.0)),
                      ),
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
                  onPressed: () async {
                    if (FFAppState().isLoginQA) {
                      FFAppState()
                          .addToRecentlyViewedListQA(widget.serviceDetail!);
                      FFAppState().update(() {});

                      context.pushNamed(
                        SelectDatePageWidget.routeName,
                        queryParameters: {
                          'serviceDetail': serializeParam(
                            widget.serviceDetail,
                            ParamType.DataStruct,
                          ),
                        }.withoutNulls,
                      );
                    } else {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Please login first',
                            style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              fontSize: 17.0,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          duration: Duration(milliseconds: 2000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).primaryText,
                          action: SnackBarAction(
                            label: 'Log in',
                            textColor: FlutterFlowTheme.of(context).primaryText,
                            onPressed: () async {
                              context.pushNamed(
                                SignInPageWidget.routeName,
                                queryParameters: {
                                  'isInner': serializeParam(
                                    true,
                                    ParamType.bool,
                                  ),
                                }.withoutNulls,
                              );
                            },
                          ),
                        ),
                      );
                    }
                  },
                  text: 'Book your service',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 56.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'SF Pro Display',
                          color: FlutterFlowTheme.of(context).white,
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          lineHeight: 1.0,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

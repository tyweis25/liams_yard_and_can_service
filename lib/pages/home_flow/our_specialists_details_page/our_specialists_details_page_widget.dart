import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/main_appbar/main_appbar_widget.dart';
import '/pages/components/main_component/main_component_widget.dart';
import '/pages/components/row_title_componant/row_title_componant_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'our_specialists_details_page_model.dart';
export 'our_specialists_details_page_model.dart';

class OurSpecialistsDetailsPageWidget extends StatefulWidget {
  const OurSpecialistsDetailsPageWidget({
    super.key,
    required this.staffDetail,
  });

  final StaffMemberModelStruct? staffDetail;

  static String routeName = 'OurSpecialistsDetailsPage';
  static String routePath = '/ourSpecialistsDetailsPage';

  @override
  State<OurSpecialistsDetailsPageWidget> createState() =>
      _OurSpecialistsDetailsPageWidgetState();
}

class _OurSpecialistsDetailsPageWidgetState
    extends State<OurSpecialistsDetailsPageWidget> {
  late OurSpecialistsDetailsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OurSpecialistsDetailsPageModel());

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
                  title: 'Specialist profile',
                  isBack: false,
                  isEdit: false,
                  backAction: () async {},
                  editAction: () async {},
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
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100.0),
                                child: CachedNetworkImage(
                                  fadeInDuration: Duration(milliseconds: 200),
                                  fadeOutDuration: Duration(milliseconds: 200),
                                  imageUrl: widget.staffDetail!.image,
                                  width: 112.0,
                                  height: 112.0,
                                  fit: BoxFit.cover,
                                  errorWidget: (context, error, stackTrace) =>
                                      Image.asset(
                                    'assets/images/error_image.png',
                                    width: 112.0,
                                    height: 112.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 6.0),
                                child: AutoSizeText(
                                  valueOrDefault<String>(
                                    widget.staffDetail?.title,
                                    'Name',
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
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
                              Text(
                                '${widget.staffDetail?.catName} specialist',
                                textAlign: TextAlign.start,
                                maxLines: 1,
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
                            ],
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
                          0.0,
                          valueOrDefault<double>(
                            FFAppConstants.primaryPadding,
                            0.0,
                          ),
                          0.0),
                      child: Text(
                        'About us',
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
                          8.0,
                          valueOrDefault<double>(
                            FFAppConstants.primaryPadding,
                            0.0,
                          ),
                          24.0),
                      child: Text(
                        'At our nutrition clinic, we believe women deserve care that is as unique as their individual journeys Led by our specialist female nutritionist, we focus on the best understanding  women’s specific health needs from hormonal balance and weight management to best prenatal, postnatal, and overall wellness Every fits consultation is designed to listen, guide, and create a personalized nutrition.',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'SF Pro Display',
                              fontSize: 17.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                              lineHeight: 1.29,
                            ),
                      ),
                    ),
                    if (FFAppState()
                        .allServicesList
                        .where((e) =>
                            e.categoriesName == widget.staffDetail?.catName)
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
                              model: _model.rowTitleComponantModel,
                              updateCallback: () => safeSetState(() {}),
                              child: RowTitleComponantWidget(
                                title: 'Best service for you',
                                isView: true,
                                viewAllAction: () async {
                                  context.pushNamed(
                                    ReletedServicesPageWidget.routeName,
                                    queryParameters: {
                                      'serviceRelatedList': serializeParam(
                                        FFAppState()
                                            .allServicesList
                                            .where((e) =>
                                                e.categoriesName ==
                                                widget.staffDetail?.catName)
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final relatedServiceList = FFAppState()
                                    .allServicesList
                                    .where((e) =>
                                        e.categoriesName ==
                                        widget.staffDetail?.catName)
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
                                  children:
                                      List.generate(relatedServiceList.length,
                                          (relatedServiceListIndex) {
                                    final relatedServiceListItem =
                                        relatedServiceList[
                                            relatedServiceListIndex];
                                    return Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: wrapWithModel(
                                        model:
                                            _model.mainComponentModels.getModel(
                                          relatedServiceListIndex.toString(),
                                          relatedServiceListIndex,
                                        ),
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: MainComponentWidget(
                                          key: Key(
                                            'Key0d8_${relatedServiceListIndex.toString()}',
                                          ),
                                          image: relatedServiceListItem.image,
                                          name: relatedServiceListItem.name,
                                          isLike: FFAppState()
                                              .favouriteList
                                              .where((e) =>
                                                  e.id ==
                                                  relatedServiceListItem.id)
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
                                          review:
                                              relatedServiceListItem.reviews,
                                          price: relatedServiceListItem.price,
                                          duration:
                                              relatedServiceListItem.duration,
                                          catName: relatedServiceListItem
                                              .categoriesName,
                                          isMainTap: () async {
                                            context.pushNamed(
                                              ServicesDetailsWidget.routeName,
                                              queryParameters: {
                                                'serviceDetail': serializeParam(
                                                  relatedServiceListItem,
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
                                                      relatedServiceListItem.id)
                                                  .toList()
                                                  .isNotEmpty,
                                              product: relatedServiceListItem,
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
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

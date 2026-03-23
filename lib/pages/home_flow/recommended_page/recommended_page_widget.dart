import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/main_appbar/main_appbar_widget.dart';
import '/pages/components/main_component/main_component_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'recommended_page_model.dart';
export 'recommended_page_model.dart';

class RecommendedPageWidget extends StatefulWidget {
  const RecommendedPageWidget({super.key});

  static String routeName = 'RecommendedPage';
  static String routePath = '/recommendedPage';

  @override
  State<RecommendedPageWidget> createState() => _RecommendedPageWidgetState();
}

class _RecommendedPageWidgetState extends State<RecommendedPageWidget> {
  late RecommendedPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecommendedPageModel());

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
                  title: 'Recommended for you',
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
                      return ListView(
                        padding: EdgeInsets.fromLTRB(
                          0,
                          8.0,
                          0,
                          8.0,
                        ),
                        scrollDirection: Axis.vertical,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final recommendedServicesList = FFAppState()
                                    .allServicesList
                                    .where((e) => e.popularServices == true)
                                    .toList();

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
                                      recommendedServicesList.length,
                                      (recommendedServicesListIndex) {
                                    final recommendedServicesListItem =
                                        recommendedServicesList[
                                            recommendedServicesListIndex];
                                    return Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: wrapWithModel(
                                        model:
                                            _model.mainComponentModels.getModel(
                                          recommendedServicesListIndex
                                              .toString(),
                                          recommendedServicesListIndex,
                                        ),
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: MainComponentWidget(
                                          key: Key(
                                            'Keyd8q_${recommendedServicesListIndex.toString()}',
                                          ),
                                          image:
                                              recommendedServicesListItem.image,
                                          name:
                                              recommendedServicesListItem.name,
                                          isLike: FFAppState()
                                              .favouriteList
                                              .where((e) =>
                                                  e.id ==
                                                  recommendedServicesListItem
                                                      .id)
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
                                          review: recommendedServicesListItem
                                              .reviews,
                                          price:
                                              recommendedServicesListItem.price,
                                          duration: recommendedServicesListItem
                                              .duration,
                                          catName: recommendedServicesListItem
                                              .categoriesName,
                                          isMainTap: () async {
                                            context.pushNamed(
                                              ServicesDetailsWidget.routeName,
                                              queryParameters: {
                                                'serviceDetail': serializeParam(
                                                  recommendedServicesListItem,
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
                                                      recommendedServicesListItem
                                                          .id)
                                                  .toList()
                                                  .isNotEmpty,
                                              product:
                                                  recommendedServicesListItem,
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

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/main_appbar/main_appbar_widget.dart';
import '/pages/components/main_row_component/main_row_component_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'recently_viewed_page_model.dart';
export 'recently_viewed_page_model.dart';

class RecentlyViewedPageWidget extends StatefulWidget {
  const RecentlyViewedPageWidget({super.key});

  static String routeName = 'RecentlyViewedPage';
  static String routePath = '/recentlyViewedPage';

  @override
  State<RecentlyViewedPageWidget> createState() =>
      _RecentlyViewedPageWidgetState();
}

class _RecentlyViewedPageWidgetState extends State<RecentlyViewedPageWidget> {
  late RecentlyViewedPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecentlyViewedPageModel());

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
                  title: 'Recently viewed',
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
                    8.0,
                    0,
                    8.0,
                  ),
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final recentlyviewedAllList =
                              FFAppState().recentlyViewedListQA.toList();

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
                                List.generate(recentlyviewedAllList.length,
                                    (recentlyviewedAllListIndex) {
                              final recentlyviewedAllListItem =
                                  recentlyviewedAllList[
                                      recentlyviewedAllListIndex];
                              return Padding(
                                padding: EdgeInsets.all(8.0),
                                child: wrapWithModel(
                                  model: _model.mainRowComponentModels.getModel(
                                    recentlyviewedAllListIndex.toString(),
                                    recentlyviewedAllListIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  child: MainRowComponentWidget(
                                    key: Key(
                                      'Keyabq_${recentlyviewedAllListIndex.toString()}',
                                    ),
                                    image: recentlyviewedAllListItem.image,
                                    name: recentlyviewedAllListItem.name,
                                    isLike: FFAppState()
                                        .favouriteList
                                        .where((e) =>
                                            e.id ==
                                            recentlyviewedAllListItem.id)
                                        .toList()
                                        .isNotEmpty,
                                    width: () {
                                      if (MediaQuery.sizeOf(context).width <
                                          810.0) {
                                        return double.infinity;
                                      } else if ((MediaQuery.sizeOf(context)
                                                  .width >=
                                              810.0) &&
                                          (MediaQuery.sizeOf(context).width <
                                              1280.0)) {
                                        return ((MediaQuery.sizeOf(context)
                                                    .width -
                                                48) *
                                            1 /
                                            2);
                                      } else if ((MediaQuery.sizeOf(context)
                                                  .width >=
                                              1280.0) &&
                                          (MediaQuery.sizeOf(context).width <
                                              2560.0)) {
                                        return ((MediaQuery.sizeOf(context)
                                                    .width -
                                                80) *
                                            1 /
                                            4);
                                      } else {
                                        return ((MediaQuery.sizeOf(context)
                                                    .width -
                                                112) *
                                            1 /
                                            6);
                                      }
                                    }(),
                                    review: recentlyviewedAllListItem.reviews,
                                    price: recentlyviewedAllListItem.price,
                                    duration:
                                        recentlyviewedAllListItem.duration,
                                    catName: recentlyviewedAllListItem
                                        .categoriesName,
                                    isMainTap: () async {
                                      context.pushNamed(
                                        ServicesDetailsWidget.routeName,
                                        queryParameters: {
                                          'serviceDetail': serializeParam(
                                            recentlyviewedAllListItem,
                                            ParamType.DataStruct,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    likeAction: () async {
                                      await action_blocks.addAndRemoveFavourite(
                                        context,
                                        isAvilable: FFAppState()
                                            .favouriteList
                                            .where((e) =>
                                                e.id ==
                                                recentlyviewedAllListItem.id)
                                            .toList()
                                            .isNotEmpty,
                                        product: recentlyviewedAllListItem,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

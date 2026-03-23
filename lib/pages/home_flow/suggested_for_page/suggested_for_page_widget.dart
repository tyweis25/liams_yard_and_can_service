import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/main_appbar/main_appbar_widget.dart';
import '/pages/components/main_row_component/main_row_component_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'suggested_for_page_model.dart';
export 'suggested_for_page_model.dart';

class SuggestedForPageWidget extends StatefulWidget {
  const SuggestedForPageWidget({super.key});

  static String routeName = 'SuggestedForPage';
  static String routePath = '/suggestedForPage';

  @override
  State<SuggestedForPageWidget> createState() => _SuggestedForPageWidgetState();
}

class _SuggestedForPageWidgetState extends State<SuggestedForPageWidget> {
  late SuggestedForPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SuggestedForPageModel());

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
                  title: 'Suggested for you',
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
                          final suggestedAllList = FFAppState()
                              .allServicesList
                              .where((e) => e.suggestedService == true)
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
                            children: List.generate(suggestedAllList.length,
                                (suggestedAllListIndex) {
                              final suggestedAllListItem =
                                  suggestedAllList[suggestedAllListIndex];
                              return Padding(
                                padding: EdgeInsets.all(8.0),
                                child: wrapWithModel(
                                  model: _model.mainRowComponentModels.getModel(
                                    suggestedAllListIndex.toString(),
                                    suggestedAllListIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  child: MainRowComponentWidget(
                                    key: Key(
                                      'Keyam9_${suggestedAllListIndex.toString()}',
                                    ),
                                    image: suggestedAllListItem.image,
                                    name: suggestedAllListItem.name,
                                    isLike: FFAppState()
                                        .favouriteList
                                        .where((e) =>
                                            e.id == suggestedAllListItem.id)
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
                                    review: suggestedAllListItem.reviews,
                                    price: suggestedAllListItem.price,
                                    duration: suggestedAllListItem.duration,
                                    catName:
                                        suggestedAllListItem.categoriesName,
                                    isMainTap: () async {
                                      context.pushNamed(
                                        ServicesDetailsWidget.routeName,
                                        queryParameters: {
                                          'serviceDetail': serializeParam(
                                            suggestedAllListItem,
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
                                                e.id == suggestedAllListItem.id)
                                            .toList()
                                            .isNotEmpty,
                                        product: suggestedAllListItem,
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

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/main_appbar/main_appbar_widget.dart';
import '/pages/components/main_component/main_component_widget.dart';
import '/pages/empty_components/no_favourite_component/no_favourite_component_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'favorites_page_model.dart';
export 'favorites_page_model.dart';

class FavoritesPageWidget extends StatefulWidget {
  const FavoritesPageWidget({super.key});

  static String routeName = 'FavoritesPage';
  static String routePath = '/favoritesPage';

  @override
  State<FavoritesPageWidget> createState() => _FavoritesPageWidgetState();
}

class _FavoritesPageWidgetState extends State<FavoritesPageWidget> {
  late FavoritesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoritesPageModel());

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
                  title: 'Favourite',
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
                      return Builder(
                        builder: (context) {
                          if (FFAppState().favouriteList.isNotEmpty) {
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
                                      final favList =
                                          FFAppState().favouriteList.toList();

                                      return Wrap(
                                        spacing: 0.0,
                                        runSpacing: 0.0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: List.generate(favList.length,
                                            (favListIndex) {
                                          final favListItem =
                                              favList[favListIndex];
                                          return Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: wrapWithModel(
                                              model: _model.mainComponentModels
                                                  .getModel(
                                                favListIndex.toString(),
                                                favListIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: MainComponentWidget(
                                                key: Key(
                                                  'Keyxha_${favListIndex.toString()}',
                                                ),
                                                image: favListItem.image,
                                                name: favListItem.name,
                                                isLike: true,
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
                                                      (MediaQuery.sizeOf(
                                                                  context)
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
                                                      (MediaQuery.sizeOf(
                                                                  context)
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
                                                review: favListItem.reviews,
                                                price: favListItem.price,
                                                duration: favListItem.duration,
                                                catName:
                                                    favListItem.categoriesName,
                                                isMainTap: () async {
                                                  context.pushNamed(
                                                    ServicesDetailsWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'serviceDetail':
                                                          serializeParam(
                                                        favListItem,
                                                        ParamType.DataStruct,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                likeAction: () async {
                                                  FFAppState()
                                                      .removeAtIndexFromFavouriteList(
                                                          favListIndex);
                                                  FFAppState().update(() {});
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
                            return wrapWithModel(
                              model: _model.noFavouriteComponentModel,
                              updateCallback: () => safeSetState(() {}),
                              child: NoFavouriteComponentWidget(),
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
        ),
      ),
    );
  }
}

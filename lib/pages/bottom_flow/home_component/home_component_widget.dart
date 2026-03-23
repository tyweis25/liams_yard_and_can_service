import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/category_component/category_component_widget.dart';
import '/pages/components/main_component/main_component_widget.dart';
import '/pages/components/main_row_component/main_row_component_widget.dart';
import '/pages/components/row_title_componant/row_title_componant_widget.dart';
import '/pages/components/staff_member_common_component/staff_member_common_component_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'home_component_model.dart';
export 'home_component_model.dart';

class HomeComponentWidget extends StatefulWidget {
  const HomeComponentWidget({super.key});

  @override
  State<HomeComponentWidget> createState() => _HomeComponentWidgetState();
}

class _HomeComponentWidgetState extends State<HomeComponentWidget> {
  late HomeComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeComponentModel());

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

    return Builder(
      builder: (context) {
        if (FFAppState().connected) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
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
                    8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello,',
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  lineHeight: 1.28,
                                ),
                          ),
                          if (FFAppState().isLoginQA)
                            RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        '${FFAppState().userDetailQA.firstName} ${FFAppState().userDetailQA.lastName}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'SF Pro Display',
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          lineHeight: 1.21,
                                        ),
                                  ),
                                  TextSpan(
                                    text: ' 👋',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'SF Pro Display',
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          lineHeight: 1.5,
                                        ),
                                  )
                                ],
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
                              textAlign: TextAlign.start,
                              maxLines: 1,
                            ),
                        ].divide(SizedBox(height: 4.0)),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(NotificationPageWidget.routeName);
                      },
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).grey,
                          shape: BoxShape.circle,
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Icon(
                          FFIcons.knotificationBlackBorderGl,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 12.0)),
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
                    4.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(SearchPageWidget.routeName);
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(valueOrDefault<double>(
                        FFAppConstants.radiusXl,
                        0.0,
                      )),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).borderColor,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(),
                            child: Icon(
                              FFIcons.ksearchBlackGl,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Search here',
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'SF Pro Display',
                                    color: FlutterFlowTheme.of(context).grey40,
                                    fontSize: 17.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    lineHeight: 1.29,
                                  ),
                            ),
                          ),
                        ].divide(SizedBox(width: 16.0)),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (FFAppState().connected) {
                      return ListView(
                        padding: EdgeInsets.fromLTRB(
                          0,
                          16.0,
                          0,
                          12.0,
                        ),
                        scrollDirection: Axis.vertical,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                            child: Builder(
                              builder: (context) {
                                final bannerList =
                                    FFAppState().bannerList.toList();

                                return Container(
                                  width: double.infinity,
                                  height: () {
                                    if (MediaQuery.sizeOf(context).width <
                                        810.0) {
                                      return 155.0;
                                    } else if ((MediaQuery.sizeOf(context)
                                                .width >=
                                            810.0) &&
                                        (MediaQuery.sizeOf(context).width <
                                            1280.0)) {
                                      return 230.0;
                                    } else if ((MediaQuery.sizeOf(context)
                                                .width >=
                                            1280.0) &&
                                        (MediaQuery.sizeOf(context).width <
                                            2560.0)) {
                                      return 345.0;
                                    } else {
                                      return 345.0;
                                    }
                                  }(),
                                  child: CarouselSlider.builder(
                                    itemCount: bannerList.length,
                                    itemBuilder: (context, bannerListIndex, _) {
                                      final bannerListItem =
                                          bannerList[bannerListIndex];
                                      return Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: CachedNetworkImageProvider(
                                              bannerListItem.image,
                                            ),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              valueOrDefault<double>(
                                            FFAppConstants.radius2Xl,
                                            0.0,
                                          )),
                                        ),
                                      );
                                    },
                                    carouselController:
                                        _model.carouselController1 ??=
                                            CarouselSliderController(),
                                    options: CarouselOptions(
                                      initialPage:
                                          max(0, min(1, bannerList.length - 1)),
                                      viewportFraction: () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return 0.9;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointMedium) {
                                          return 0.8;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return 0.65;
                                        } else {
                                          return 0.55;
                                        }
                                      }(),
                                      disableCenter: false,
                                      enlargeCenterPage: true,
                                      enlargeFactor: 0.25,
                                      enableInfiniteScroll: false,
                                      scrollDirection: Axis.horizontal,
                                      autoPlay: true,
                                      autoPlayAnimationDuration:
                                          Duration(milliseconds: 800),
                                      autoPlayInterval:
                                          Duration(milliseconds: (800 + 4000)),
                                      autoPlayCurve: Curves.linear,
                                      pauseAutoPlayInFiniteScroll: true,
                                      onPageChanged: (index, _) async {
                                        _model.carouselCurrentIndex1 = index;

                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                wrapWithModel(
                                  model: _model.rowTitleComponantModel1,
                                  updateCallback: () => safeSetState(() {}),
                                  child: RowTitleComponantWidget(
                                    title: 'Categories',
                                    isView: true,
                                    viewAllAction: () async {
                                      FFAppState().homePageIndex = 1;
                                      FFAppState().update(() {});
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final categoriesList =
                                          FFAppState().categoriesList.take(() {
                                        if (MediaQuery.sizeOf(context).width <
                                            810.0) {
                                          return 3;
                                        } else if ((MediaQuery.sizeOf(context)
                                                    .width >=
                                                810.0) &&
                                            (MediaQuery.sizeOf(context).width <
                                                1280.0)) {
                                          return 6;
                                        } else if ((MediaQuery.sizeOf(context)
                                                    .width >=
                                                1280.0) &&
                                            (MediaQuery.sizeOf(context).width <
                                                2560.0)) {
                                          return 9;
                                        } else {
                                          return 12;
                                        }
                                      }()).toList();

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
                                        children:
                                            List.generate(categoriesList.length,
                                                (categoriesListIndex) {
                                          final categoriesListItem =
                                              categoriesList[
                                                  categoriesListIndex];
                                          return Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: wrapWithModel(
                                              model: _model
                                                  .categoryComponentModels
                                                  .getModel(
                                                categoriesListIndex.toString(),
                                                categoriesListIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: CategoryComponentWidget(
                                                key: Key(
                                                  'Keygn3_${categoriesListIndex.toString()}',
                                                ),
                                                image: categoriesListItem.image,
                                                name: categoriesListItem.name,
                                                width: () {
                                                  if (MediaQuery.sizeOf(context)
                                                          .width <
                                                      810.0) {
                                                    return ((MediaQuery.sizeOf(
                                                                    context)
                                                                .width -
                                                            64) *
                                                        1 /
                                                        3);
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
                                                            112) *
                                                        1 /
                                                        6);
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
                                                            160) *
                                                        1 /
                                                        9);
                                                  } else {
                                                    return ((MediaQuery.sizeOf(
                                                                    context)
                                                                .width -
                                                            208) *
                                                        1 /
                                                        12);
                                                  }
                                                }(),
                                                onTap: () async {
                                                  context.pushNamed(
                                                    CatRelatedPageWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'title': serializeParam(
                                                        categoriesListItem.name,
                                                        ParamType.String,
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
                                ),
                              ]
                                  .divide(SizedBox(height: 8.0))
                                  .addToStart(SizedBox(height: 8.0)),
                            ),
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
                                    title: 'Trending service',
                                    isView: true,
                                    viewAllAction: () async {
                                      context.pushNamed(
                                          TrendingServicePageWidget.routeName);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final popularServiceHomeList =
                                          FFAppState()
                                              .allServicesList
                                              .where((e) =>
                                                  e.trendingServices == true)
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
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
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
                                              model: _model.mainComponentModels1
                                                  .getModel(
                                                popularServiceHomeListIndex
                                                    .toString(),
                                                popularServiceHomeListIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: MainComponentWidget(
                                                key: Key(
                                                  'Keyrj3_${popularServiceHomeListIndex.toString()}',
                                                ),
                                                image:
                                                    popularServiceHomeListItem
                                                        .image,
                                                name: popularServiceHomeListItem
                                                    .name,
                                                isLike: FFAppState()
                                                    .favouriteList
                                                    .where((e) =>
                                                        e.id ==
                                                        popularServiceHomeListItem
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
                                                review:
                                                    popularServiceHomeListItem
                                                        .reviews,
                                                price:
                                                    popularServiceHomeListItem
                                                        .price,
                                                duration:
                                                    popularServiceHomeListItem
                                                        .duration,
                                                catName:
                                                    popularServiceHomeListItem
                                                        .categoriesName,
                                                isMainTap: () async {
                                                  context.pushNamed(
                                                    ServicesDetailsWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'serviceDetail':
                                                          serializeParam(
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
                          if (FFAppState().recentlyViewedListQA.isNotEmpty)
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  wrapWithModel(
                                    model: _model.rowTitleComponantModel3,
                                    updateCallback: () => safeSetState(() {}),
                                    child: RowTitleComponantWidget(
                                      title: 'Recently viewed',
                                      isView: true,
                                      viewAllAction: () async {
                                        context.pushNamed(
                                            RecentlyViewedPageWidget.routeName);
                                      },
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      final recentList = FFAppState()
                                          .recentlyViewedListQA
                                          .toList()
                                          .take(5)
                                          .toList();

                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                                  recentList.length,
                                                  (recentListIndex) {
                                            final recentListItem =
                                                recentList[recentListIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 8.0),
                                              child: wrapWithModel(
                                                model: _model
                                                    .mainRowComponentModels1
                                                    .getModel(
                                                  recentListIndex.toString(),
                                                  recentListIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: MainRowComponentWidget(
                                                  key: Key(
                                                    'Keyemh_${recentListIndex.toString()}',
                                                  ),
                                                  image: recentListItem.image,
                                                  name: recentListItem.name,
                                                  isLike: FFAppState()
                                                      .favouriteList
                                                      .where((e) =>
                                                          e.id ==
                                                          recentListItem.id)
                                                      .toList()
                                                      .isNotEmpty,
                                                  width: 368.0,
                                                  review:
                                                      recentListItem.reviews,
                                                  price: recentListItem.price,
                                                  duration:
                                                      recentListItem.duration,
                                                  catName: recentListItem
                                                      .categoriesName,
                                                  isMainTap: () async {
                                                    context.pushNamed(
                                                      ServicesDetailsWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'serviceDetail':
                                                            serializeParam(
                                                          recentListItem,
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
                                                              recentListItem.id)
                                                          .toList()
                                                          .isNotEmpty,
                                                      product: recentListItem,
                                                    );
                                                    safeSetState(() {});
                                                  },
                                                ),
                                              ),
                                            );
                                          })
                                              .divide(SizedBox(width: 16.0))
                                              .addToStart(SizedBox(
                                                  width: FFAppConstants
                                                      .primaryPadding))
                                              .addToEnd(SizedBox(
                                                  width: FFAppConstants
                                                      .primaryPadding)),
                                        ),
                                      );
                                    },
                                  ),
                                ]
                                    .divide(SizedBox(height: 8.0))
                                    .addToStart(SizedBox(height: 8.0)),
                              ),
                            ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                wrapWithModel(
                                  model: _model.rowTitleComponantModel4,
                                  updateCallback: () => safeSetState(() {}),
                                  child: RowTitleComponantWidget(
                                    title: 'Recommended for you',
                                    isView: true,
                                    viewAllAction: () async {
                                      context.pushNamed(
                                          RecommendedPageWidget.routeName);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final popularServiceHomeList =
                                          FFAppState()
                                              .allServicesList
                                              .where((e) =>
                                                  e.popularServices == true)
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
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
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
                                              model: _model.mainComponentModels2
                                                  .getModel(
                                                popularServiceHomeListIndex
                                                    .toString(),
                                                popularServiceHomeListIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: MainComponentWidget(
                                                key: Key(
                                                  'Keyyro_${popularServiceHomeListIndex.toString()}',
                                                ),
                                                image:
                                                    popularServiceHomeListItem
                                                        .image,
                                                name: popularServiceHomeListItem
                                                    .name,
                                                isLike: FFAppState()
                                                    .favouriteList
                                                    .where((e) =>
                                                        e.id ==
                                                        popularServiceHomeListItem
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
                                                review:
                                                    popularServiceHomeListItem
                                                        .reviews,
                                                price:
                                                    popularServiceHomeListItem
                                                        .price,
                                                duration:
                                                    popularServiceHomeListItem
                                                        .duration,
                                                catName:
                                                    popularServiceHomeListItem
                                                        .categoriesName,
                                                isMainTap: () async {
                                                  context.pushNamed(
                                                    ServicesDetailsWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'serviceDetail':
                                                          serializeParam(
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 8.0),
                            child: Builder(
                              builder: (context) {
                                final bannerSecList =
                                    FFAppState().bannerSecList.toList();

                                return Container(
                                  width: double.infinity,
                                  height: () {
                                    if (MediaQuery.sizeOf(context).width <
                                        810.0) {
                                      return 156.0;
                                    } else if ((MediaQuery.sizeOf(context)
                                                .width >=
                                            810.0) &&
                                        (MediaQuery.sizeOf(context).width <
                                            1280.0)) {
                                      return 230.0;
                                    } else if ((MediaQuery.sizeOf(context)
                                                .width >=
                                            1280.0) &&
                                        (MediaQuery.sizeOf(context).width <
                                            2560.0)) {
                                      return 345.0;
                                    } else {
                                      return 345.0;
                                    }
                                  }(),
                                  child: CarouselSlider.builder(
                                    itemCount: bannerSecList.length,
                                    itemBuilder:
                                        (context, bannerSecListIndex, _) {
                                      final bannerSecListItem =
                                          bannerSecList[bannerSecListIndex];
                                      return Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: CachedNetworkImageProvider(
                                              bannerSecListItem.image,
                                            ),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              valueOrDefault<double>(
                                            FFAppConstants.radius2Xl,
                                            0.0,
                                          )),
                                        ),
                                      );
                                    },
                                    carouselController:
                                        _model.carouselController2 ??=
                                            CarouselSliderController(),
                                    options: CarouselOptions(
                                      initialPage: max(
                                          0, min(1, bannerSecList.length - 1)),
                                      viewportFraction: () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return 0.9;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointMedium) {
                                          return 0.8;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return 0.65;
                                        } else {
                                          return 0.55;
                                        }
                                      }(),
                                      disableCenter: false,
                                      enlargeCenterPage: true,
                                      enlargeFactor: 0.25,
                                      enableInfiniteScroll: false,
                                      scrollDirection: Axis.horizontal,
                                      autoPlay: true,
                                      autoPlayAnimationDuration:
                                          Duration(milliseconds: 800),
                                      autoPlayInterval:
                                          Duration(milliseconds: (800 + 4000)),
                                      autoPlayCurve: Curves.linear,
                                      pauseAutoPlayInFiniteScroll: true,
                                      onPageChanged: (index, _) async {
                                        _model.carouselCurrentIndex2 = index;

                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                wrapWithModel(
                                  model: _model.rowTitleComponantModel5,
                                  updateCallback: () => safeSetState(() {}),
                                  child: RowTitleComponantWidget(
                                    title: 'Suggested for you',
                                    isView: true,
                                    viewAllAction: () async {
                                      context.pushNamed(
                                          SuggestedForPageWidget.routeName);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final suggestedServicesHomeList =
                                          FFAppState()
                                              .allServicesList
                                              .where((e) =>
                                                  e.suggestedService == true)
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
                                          return 4;
                                        } else {
                                          return 6;
                                        }
                                      }()).toList();

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
                                        children: List.generate(
                                            suggestedServicesHomeList.length,
                                            (suggestedServicesHomeListIndex) {
                                          final suggestedServicesHomeListItem =
                                              suggestedServicesHomeList[
                                                  suggestedServicesHomeListIndex];
                                          return Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: wrapWithModel(
                                              model: _model
                                                  .mainRowComponentModels2
                                                  .getModel(
                                                suggestedServicesHomeListIndex
                                                    .toString(),
                                                suggestedServicesHomeListIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: MainRowComponentWidget(
                                                key: Key(
                                                  'Keyj5e_${suggestedServicesHomeListIndex.toString()}',
                                                ),
                                                image:
                                                    suggestedServicesHomeListItem
                                                        .image,
                                                name:
                                                    suggestedServicesHomeListItem
                                                        .name,
                                                isLike: FFAppState()
                                                    .favouriteList
                                                    .where((e) =>
                                                        e.id ==
                                                        suggestedServicesHomeListItem
                                                            .id)
                                                    .toList()
                                                    .isNotEmpty,
                                                width: () {
                                                  if (MediaQuery.sizeOf(context)
                                                          .width <
                                                      810.0) {
                                                    return double.infinity;
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
                                                            48) *
                                                        1 /
                                                        2);
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
                                                review:
                                                    suggestedServicesHomeListItem
                                                        .reviews,
                                                price:
                                                    suggestedServicesHomeListItem
                                                        .price,
                                                duration:
                                                    suggestedServicesHomeListItem
                                                        .duration,
                                                catName:
                                                    suggestedServicesHomeListItem
                                                        .categoriesName,
                                                isMainTap: () async {
                                                  context.pushNamed(
                                                    ServicesDetailsWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'serviceDetail':
                                                          serializeParam(
                                                        suggestedServicesHomeListItem,
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
                                                            suggestedServicesHomeListItem
                                                                .id)
                                                        .toList()
                                                        .isNotEmpty,
                                                    product:
                                                        suggestedServicesHomeListItem,
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
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                wrapWithModel(
                                  model: _model.rowTitleComponantModel6,
                                  updateCallback: () => safeSetState(() {}),
                                  child: RowTitleComponantWidget(
                                    title: 'Our specialist',
                                    isView: true,
                                    viewAllAction: () async {
                                      context.pushNamed(
                                          OurSpecialistPageWidget.routeName);
                                    },
                                  ),
                                ),
                                Builder(
                                  builder: (context) {
                                    final staffHomeList = FFAppState()
                                        .selectSpecialistsList
                                        .toList()
                                        .take(6)
                                        .toList();

                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children:
                                            List.generate(staffHomeList.length,
                                                    (staffHomeListIndex) {
                                          final staffHomeListItem =
                                              staffHomeList[staffHomeListIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 8.0),
                                            child: wrapWithModel(
                                              model: _model
                                                  .staffMemberCommonComponentModels
                                                  .getModel(
                                                staffHomeListIndex.toString(),
                                                staffHomeListIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child:
                                                  StaffMemberCommonComponentWidget(
                                                key: Key(
                                                  'Keyzo7_${staffHomeListIndex.toString()}',
                                                ),
                                                image: staffHomeListItem.image,
                                                name: staffHomeListItem.title,
                                                onTapAction: () async {
                                                  context.pushNamed(
                                                    OurSpecialistsDetailsPageWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'staffDetail':
                                                          serializeParam(
                                                        staffHomeListItem,
                                                        ParamType.DataStruct,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                              ),
                                            ),
                                          );
                                        })
                                                .divide(SizedBox(width: 16.0))
                                                .around(SizedBox(width: 16.0)),
                                      ),
                                    );
                                  },
                                ),
                              ]
                                  .divide(SizedBox(height: 8.0))
                                  .addToStart(SizedBox(height: 8.0)),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                wrapWithModel(
                                  model: _model.rowTitleComponantModel7,
                                  updateCallback: () => safeSetState(() {}),
                                  child: RowTitleComponantWidget(
                                    title: 'Blogs',
                                    isView: true,
                                    viewAllAction: () async {
                                      context
                                          .pushNamed(BlogPageWidget.routeName);
                                    },
                                  ),
                                ),
                                Builder(
                                  builder: (context) {
                                    final blogList = FFAppState()
                                        .blogList
                                        .toList()
                                        .take(4)
                                        .toList();

                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(blogList.length,
                                                (blogListIndex) {
                                          final blogListItem =
                                              blogList[blogListIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 8.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  BlogDetailPageWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'blogDetail':
                                                        serializeParam(
                                                      blogListItem,
                                                      ParamType.DataStruct,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Container(
                                                width: 245.0,
                                                height: 254.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          valueOrDefault<
                                                              double>(
                                                    FFAppConstants.radius2Xl,
                                                    0.0,
                                                  )),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .borderColor,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 8.0, 8.0, 15.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  valueOrDefault<
                                                                      double>(
                                                            FFAppConstants
                                                                .radiusXl,
                                                            0.0,
                                                          )),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            fadeOutDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            imageUrl:
                                                                blogListItem
                                                                    .image,
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            fit: BoxFit.cover,
                                                            errorWidget: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Image.asset(
                                                              'assets/images/error_image.png',
                                                              width: double
                                                                  .infinity,
                                                              height: double
                                                                  .infinity,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    0.0,
                                                                    4.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              blogListItem
                                                                  .title,
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'SF Pro Display',
                                                                    fontSize:
                                                                        15.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    lineHeight:
                                                                        1.33,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Text(
                                                                blogListItem
                                                                    .description,
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                maxLines: 2,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'SF Pro Display',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          15.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      lineHeight:
                                                                          1.33,
                                                                    ),
                                                              ),
                                                            ),
                                                            Text(
                                                              blogListItem
                                                                  .createAt,
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'SF Pro Display',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    fontSize:
                                                                        15.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    lineHeight:
                                                                        1.33,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 15.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        })
                                            .divide(SizedBox(width: 16.0))
                                            .around(SizedBox(width: 16.0)),
                                      ),
                                    );
                                  },
                                ),
                              ]
                                  .divide(SizedBox(height: 8.0))
                                  .addToStart(SizedBox(height: 8.0)),
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
    );
  }
}

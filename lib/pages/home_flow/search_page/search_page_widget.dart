import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/main_appbar/main_appbar_widget.dart';
import '/pages/components/main_component/main_component_widget.dart';
import '/pages/empty_components/no_search_component/no_search_component_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'search_page_model.dart';
export 'search_page_model.dart';

class SearchPageWidget extends StatefulWidget {
  const SearchPageWidget({super.key});

  static String routeName = 'SearchPage';
  static String routePath = '/searchPage';

  @override
  State<SearchPageWidget> createState() => _SearchPageWidgetState();
}

class _SearchPageWidgetState extends State<SearchPageWidget> {
  late SearchPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchPageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
        resizeToAvoidBottomInset: false,
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
                  title: 'Search',
                  isBack: false,
                  isEdit: false,
                  backAction: () async {},
                  editAction: () async {},
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
                    8.0),
                child: Container(
                  width: double.infinity,
                  height: 56.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(valueOrDefault<double>(
                      FFAppConstants.radius2Xl,
                      0.0,
                    )),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).borderColor,
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          FFIcons.ksearchBlackGl,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.textController',
                                Duration(milliseconds: 100),
                                () async {
                                  safeSetState(() {});
                                },
                              ),
                              onFieldSubmitted: (_) async {
                                if (_model.textController.text != '') {
                                  FFAppState().addToSearchList(
                                      _model.textController.text);
                                  FFAppState().update(() {});
                                  safeSetState(() {
                                    _model.textController?.clear();
                                  });
                                }
                              },
                              autofocus: true,
                              textInputAction: TextInputAction.search,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                alignLabelWithHint: true,
                                hintText: 'Search categories ...',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'SF Pro Display',
                                      color:
                                          FlutterFlowTheme.of(context).accent3,
                                      fontSize: 17.0,
                                      letterSpacing: 0.0,
                                      lineHeight: 1.0,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.5, 0.0, 16.5),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'SF Pro Display',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 17.0,
                                    letterSpacing: 0.0,
                                    lineHeight: 1.0,
                                  ),
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (FFAppState().connected) {
                      return Builder(
                        builder: (context) {
                          if (_model.textController.text == '') {
                            return Builder(
                              builder: (context) {
                                if (FFAppState().searchList.isNotEmpty) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (FFAppState().searchList.isNotEmpty)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  valueOrDefault<double>(
                                                    FFAppConstants
                                                        .primaryPadding,
                                                    0.0,
                                                  ),
                                                  8.0,
                                                  valueOrDefault<double>(
                                                    FFAppConstants
                                                        .primaryPadding,
                                                    0.0,
                                                  ),
                                                  4.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Recent search',
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'SF Pro Display',
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        lineHeight: 1.41,
                                                      ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState().searchList = [];
                                                  FFAppState().update(() {});
                                                },
                                                child: Text(
                                                  'Clear',
                                                  textAlign: TextAlign.end,
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'SF Pro Display',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        lineHeight: 1.5,
                                                      ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 4.0)),
                                          ),
                                        ),
                                      if (FFAppState().searchList.isNotEmpty)
                                        Expanded(
                                          child: Builder(
                                            builder: (context) {
                                              final searchDataList =
                                                  FFAppState()
                                                      .searchList
                                                      .toList();

                                              return ListView.separated(
                                                padding: EdgeInsets.fromLTRB(
                                                  0,
                                                  12.0,
                                                  0,
                                                  12.0,
                                                ),
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    searchDataList.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(height: 14.0),
                                                itemBuilder: (context,
                                                    searchDataListIndex) {
                                                  final searchDataListItem =
                                                      searchDataList[
                                                          searchDataListIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                valueOrDefault<
                                                                    double>(
                                                                  FFAppConstants
                                                                      .primaryPadding,
                                                                  0.0,
                                                                ),
                                                                0.0,
                                                                valueOrDefault<
                                                                    double>(
                                                                  FFAppConstants
                                                                      .primaryPadding,
                                                                  0.0,
                                                                ),
                                                                0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  'assets/images/Search_black_na.svg',
                                                                  width: 20.0,
                                                                  height: 20.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  safeSetState(
                                                                      () {
                                                                    _model.textController
                                                                            ?.text =
                                                                        searchDataListItem;
                                                                  });
                                                                },
                                                                child: Text(
                                                                  searchDataListItem,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'SF Pro Display',
                                                                        fontSize:
                                                                            15.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        lineHeight:
                                                                            1.33,
                                                                      ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 12.0)),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      2.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              FFAppState()
                                                                  .removeAtIndexFromSearchList(
                                                                      searchDataListIndex);
                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                            },
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0.0),
                                                              child: SvgPicture
                                                                  .asset(
                                                                'assets/images/close_py.svg',
                                                                width: 20.0,
                                                                height: 20.0,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 12.0)),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                    ],
                                  );
                                } else {
                                  return wrapWithModel(
                                    model: _model.noSearchComponentModel1,
                                    updateCallback: () => safeSetState(() {}),
                                    child: NoSearchComponentWidget(),
                                  );
                                }
                              },
                            );
                          } else {
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                      4.0),
                                  child: Text(
                                    'See Result',
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
                                Expanded(
                                  child: Builder(
                                    builder: (context) {
                                      if (functions
                                          .filteredList(
                                              FFAppState()
                                                  .allServicesList
                                                  .toList(),
                                              _model.textController.text)
                                          .isNotEmpty) {
                                        return ListView(
                                          padding: EdgeInsets.fromLTRB(
                                            0,
                                            4.0,
                                            0,
                                            4.0,
                                          ),
                                          scrollDirection: Axis.vertical,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final searchServicesList =
                                                      functions
                                                          .filteredList(
                                                              FFAppState()
                                                                  .allServicesList
                                                                  .toList(),
                                                              _model
                                                                  .textController
                                                                  .text)
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
                                                        searchServicesList
                                                            .length,
                                                        (searchServicesListIndex) {
                                                      final searchServicesListItem =
                                                          searchServicesList[
                                                              searchServicesListIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .mainComponentModels
                                                              .getModel(
                                                            searchServicesListIndex
                                                                .toString(),
                                                            searchServicesListIndex,
                                                          ),
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              MainComponentWidget(
                                                            key: Key(
                                                              'Keytyf_${searchServicesListIndex.toString()}',
                                                            ),
                                                            image:
                                                                searchServicesListItem
                                                                    .image,
                                                            name:
                                                                searchServicesListItem
                                                                    .name,
                                                            isLike: FFAppState()
                                                                .favouriteList
                                                                .where((e) =>
                                                                    e.id ==
                                                                    searchServicesListItem
                                                                        .id)
                                                                .toList()
                                                                .isNotEmpty,
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
                                                            review:
                                                                searchServicesListItem
                                                                    .reviews,
                                                            price:
                                                                searchServicesListItem
                                                                    .price,
                                                            duration:
                                                                searchServicesListItem
                                                                    .duration,
                                                            catName:
                                                                searchServicesListItem
                                                                    .categoriesName,
                                                            isMainTap:
                                                                () async {
                                                              context.pushNamed(
                                                                ServicesDetailsWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'serviceDetail':
                                                                      serializeParam(
                                                                    searchServicesListItem,
                                                                    ParamType
                                                                        .DataStruct,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            likeAction:
                                                                () async {
                                                              await action_blocks
                                                                  .addAndRemoveFavourite(
                                                                context,
                                                                isAvilable: FFAppState()
                                                                    .favouriteList
                                                                    .where((e) =>
                                                                        e.id ==
                                                                        searchServicesListItem
                                                                            .id)
                                                                    .toList()
                                                                    .isNotEmpty,
                                                                product:
                                                                    searchServicesListItem,
                                                              );
                                                              safeSetState(
                                                                  () {});
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
                                          model: _model.noSearchComponentModel2,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: NoSearchComponentWidget(),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ],
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

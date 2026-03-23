import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/bottom_flow/booking_component/booking_component_widget.dart';
import '/pages/bottom_flow/categories_component/categories_component_widget.dart';
import '/pages/bottom_flow/home_component/home_component_widget.dart';
import '/pages/bottom_flow/profile_component/profile_component_widget.dart';
import '/pages/cart_component/cart_component_widget.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:provider/provider.dart';
import 'home_main_page_model.dart';
export 'home_main_page_model.dart';

class HomeMainPageWidget extends StatefulWidget {
  const HomeMainPageWidget({super.key});

  static String routeName = 'HomeMainPage';
  static String routePath = '/homeMainPage';

  @override
  State<HomeMainPageWidget> createState() => _HomeMainPageWidgetState();
}

class _HomeMainPageWidgetState extends State<HomeMainPageWidget> {
  late HomeMainPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeMainPageModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
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
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (FFAppState().homePageIndex == 0) {
                      return wrapWithModel(
                        model: _model.homeComponentModel,
                        updateCallback: () => safeSetState(() {}),
                        child: HomeComponentWidget(),
                      );
                    } else if (FFAppState().homePageIndex == 1) {
                      return wrapWithModel(
                        model: _model.categoriesComponentModel,
                        updateCallback: () => safeSetState(() {}),
                        child: CategoriesComponentWidget(),
                      );
                    } else if (FFAppState().homePageIndex == 2) {
                      return wrapWithModel(
                        model: _model.cartComponentModel,
                        updateCallback: () => safeSetState(() {}),
                        child: CartComponentWidget(),
                      );
                    } else if (FFAppState().homePageIndex == 3) {
                      return wrapWithModel(
                        model: _model.bookingComponentModel,
                        updateCallback: () => safeSetState(() {}),
                        child: BookingComponentWidget(),
                      );
                    } else {
                      return wrapWithModel(
                        model: _model.profileComponentModel,
                        updateCallback: () => safeSetState(() {}),
                        child: ProfileComponentWidget(),
                      );
                    }
                  },
                ),
              ),
              if (!(isWeb
                  ? MediaQuery.viewInsetsOf(context).bottom > 0
                  : _isKeyboardVisible))
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 22.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              FFAppState().homePageIndex = 0;
                              FFAppState().update(() {});
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: FFAppState().homePageIndex == 0
                                        ? FlutterFlowTheme.of(context).secondary
                                        : Color(0x00000000),
                                    borderRadius: BorderRadius.circular(170.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        17.0, 4.0, 17.0, 4.0),
                                    child: Builder(
                                      builder: (context) {
                                        if (FFAppState().homePageIndex == 0) {
                                          return Icon(
                                            FFIcons.khomeFillGl,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          );
                                        } else {
                                          return Icon(
                                            FFIcons.khomeGl,
                                            color: FlutterFlowTheme.of(context)
                                                .navColor,
                                            size: 24.0,
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                Text(
                                  'Home',
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'SF Pro Display',
                                        color: FFAppState().homePageIndex == 0
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .navColor,
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        lineHeight: 1.31,
                                      ),
                                ),
                              ].divide(SizedBox(height: 5.0)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              FFAppState().homePageIndex = 1;
                              FFAppState().update(() {});
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: FFAppState().homePageIndex == 1
                                        ? FlutterFlowTheme.of(context).secondary
                                        : Color(0x00000000),
                                    borderRadius: BorderRadius.circular(170.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        17.0, 4.0, 17.0, 4.0),
                                    child: Builder(
                                      builder: (context) {
                                        if (FFAppState().homePageIndex == 1) {
                                          return Icon(
                                            Icons.dashboard_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          );
                                        } else {
                                          return Icon(
                                            Icons.dashboard_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .navColor,
                                            size: 24.0,
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                Text(
                                  'Categories',
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'SF Pro Display',
                                        color: FFAppState().homePageIndex == 1
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .navColor,
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        lineHeight: 1.31,
                                      ),
                                ),
                              ].divide(SizedBox(height: 5.0)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              FFAppState().homePageIndex = 2;
                              FFAppState().update(() {});
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: FFAppState().homePageIndex == 2
                                        ? FlutterFlowTheme.of(context).secondary
                                        : Color(0x00000000),
                                    borderRadius: BorderRadius.circular(170.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        17.0, 4.0, 17.0, 4.0),
                                    child: Builder(
                                      builder: (context) {
                                        if (FFAppState().homePageIndex == 2) {
                                          return Icon(
                                            FFIcons.kmyCartFillGl,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          );
                                        } else {
                                          return Icon(
                                            FFIcons.kmyCartGl,
                                            color: FlutterFlowTheme.of(context)
                                                .navColor,
                                            size: 24.0,
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                Text(
                                  'My cart',
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'SF Pro Display',
                                        color: FFAppState().homePageIndex == 2
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .navColor,
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        lineHeight: 1.31,
                                      ),
                                ),
                              ].divide(SizedBox(height: 5.0)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              FFAppState().homePageIndex = 3;
                              FFAppState().update(() {});
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: FFAppState().homePageIndex == 3
                                        ? FlutterFlowTheme.of(context).secondary
                                        : Color(0x00000000),
                                    borderRadius: BorderRadius.circular(170.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        17.0, 4.0, 17.0, 4.0),
                                    child: Builder(
                                      builder: (context) {
                                        if (FFAppState().homePageIndex == 3) {
                                          return Icon(
                                            FFIcons.kmyBookingGl,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          );
                                        } else {
                                          return Icon(
                                            FFIcons.kmyBookingGl,
                                            color: FlutterFlowTheme.of(context)
                                                .navColor,
                                            size: 24.0,
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                Text(
                                  'My booking',
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'SF Pro Display',
                                        color: FFAppState().homePageIndex == 3
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .navColor,
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        lineHeight: 1.31,
                                      ),
                                ),
                              ].divide(SizedBox(height: 5.0)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              FFAppState().homePageIndex = 4;
                              FFAppState().update(() {});
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: FFAppState().homePageIndex == 4
                                        ? FlutterFlowTheme.of(context).secondary
                                        : Color(0x00000000),
                                    borderRadius: BorderRadius.circular(170.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        17.0, 4.0, 17.0, 4.0),
                                    child: Builder(
                                      builder: (context) {
                                        if (FFAppState().homePageIndex == 4) {
                                          return Icon(
                                            FFIcons.kprofileFillGl,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          );
                                        } else {
                                          return Icon(
                                            FFIcons.kprofileGl,
                                            color: FlutterFlowTheme.of(context)
                                                .navColor,
                                            size: 24.0,
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                Text(
                                  'Profile',
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'SF Pro Display',
                                        color: FFAppState().homePageIndex == 4
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .navColor,
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        lineHeight: 1.31,
                                      ),
                                ),
                              ].divide(SizedBox(height: 5.0)),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 4.0)),
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

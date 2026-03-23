import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'main_component_model.dart';
export 'main_component_model.dart';

class MainComponentWidget extends StatefulWidget {
  const MainComponentWidget({
    super.key,
    required this.image,
    required this.name,
    required this.isMainTap,
    bool? isLike,
    required this.likeAction,
    required this.width,
    required this.review,
    required this.price,
    required this.duration,
    required this.catName,
  }) : this.isLike = isLike ?? false;

  final String? image;
  final String? name;
  final Future Function()? isMainTap;
  final bool isLike;
  final Future Function()? likeAction;
  final double? width;
  final String? review;
  final String? price;
  final String? duration;
  final String? catName;

  @override
  State<MainComponentWidget> createState() => _MainComponentWidgetState();
}

class _MainComponentWidgetState extends State<MainComponentWidget>
    with TickerProviderStateMixin {
  late MainComponentModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainComponentModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 50.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

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

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await widget.isMainTap?.call();
      },
      child: Container(
        width: widget.width,
        height: () {
          if (MediaQuery.sizeOf(context).width < 810.0) {
            return 235.0;
          } else if ((MediaQuery.sizeOf(context).width >= 810.0) &&
              (MediaQuery.sizeOf(context).width < 1280.0)) {
            return 245.0;
          } else if ((MediaQuery.sizeOf(context).width >= 1280.0) &&
              (MediaQuery.sizeOf(context).width < 2560.0)) {
            return 255.0;
          } else {
            return 265.0;
          }
        }(),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).whiteGreyColor,
          borderRadius: BorderRadius.circular(valueOrDefault<double>(
            FFAppConstants.radius2Xl,
            0.0,
          )),
          border: Border.all(
            color: FlutterFlowTheme.of(context).bgBorderColor,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 14.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    alignment: AlignmentDirectional(1.0, -1.0),
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(valueOrDefault<double>(
                          FFAppConstants.radiusXl,
                          0.0,
                        )),
                        child: CachedNetworkImage(
                          fadeInDuration: Duration(milliseconds: 200),
                          fadeOutDuration: Duration(milliseconds: 200),
                          imageUrl: widget.image!,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          errorWidget: (context, error, stackTrace) =>
                              Image.asset(
                            'assets/images/error_image.png',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 10.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (FFAppState().isLoginQA) {
                              await widget.likeAction?.call();
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
                                    textColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
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
                          child: Container(
                            width: 28.0,
                            height: 28.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              shape: BoxShape.circle,
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                if (widget.isLike == false) {
                                  return Icon(
                                    FFIcons.kfavouritePrimaryGl,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 18.0,
                                  );
                                } else {
                                  return Icon(
                                    FFIcons.kfavFillGl,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 18.0,
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    valueOrDefault<String>(
                      widget.name,
                      'Name',
                    ),
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'SF Pro Display',
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          lineHeight: 1.33,
                        ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: SvgPicture.asset(
                          'assets/images/start_yellow_gl.svg',
                          width: 18.0,
                          height: 18.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          valueOrDefault<String>(
                            widget.review,
                            '4.2 (120 reviews)',
                          ),
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'SF Pro Display',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 13.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                                lineHeight: 1.46,
                              ),
                        ),
                      ),
                    ].divide(SizedBox(width: 8.0)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              decoration: BoxDecoration(),
                              child: Icon(
                                FFIcons.kclockPrimaryGl,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 16.0,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                valueOrDefault<String>(
                                  widget.duration,
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
                                      fontWeight: FontWeight.normal,
                                      lineHeight: 1.33,
                                    ),
                              ),
                            ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                      ),
                      Text(
                        '${FFAppState().currencyType}${widget.price}',
                        textAlign: TextAlign.end,
                        maxLines: 1,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'SF Pro Display',
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 17.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              lineHeight: 1.5,
                            ),
                      ),
                    ].divide(SizedBox(width: 8.0)),
                  ),
                ].divide(SizedBox(height: 6.0)),
              ),
            ].divide(SizedBox(height: 8.0)),
          ),
        ),
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}

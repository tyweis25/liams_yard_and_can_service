import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'row_title_componant_model.dart';
export 'row_title_componant_model.dart';

class RowTitleComponantWidget extends StatefulWidget {
  const RowTitleComponantWidget({
    super.key,
    required this.title,
    required this.viewAllAction,
    bool? isView,
  }) : this.isView = isView ?? false;

  final String? title;
  final Future Function()? viewAllAction;
  final bool isView;

  @override
  State<RowTitleComponantWidget> createState() =>
      _RowTitleComponantWidgetState();
}

class _RowTitleComponantWidgetState extends State<RowTitleComponantWidget>
    with TickerProviderStateMixin {
  late RowTitleComponantModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RowTitleComponantModel());

    animationsMap.addAll({
      'rowOnPageLoadAnimation': AnimationInfo(
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
    return Padding(
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
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              valueOrDefault<String>(
                widget.title,
                'Title',
              ),
              textAlign: TextAlign.start,
              maxLines: 1,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'SF Pro Display',
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                    lineHeight: 1.28,
                  ),
            ),
          ),
          if (widget.isView == true)
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await widget.viewAllAction?.call();
              },
              child: Text(
                'View all',
                textAlign: TextAlign.end,
                maxLines: 1,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'SF Pro Display',
                      color: FlutterFlowTheme.of(context).primary,
                      fontSize: 15.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                      lineHeight: 1.33,
                    ),
              ),
            ),
        ].divide(SizedBox(width: 8.0)),
      ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation']!),
    );
  }
}

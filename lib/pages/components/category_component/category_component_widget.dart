import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'category_component_model.dart';
export 'category_component_model.dart';

class CategoryComponentWidget extends StatefulWidget {
  const CategoryComponentWidget({
    super.key,
    required this.image,
    required this.name,
    required this.onTap,
    required this.width,
  });

  final String? image;
  final String? name;
  final Future Function()? onTap;
  final double? width;

  @override
  State<CategoryComponentWidget> createState() =>
      _CategoryComponentWidgetState();
}

class _CategoryComponentWidgetState extends State<CategoryComponentWidget> {
  late CategoryComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoryComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await widget.onTap?.call();
      },
      child: Container(
        width: widget.width,
        height: () {
          if (MediaQuery.sizeOf(context).width < 810.0) {
            return 106.0;
          } else if ((MediaQuery.sizeOf(context).width >= 810.0) &&
              (MediaQuery.sizeOf(context).width < 1280.0)) {
            return 111.0;
          } else if ((MediaQuery.sizeOf(context).width >= 1280.0) &&
              (MediaQuery.sizeOf(context).width < 2560.0)) {
            return 116.0;
          } else {
            return 121.0;
          }
        }(),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).whiteGreyColor,
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
          padding: EdgeInsetsDirectional.fromSTEB(7.0, 20.0, 7.0, 14.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: CachedNetworkImage(
                  fadeInDuration: Duration(milliseconds: 200),
                  fadeOutDuration: Duration(milliseconds: 200),
                  imageUrl: widget.image!,
                  width: 40.0,
                  height: 40.0,
                  fit: BoxFit.contain,
                  errorWidget: (context, error, stackTrace) => Image.asset(
                    'assets/images/error_image.png',
                    width: 40.0,
                    height: 40.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Text(
                valueOrDefault<String>(
                  widget.name,
                  'Name',
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'SF Pro Display',
                      fontSize: 15.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      lineHeight: 1.33,
                    ),
              ),
            ].divide(SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}

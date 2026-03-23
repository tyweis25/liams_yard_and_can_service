import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'staff_member_common_component_model.dart';
export 'staff_member_common_component_model.dart';

class StaffMemberCommonComponentWidget extends StatefulWidget {
  const StaffMemberCommonComponentWidget({
    super.key,
    required this.image,
    required this.name,
    required this.onTapAction,
  });

  final String? image;
  final String? name;
  final Future Function()? onTapAction;

  @override
  State<StaffMemberCommonComponentWidget> createState() =>
      _StaffMemberCommonComponentWidgetState();
}

class _StaffMemberCommonComponentWidgetState
    extends State<StaffMemberCommonComponentWidget> {
  late StaffMemberCommonComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StaffMemberCommonComponentModel());

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
        await widget.onTapAction?.call();
      },
      child: Container(
        width: 121.0,
        height: 133.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider(
              widget.image!,
            ),
          ),
          borderRadius: BorderRadius.circular(valueOrDefault<double>(
            FFAppConstants.radius2Xl,
            0.0,
          )),
        ),
        alignment: AlignmentDirectional(0.0, 1.0),
        child: Container(
          width: double.infinity,
          height: 48.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0x00010A09),
                Color(0x8A010A09),
                FlutterFlowTheme.of(context).blackColor
              ],
              stops: [0.0, 0.58, 1.0],
              begin: AlignmentDirectional(0.0, -1.0),
              end: AlignmentDirectional(0, 1.0),
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(valueOrDefault<double>(
                FFAppConstants.radius2Xl,
                0.0,
              )),
              bottomRight: Radius.circular(valueOrDefault<double>(
                FFAppConstants.radius2Xl,
                0.0,
              )),
              topLeft: Radius.circular(0.0),
              topRight: Radius.circular(0.0),
            ),
          ),
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Text(
            valueOrDefault<String>(
              widget.name,
              'Name',
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'SF Pro Display',
                  color: FlutterFlowTheme.of(context).white,
                  fontSize: 15.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  lineHeight: 1.33,
                ),
          ),
        ),
      ),
    );
  }
}

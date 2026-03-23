// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:readmore/readmore.dart';

class ReadMoreTextWidget extends StatefulWidget {
  const ReadMoreTextWidget({
    super.key,
    this.width,
    this.height,
    required this.text,
  });

  final double? width;
  final double? height;
  final String text;

  @override
  State<ReadMoreTextWidget> createState() => _ReadMoreTextWidgetState();
}

class _ReadMoreTextWidgetState extends State<ReadMoreTextWidget> {
  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      widget.text,
      trimLines: 2,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Read more...',
      trimExpandedText: 'Read less',
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'SF Pro Display',
            color: FlutterFlowTheme.of(context).primaryText,
            fontSize: 17,
            letterSpacing: 0.0,
            fontWeight: FontWeight.normal,
            lineHeight: 1.29,
          ),
      lessStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'SF Pro Display',
            color: FlutterFlowTheme.of(context).primary,
            fontSize: 17,
            letterSpacing: 0.0,
            fontWeight: FontWeight.w600,
            lineHeight: 1.29,
          ),
      moreStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'SF Pro Display',
            color: FlutterFlowTheme.of(context).primary,
            fontSize: 17,
            letterSpacing: 0.0,
            fontWeight: FontWeight.w600,
            lineHeight: 1.29,
          ),
    );
  }
}

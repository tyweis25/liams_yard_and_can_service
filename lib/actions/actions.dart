import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';

Future addAndRemoveFavourite(
  BuildContext context, {
  required bool? isAvilable,
  required ServicesModelStruct? product,
}) async {
  if (isAvilable!) {
    FFAppState().removeFromFavouriteList(product!);
    FFAppState().update(() {});
    await action_blocks.mainSnackbar(
      context,
      title: FFAppState().unfavText,
    );
  } else {
    FFAppState().addToFavouriteList(product!);
    FFAppState().update(() {});
    await action_blocks.mainSnackbar(
      context,
      title: FFAppState().favText,
    );
  }
}

Future internetCheck(BuildContext context) async {
  await action_blocks.mainSnackbar(
    context,
    title: 'Please turn on internet...',
  );
}

Future mainSnackbar(
  BuildContext context, {
  required String? title,
}) async {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        title!,
        style: TextStyle(
          fontFamily: 'SF Pro Display',
          color: FlutterFlowTheme.of(context).primaryBackground,
          fontSize: 17.0,
        ),
        textAlign: TextAlign.start,
      ),
      duration: Duration(milliseconds: 2000),
      backgroundColor: FlutterFlowTheme.of(context).primaryText,
    ),
  );
}

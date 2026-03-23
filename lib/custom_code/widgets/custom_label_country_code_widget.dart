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

import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLabelCountryCodeWidget extends StatefulWidget {
  const CustomLabelCountryCodeWidget({
    super.key,
    this.width,
    this.height,
    this.initialValue,
    this.code,
    required this.updateAction,
    required this.codeUpdateAction,
  });

  final double? width;
  final double? height;
  final String? initialValue;
  final String? code;
  final Future Function(String? phone) updateAction;
  final Future Function(String? countryCode) codeUpdateAction;

  @override
  State<CustomLabelCountryCodeWidget> createState() =>
      _CustomLabelCountryCodeWidgetState();
}

class _CustomLabelCountryCodeWidgetState
    extends State<CustomLabelCountryCodeWidget> {
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      showCountryFlag: false,
      autofocus: false,
      dropdownIcon: Icon(
        Icons.keyboard_arrow_down,
        size: 12,
        color: FlutterFlowTheme.of(context).primaryText,
      ),
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'SF Pro Display',
            fontSize: 17,
            letterSpacing: 0.0,
            lineHeight: 1,
          ),
      dropdownIconPosition: IconPosition.trailing,
      dropdownTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'SF Pro Display',
            fontSize: 17,
            letterSpacing: 0.0,
            lineHeight: 1,
          ),
      dropdownDecoration:
          BoxDecoration(borderRadius: BorderRadius.circular(12)),
      initialValue: widget.initialValue ?? "",
      flagsButtonMargin: EdgeInsets.only(left: 16),
      keyboardType: TextInputType.phone,
      cursorColor: FlutterFlowTheme.of(context).primaryText,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
      decoration: InputDecoration(
        alignLabelWithHint: true,

        hintText: 'Enter phone number',
        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
              fontFamily: 'SF Pro Display',
              color: FlutterFlowTheme.of(context).grey40,
              fontSize: 17,
              letterSpacing: 0.0,
              lineHeight: 1,
            ),
        counterText: '',

        // errorText: 'Please enter valid number ',
        errorStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'SF Pro Display',
              color: FlutterFlowTheme.of(context).error,
              fontSize: 15,
              letterSpacing: 0.0,
            ),
        filled: false,
        contentPadding: EdgeInsetsDirectional.fromSTEB(16, 19.5, 16, 19.5),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).error,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).primary,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).borderColor, width: 1)),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).error,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).borderColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).borderColor, width: 1)),
      ),
      initialCountryCode: widget.code ?? "IN",
      validator: (num) {
        return "Please enter a valid phone number";
      },
      invalidNumberMessage: "Please enter valid phone number",
      onChanged: (value) {
        widget.updateAction.call(value.number);
        widget.codeUpdateAction.call(value.countryCode);
      },
      autovalidateMode: AutovalidateMode.onUnfocus,
      onCountryChanged: (value) {
        widget.codeUpdateAction.call("+${value.dialCode}");
      },
    );
  }
}

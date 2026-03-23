import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/main_appbar/main_appbar_widget.dart';
import '/index.dart';
import 'payment_method_page_widget.dart' show PaymentMethodPageWidget;
import 'package:flutter/material.dart';

class PaymentMethodPageModel extends FlutterFlowModel<PaymentMethodPageWidget> {
  ///  Local state fields for this page.

  int? paymentIndex;

  PaymentMethodModelStruct? paymentModel;
  void updatePaymentModelStruct(Function(PaymentMethodModelStruct) updateFn) {
    updateFn(paymentModel ??= PaymentMethodModelStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Model for MainAppbar component.
  late MainAppbarModel mainAppbarModel;

  @override
  void initState(BuildContext context) {
    mainAppbarModel = createModel(context, () => MainAppbarModel());
  }

  @override
  void dispose() {
    mainAppbarModel.dispose();
  }
}

// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PaymentMethodModelStruct extends FFFirebaseStruct {
  PaymentMethodModelStruct({
    String? image,
    String? name,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _image = image,
        _name = name,
        super(firestoreUtilData);

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static PaymentMethodModelStruct fromMap(Map<String, dynamic> data) =>
      PaymentMethodModelStruct(
        image: data['image'] as String?,
        name: data['name'] as String?,
      );

  static PaymentMethodModelStruct? maybeFromMap(dynamic data) => data is Map
      ? PaymentMethodModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'image': _image,
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static PaymentMethodModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PaymentMethodModelStruct(
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PaymentMethodModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PaymentMethodModelStruct &&
        image == other.image &&
        name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([image, name]);
}

PaymentMethodModelStruct createPaymentMethodModelStruct({
  String? image,
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PaymentMethodModelStruct(
      image: image,
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PaymentMethodModelStruct? updatePaymentMethodModelStruct(
  PaymentMethodModelStruct? paymentMethodModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    paymentMethodModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPaymentMethodModelStructData(
  Map<String, dynamic> firestoreData,
  PaymentMethodModelStruct? paymentMethodModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (paymentMethodModel == null) {
    return;
  }
  if (paymentMethodModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && paymentMethodModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final paymentMethodModelData =
      getPaymentMethodModelFirestoreData(paymentMethodModel, forFieldValue);
  final nestedData =
      paymentMethodModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      paymentMethodModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPaymentMethodModelFirestoreData(
  PaymentMethodModelStruct? paymentMethodModel, [
  bool forFieldValue = false,
]) {
  if (paymentMethodModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(paymentMethodModel.toMap());

  // Add any Firestore field values
  paymentMethodModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPaymentMethodModelListFirestoreData(
  List<PaymentMethodModelStruct>? paymentMethodModels,
) =>
    paymentMethodModels
        ?.map((e) => getPaymentMethodModelFirestoreData(e, true))
        .toList() ??
    [];

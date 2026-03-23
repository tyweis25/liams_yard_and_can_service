// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CouponCodeModelStruct extends FFFirebaseStruct {
  CouponCodeModelStruct({
    int? id,
    String? code,
    String? description,
    String? couponCheck,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _code = code,
        _description = description,
        _couponCheck = couponCheck,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "couponCheck" field.
  String? _couponCheck;
  String get couponCheck => _couponCheck ?? '';
  set couponCheck(String? val) => _couponCheck = val;

  bool hasCouponCheck() => _couponCheck != null;

  static CouponCodeModelStruct fromMap(Map<String, dynamic> data) =>
      CouponCodeModelStruct(
        id: castToType<int>(data['id']),
        code: data['code'] as String?,
        description: data['description'] as String?,
        couponCheck: data['couponCheck'] as String?,
      );

  static CouponCodeModelStruct? maybeFromMap(dynamic data) => data is Map
      ? CouponCodeModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'code': _code,
        'description': _description,
        'couponCheck': _couponCheck,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'couponCheck': serializeParam(
          _couponCheck,
          ParamType.String,
        ),
      }.withoutNulls;

  static CouponCodeModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      CouponCodeModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        couponCheck: deserializeParam(
          data['couponCheck'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CouponCodeModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CouponCodeModelStruct &&
        id == other.id &&
        code == other.code &&
        description == other.description &&
        couponCheck == other.couponCheck;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, code, description, couponCheck]);
}

CouponCodeModelStruct createCouponCodeModelStruct({
  int? id,
  String? code,
  String? description,
  String? couponCheck,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CouponCodeModelStruct(
      id: id,
      code: code,
      description: description,
      couponCheck: couponCheck,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CouponCodeModelStruct? updateCouponCodeModelStruct(
  CouponCodeModelStruct? couponCodeModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    couponCodeModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCouponCodeModelStructData(
  Map<String, dynamic> firestoreData,
  CouponCodeModelStruct? couponCodeModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (couponCodeModel == null) {
    return;
  }
  if (couponCodeModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && couponCodeModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final couponCodeModelData =
      getCouponCodeModelFirestoreData(couponCodeModel, forFieldValue);
  final nestedData =
      couponCodeModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = couponCodeModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCouponCodeModelFirestoreData(
  CouponCodeModelStruct? couponCodeModel, [
  bool forFieldValue = false,
]) {
  if (couponCodeModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(couponCodeModel.toMap());

  // Add any Firestore field values
  couponCodeModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCouponCodeModelListFirestoreData(
  List<CouponCodeModelStruct>? couponCodeModels,
) =>
    couponCodeModels
        ?.map((e) => getCouponCodeModelFirestoreData(e, true))
        .toList() ??
    [];

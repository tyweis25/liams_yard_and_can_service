// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartModelStruct extends FFFirebaseStruct {
  CartModelStruct({
    int? id,
    ServicesModelStruct? serviceDetail,
    String? bookingDate,
    String? bookingTime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _serviceDetail = serviceDetail,
        _bookingDate = bookingDate,
        _bookingTime = bookingTime,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "serviceDetail" field.
  ServicesModelStruct? _serviceDetail;
  ServicesModelStruct get serviceDetail =>
      _serviceDetail ?? ServicesModelStruct();
  set serviceDetail(ServicesModelStruct? val) => _serviceDetail = val;

  void updateServiceDetail(Function(ServicesModelStruct) updateFn) {
    updateFn(_serviceDetail ??= ServicesModelStruct());
  }

  bool hasServiceDetail() => _serviceDetail != null;

  // "bookingDate" field.
  String? _bookingDate;
  String get bookingDate => _bookingDate ?? '';
  set bookingDate(String? val) => _bookingDate = val;

  bool hasBookingDate() => _bookingDate != null;

  // "bookingTime" field.
  String? _bookingTime;
  String get bookingTime => _bookingTime ?? '';
  set bookingTime(String? val) => _bookingTime = val;

  bool hasBookingTime() => _bookingTime != null;

  static CartModelStruct fromMap(Map<String, dynamic> data) => CartModelStruct(
        id: castToType<int>(data['id']),
        serviceDetail: data['serviceDetail'] is ServicesModelStruct
            ? data['serviceDetail']
            : ServicesModelStruct.maybeFromMap(data['serviceDetail']),
        bookingDate: data['bookingDate'] as String?,
        bookingTime: data['bookingTime'] as String?,
      );

  static CartModelStruct? maybeFromMap(dynamic data) => data is Map
      ? CartModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'serviceDetail': _serviceDetail?.toMap(),
        'bookingDate': _bookingDate,
        'bookingTime': _bookingTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'serviceDetail': serializeParam(
          _serviceDetail,
          ParamType.DataStruct,
        ),
        'bookingDate': serializeParam(
          _bookingDate,
          ParamType.String,
        ),
        'bookingTime': serializeParam(
          _bookingTime,
          ParamType.String,
        ),
      }.withoutNulls;

  static CartModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      CartModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        serviceDetail: deserializeStructParam(
          data['serviceDetail'],
          ParamType.DataStruct,
          false,
          structBuilder: ServicesModelStruct.fromSerializableMap,
        ),
        bookingDate: deserializeParam(
          data['bookingDate'],
          ParamType.String,
          false,
        ),
        bookingTime: deserializeParam(
          data['bookingTime'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CartModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CartModelStruct &&
        id == other.id &&
        serviceDetail == other.serviceDetail &&
        bookingDate == other.bookingDate &&
        bookingTime == other.bookingTime;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, serviceDetail, bookingDate, bookingTime]);
}

CartModelStruct createCartModelStruct({
  int? id,
  ServicesModelStruct? serviceDetail,
  String? bookingDate,
  String? bookingTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CartModelStruct(
      id: id,
      serviceDetail:
          serviceDetail ?? (clearUnsetFields ? ServicesModelStruct() : null),
      bookingDate: bookingDate,
      bookingTime: bookingTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CartModelStruct? updateCartModelStruct(
  CartModelStruct? cartModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cartModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCartModelStructData(
  Map<String, dynamic> firestoreData,
  CartModelStruct? cartModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cartModel == null) {
    return;
  }
  if (cartModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cartModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cartModelData = getCartModelFirestoreData(cartModel, forFieldValue);
  final nestedData = cartModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cartModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCartModelFirestoreData(
  CartModelStruct? cartModel, [
  bool forFieldValue = false,
]) {
  if (cartModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cartModel.toMap());

  // Handle nested data for "serviceDetail" field.
  addServicesModelStructData(
    firestoreData,
    cartModel.hasServiceDetail() ? cartModel.serviceDetail : null,
    'serviceDetail',
    forFieldValue,
  );

  // Add any Firestore field values
  cartModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCartModelListFirestoreData(
  List<CartModelStruct>? cartModels,
) =>
    cartModels?.map((e) => getCartModelFirestoreData(e, true)).toList() ?? [];

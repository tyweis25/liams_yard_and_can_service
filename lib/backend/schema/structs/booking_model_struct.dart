// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingModelStruct extends FFFirebaseStruct {
  BookingModelStruct({
    int? id,
    ServicesModelStruct? serviceDetail,
    String? bookingDate,
    String? bookingTime,
    PaymentMethodModelStruct? paymentType,
    String? totalPayment,
    String? orderId,
    String? status,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _serviceDetail = serviceDetail,
        _bookingDate = bookingDate,
        _bookingTime = bookingTime,
        _paymentType = paymentType,
        _totalPayment = totalPayment,
        _orderId = orderId,
        _status = status,
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

  // "paymentType" field.
  PaymentMethodModelStruct? _paymentType;
  PaymentMethodModelStruct get paymentType =>
      _paymentType ?? PaymentMethodModelStruct();
  set paymentType(PaymentMethodModelStruct? val) => _paymentType = val;

  void updatePaymentType(Function(PaymentMethodModelStruct) updateFn) {
    updateFn(_paymentType ??= PaymentMethodModelStruct());
  }

  bool hasPaymentType() => _paymentType != null;

  // "totalPayment" field.
  String? _totalPayment;
  String get totalPayment => _totalPayment ?? '';
  set totalPayment(String? val) => _totalPayment = val;

  bool hasTotalPayment() => _totalPayment != null;

  // "orderId" field.
  String? _orderId;
  String get orderId => _orderId ?? '';
  set orderId(String? val) => _orderId = val;

  bool hasOrderId() => _orderId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  static BookingModelStruct fromMap(Map<String, dynamic> data) =>
      BookingModelStruct(
        id: castToType<int>(data['id']),
        serviceDetail: data['serviceDetail'] is ServicesModelStruct
            ? data['serviceDetail']
            : ServicesModelStruct.maybeFromMap(data['serviceDetail']),
        bookingDate: data['bookingDate'] as String?,
        bookingTime: data['bookingTime'] as String?,
        paymentType: data['paymentType'] is PaymentMethodModelStruct
            ? data['paymentType']
            : PaymentMethodModelStruct.maybeFromMap(data['paymentType']),
        totalPayment: data['totalPayment'] as String?,
        orderId: data['orderId'] as String?,
        status: data['status'] as String?,
      );

  static BookingModelStruct? maybeFromMap(dynamic data) => data is Map
      ? BookingModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'serviceDetail': _serviceDetail?.toMap(),
        'bookingDate': _bookingDate,
        'bookingTime': _bookingTime,
        'paymentType': _paymentType?.toMap(),
        'totalPayment': _totalPayment,
        'orderId': _orderId,
        'status': _status,
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
        'paymentType': serializeParam(
          _paymentType,
          ParamType.DataStruct,
        ),
        'totalPayment': serializeParam(
          _totalPayment,
          ParamType.String,
        ),
        'orderId': serializeParam(
          _orderId,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
      }.withoutNulls;

  static BookingModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      BookingModelStruct(
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
        paymentType: deserializeStructParam(
          data['paymentType'],
          ParamType.DataStruct,
          false,
          structBuilder: PaymentMethodModelStruct.fromSerializableMap,
        ),
        totalPayment: deserializeParam(
          data['totalPayment'],
          ParamType.String,
          false,
        ),
        orderId: deserializeParam(
          data['orderId'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BookingModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BookingModelStruct &&
        id == other.id &&
        serviceDetail == other.serviceDetail &&
        bookingDate == other.bookingDate &&
        bookingTime == other.bookingTime &&
        paymentType == other.paymentType &&
        totalPayment == other.totalPayment &&
        orderId == other.orderId &&
        status == other.status;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        serviceDetail,
        bookingDate,
        bookingTime,
        paymentType,
        totalPayment,
        orderId,
        status
      ]);
}

BookingModelStruct createBookingModelStruct({
  int? id,
  ServicesModelStruct? serviceDetail,
  String? bookingDate,
  String? bookingTime,
  PaymentMethodModelStruct? paymentType,
  String? totalPayment,
  String? orderId,
  String? status,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BookingModelStruct(
      id: id,
      serviceDetail:
          serviceDetail ?? (clearUnsetFields ? ServicesModelStruct() : null),
      bookingDate: bookingDate,
      bookingTime: bookingTime,
      paymentType:
          paymentType ?? (clearUnsetFields ? PaymentMethodModelStruct() : null),
      totalPayment: totalPayment,
      orderId: orderId,
      status: status,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BookingModelStruct? updateBookingModelStruct(
  BookingModelStruct? bookingModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    bookingModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBookingModelStructData(
  Map<String, dynamic> firestoreData,
  BookingModelStruct? bookingModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (bookingModel == null) {
    return;
  }
  if (bookingModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && bookingModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final bookingModelData =
      getBookingModelFirestoreData(bookingModel, forFieldValue);
  final nestedData =
      bookingModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = bookingModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBookingModelFirestoreData(
  BookingModelStruct? bookingModel, [
  bool forFieldValue = false,
]) {
  if (bookingModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(bookingModel.toMap());

  // Handle nested data for "serviceDetail" field.
  addServicesModelStructData(
    firestoreData,
    bookingModel.hasServiceDetail() ? bookingModel.serviceDetail : null,
    'serviceDetail',
    forFieldValue,
  );

  // Handle nested data for "paymentType" field.
  addPaymentMethodModelStructData(
    firestoreData,
    bookingModel.hasPaymentType() ? bookingModel.paymentType : null,
    'paymentType',
    forFieldValue,
  );

  // Add any Firestore field values
  bookingModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBookingModelListFirestoreData(
  List<BookingModelStruct>? bookingModels,
) =>
    bookingModels?.map((e) => getBookingModelFirestoreData(e, true)).toList() ??
    [];

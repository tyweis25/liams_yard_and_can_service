// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AvailableTimeSlotsModelStruct extends FFFirebaseStruct {
  AvailableTimeSlotsModelStruct({
    String? time,
    bool? isDone,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _time = time,
        _isDone = isDone,
        super(firestoreUtilData);

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  set time(String? val) => _time = val;

  bool hasTime() => _time != null;

  // "isDone" field.
  bool? _isDone;
  bool get isDone => _isDone ?? false;
  set isDone(bool? val) => _isDone = val;

  bool hasIsDone() => _isDone != null;

  static AvailableTimeSlotsModelStruct fromMap(Map<String, dynamic> data) =>
      AvailableTimeSlotsModelStruct(
        time: data['time'] as String?,
        isDone: data['isDone'] as bool?,
      );

  static AvailableTimeSlotsModelStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? AvailableTimeSlotsModelStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'time': _time,
        'isDone': _isDone,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'time': serializeParam(
          _time,
          ParamType.String,
        ),
        'isDone': serializeParam(
          _isDone,
          ParamType.bool,
        ),
      }.withoutNulls;

  static AvailableTimeSlotsModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AvailableTimeSlotsModelStruct(
        time: deserializeParam(
          data['time'],
          ParamType.String,
          false,
        ),
        isDone: deserializeParam(
          data['isDone'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'AvailableTimeSlotsModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AvailableTimeSlotsModelStruct &&
        time == other.time &&
        isDone == other.isDone;
  }

  @override
  int get hashCode => const ListEquality().hash([time, isDone]);
}

AvailableTimeSlotsModelStruct createAvailableTimeSlotsModelStruct({
  String? time,
  bool? isDone,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AvailableTimeSlotsModelStruct(
      time: time,
      isDone: isDone,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AvailableTimeSlotsModelStruct? updateAvailableTimeSlotsModelStruct(
  AvailableTimeSlotsModelStruct? availableTimeSlotsModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    availableTimeSlotsModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAvailableTimeSlotsModelStructData(
  Map<String, dynamic> firestoreData,
  AvailableTimeSlotsModelStruct? availableTimeSlotsModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (availableTimeSlotsModel == null) {
    return;
  }
  if (availableTimeSlotsModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      availableTimeSlotsModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final availableTimeSlotsModelData = getAvailableTimeSlotsModelFirestoreData(
      availableTimeSlotsModel, forFieldValue);
  final nestedData =
      availableTimeSlotsModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      availableTimeSlotsModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAvailableTimeSlotsModelFirestoreData(
  AvailableTimeSlotsModelStruct? availableTimeSlotsModel, [
  bool forFieldValue = false,
]) {
  if (availableTimeSlotsModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(availableTimeSlotsModel.toMap());

  // Add any Firestore field values
  availableTimeSlotsModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAvailableTimeSlotsModelListFirestoreData(
  List<AvailableTimeSlotsModelStruct>? availableTimeSlotsModels,
) =>
    availableTimeSlotsModels
        ?.map((e) => getAvailableTimeSlotsModelFirestoreData(e, true))
        .toList() ??
    [];

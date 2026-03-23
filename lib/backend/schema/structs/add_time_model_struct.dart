// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AddTimeModelStruct extends FFFirebaseStruct {
  AddTimeModelStruct({
    String? type,
    List<AvailableTimeSlotsModelStruct>? time,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _time = time,
        super(firestoreUtilData);

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "time" field.
  List<AvailableTimeSlotsModelStruct>? _time;
  List<AvailableTimeSlotsModelStruct> get time => _time ?? const [];
  set time(List<AvailableTimeSlotsModelStruct>? val) => _time = val;

  void updateTime(Function(List<AvailableTimeSlotsModelStruct>) updateFn) {
    updateFn(_time ??= []);
  }

  bool hasTime() => _time != null;

  static AddTimeModelStruct fromMap(Map<String, dynamic> data) =>
      AddTimeModelStruct(
        type: data['type'] as String?,
        time: getStructList(
          data['time'],
          AvailableTimeSlotsModelStruct.fromMap,
        ),
      );

  static AddTimeModelStruct? maybeFromMap(dynamic data) => data is Map
      ? AddTimeModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'time': _time?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'time': serializeParam(
          _time,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static AddTimeModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      AddTimeModelStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        time: deserializeStructParam<AvailableTimeSlotsModelStruct>(
          data['time'],
          ParamType.DataStruct,
          true,
          structBuilder: AvailableTimeSlotsModelStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'AddTimeModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AddTimeModelStruct &&
        type == other.type &&
        listEquality.equals(time, other.time);
  }

  @override
  int get hashCode => const ListEquality().hash([type, time]);
}

AddTimeModelStruct createAddTimeModelStruct({
  String? type,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AddTimeModelStruct(
      type: type,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AddTimeModelStruct? updateAddTimeModelStruct(
  AddTimeModelStruct? addTimeModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    addTimeModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAddTimeModelStructData(
  Map<String, dynamic> firestoreData,
  AddTimeModelStruct? addTimeModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (addTimeModel == null) {
    return;
  }
  if (addTimeModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && addTimeModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final addTimeModelData =
      getAddTimeModelFirestoreData(addTimeModel, forFieldValue);
  final nestedData =
      addTimeModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = addTimeModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAddTimeModelFirestoreData(
  AddTimeModelStruct? addTimeModel, [
  bool forFieldValue = false,
]) {
  if (addTimeModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(addTimeModel.toMap());

  // Add any Firestore field values
  addTimeModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAddTimeModelListFirestoreData(
  List<AddTimeModelStruct>? addTimeModels,
) =>
    addTimeModels?.map((e) => getAddTimeModelFirestoreData(e, true)).toList() ??
    [];

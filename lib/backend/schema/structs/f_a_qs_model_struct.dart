// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class FAQsModelStruct extends FFFirebaseStruct {
  FAQsModelStruct({
    String? title,
    String? description,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _description = description,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  static FAQsModelStruct fromMap(Map<String, dynamic> data) => FAQsModelStruct(
        title: data['title'] as String?,
        description: data['description'] as String?,
      );

  static FAQsModelStruct? maybeFromMap(dynamic data) => data is Map
      ? FAQsModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'description': _description,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
      }.withoutNulls;

  static FAQsModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      FAQsModelStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FAQsModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FAQsModelStruct &&
        title == other.title &&
        description == other.description;
  }

  @override
  int get hashCode => const ListEquality().hash([title, description]);
}

FAQsModelStruct createFAQsModelStruct({
  String? title,
  String? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FAQsModelStruct(
      title: title,
      description: description,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FAQsModelStruct? updateFAQsModelStruct(
  FAQsModelStruct? fAQsModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    fAQsModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFAQsModelStructData(
  Map<String, dynamic> firestoreData,
  FAQsModelStruct? fAQsModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (fAQsModel == null) {
    return;
  }
  if (fAQsModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && fAQsModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final fAQsModelData = getFAQsModelFirestoreData(fAQsModel, forFieldValue);
  final nestedData = fAQsModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = fAQsModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFAQsModelFirestoreData(
  FAQsModelStruct? fAQsModel, [
  bool forFieldValue = false,
]) {
  if (fAQsModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(fAQsModel.toMap());

  // Add any Firestore field values
  fAQsModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFAQsModelListFirestoreData(
  List<FAQsModelStruct>? fAQsModels,
) =>
    fAQsModels?.map((e) => getFAQsModelFirestoreData(e, true)).toList() ?? [];

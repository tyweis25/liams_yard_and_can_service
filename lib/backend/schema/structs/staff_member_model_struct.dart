// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class StaffMemberModelStruct extends FFFirebaseStruct {
  StaffMemberModelStruct({
    String? image,
    String? title,
    String? catName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _image = image,
        _title = title,
        _catName = catName,
        super(firestoreUtilData);

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "catName" field.
  String? _catName;
  String get catName => _catName ?? '';
  set catName(String? val) => _catName = val;

  bool hasCatName() => _catName != null;

  static StaffMemberModelStruct fromMap(Map<String, dynamic> data) =>
      StaffMemberModelStruct(
        image: data['image'] as String?,
        title: data['title'] as String?,
        catName: data['catName'] as String?,
      );

  static StaffMemberModelStruct? maybeFromMap(dynamic data) => data is Map
      ? StaffMemberModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'image': _image,
        'title': _title,
        'catName': _catName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'catName': serializeParam(
          _catName,
          ParamType.String,
        ),
      }.withoutNulls;

  static StaffMemberModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      StaffMemberModelStruct(
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        catName: deserializeParam(
          data['catName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'StaffMemberModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StaffMemberModelStruct &&
        image == other.image &&
        title == other.title &&
        catName == other.catName;
  }

  @override
  int get hashCode => const ListEquality().hash([image, title, catName]);
}

StaffMemberModelStruct createStaffMemberModelStruct({
  String? image,
  String? title,
  String? catName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StaffMemberModelStruct(
      image: image,
      title: title,
      catName: catName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StaffMemberModelStruct? updateStaffMemberModelStruct(
  StaffMemberModelStruct? staffMemberModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    staffMemberModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStaffMemberModelStructData(
  Map<String, dynamic> firestoreData,
  StaffMemberModelStruct? staffMemberModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (staffMemberModel == null) {
    return;
  }
  if (staffMemberModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && staffMemberModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final staffMemberModelData =
      getStaffMemberModelFirestoreData(staffMemberModel, forFieldValue);
  final nestedData =
      staffMemberModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = staffMemberModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStaffMemberModelFirestoreData(
  StaffMemberModelStruct? staffMemberModel, [
  bool forFieldValue = false,
]) {
  if (staffMemberModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(staffMemberModel.toMap());

  // Add any Firestore field values
  staffMemberModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStaffMemberModelListFirestoreData(
  List<StaffMemberModelStruct>? staffMemberModels,
) =>
    staffMemberModels
        ?.map((e) => getStaffMemberModelFirestoreData(e, true))
        .toList() ??
    [];

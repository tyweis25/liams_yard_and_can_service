// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class BlogModelStruct extends FFFirebaseStruct {
  BlogModelStruct({
    String? image,
    String? title,
    String? description,
    String? createAt,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _image = image,
        _title = title,
        _description = description,
        _createAt = createAt,
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

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "createAt" field.
  String? _createAt;
  String get createAt => _createAt ?? '';
  set createAt(String? val) => _createAt = val;

  bool hasCreateAt() => _createAt != null;

  static BlogModelStruct fromMap(Map<String, dynamic> data) => BlogModelStruct(
        image: data['image'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        createAt: data['createAt'] as String?,
      );

  static BlogModelStruct? maybeFromMap(dynamic data) => data is Map
      ? BlogModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'image': _image,
        'title': _title,
        'description': _description,
        'createAt': _createAt,
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
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'createAt': serializeParam(
          _createAt,
          ParamType.String,
        ),
      }.withoutNulls;

  static BlogModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      BlogModelStruct(
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
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        createAt: deserializeParam(
          data['createAt'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BlogModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BlogModelStruct &&
        image == other.image &&
        title == other.title &&
        description == other.description &&
        createAt == other.createAt;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([image, title, description, createAt]);
}

BlogModelStruct createBlogModelStruct({
  String? image,
  String? title,
  String? description,
  String? createAt,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BlogModelStruct(
      image: image,
      title: title,
      description: description,
      createAt: createAt,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BlogModelStruct? updateBlogModelStruct(
  BlogModelStruct? blogModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    blogModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBlogModelStructData(
  Map<String, dynamic> firestoreData,
  BlogModelStruct? blogModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (blogModel == null) {
    return;
  }
  if (blogModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && blogModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final blogModelData = getBlogModelFirestoreData(blogModel, forFieldValue);
  final nestedData = blogModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = blogModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBlogModelFirestoreData(
  BlogModelStruct? blogModel, [
  bool forFieldValue = false,
]) {
  if (blogModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(blogModel.toMap());

  // Add any Firestore field values
  blogModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBlogModelListFirestoreData(
  List<BlogModelStruct>? blogModels,
) =>
    blogModels?.map((e) => getBlogModelFirestoreData(e, true)).toList() ?? [];

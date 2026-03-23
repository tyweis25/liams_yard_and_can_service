// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ServicesModelStruct extends FFFirebaseStruct {
  ServicesModelStruct({
    int? id,
    String? image,
    String? name,
    String? reviews,
    String? duration,
    String? price,
    String? description,
    String? categoriesName,
    bool? trendingServices,
    bool? popularServices,
    bool? suggestedService,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _image = image,
        _name = name,
        _reviews = reviews,
        _duration = duration,
        _price = price,
        _description = description,
        _categoriesName = categoriesName,
        _trendingServices = trendingServices,
        _popularServices = popularServices,
        _suggestedService = suggestedService,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

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

  // "reviews" field.
  String? _reviews;
  String get reviews => _reviews ?? '';
  set reviews(String? val) => _reviews = val;

  bool hasReviews() => _reviews != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  set duration(String? val) => _duration = val;

  bool hasDuration() => _duration != null;

  // "price" field.
  String? _price;
  String get price => _price ?? '';
  set price(String? val) => _price = val;

  bool hasPrice() => _price != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "categoriesName" field.
  String? _categoriesName;
  String get categoriesName => _categoriesName ?? '';
  set categoriesName(String? val) => _categoriesName = val;

  bool hasCategoriesName() => _categoriesName != null;

  // "trendingServices" field.
  bool? _trendingServices;
  bool get trendingServices => _trendingServices ?? false;
  set trendingServices(bool? val) => _trendingServices = val;

  bool hasTrendingServices() => _trendingServices != null;

  // "popularServices" field.
  bool? _popularServices;
  bool get popularServices => _popularServices ?? false;
  set popularServices(bool? val) => _popularServices = val;

  bool hasPopularServices() => _popularServices != null;

  // "suggestedService" field.
  bool? _suggestedService;
  bool get suggestedService => _suggestedService ?? false;
  set suggestedService(bool? val) => _suggestedService = val;

  bool hasSuggestedService() => _suggestedService != null;

  static ServicesModelStruct fromMap(Map<String, dynamic> data) =>
      ServicesModelStruct(
        id: castToType<int>(data['id']),
        image: data['image'] as String?,
        name: data['name'] as String?,
        reviews: data['reviews'] as String?,
        duration: data['duration'] as String?,
        price: data['price'] as String?,
        description: data['description'] as String?,
        categoriesName: data['categoriesName'] as String?,
        trendingServices: data['trendingServices'] as bool?,
        popularServices: data['popularServices'] as bool?,
        suggestedService: data['suggestedService'] as bool?,
      );

  static ServicesModelStruct? maybeFromMap(dynamic data) => data is Map
      ? ServicesModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'image': _image,
        'name': _name,
        'reviews': _reviews,
        'duration': _duration,
        'price': _price,
        'description': _description,
        'categoriesName': _categoriesName,
        'trendingServices': _trendingServices,
        'popularServices': _popularServices,
        'suggestedService': _suggestedService,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'reviews': serializeParam(
          _reviews,
          ParamType.String,
        ),
        'duration': serializeParam(
          _duration,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'categoriesName': serializeParam(
          _categoriesName,
          ParamType.String,
        ),
        'trendingServices': serializeParam(
          _trendingServices,
          ParamType.bool,
        ),
        'popularServices': serializeParam(
          _popularServices,
          ParamType.bool,
        ),
        'suggestedService': serializeParam(
          _suggestedService,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ServicesModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      ServicesModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
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
        reviews: deserializeParam(
          data['reviews'],
          ParamType.String,
          false,
        ),
        duration: deserializeParam(
          data['duration'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        categoriesName: deserializeParam(
          data['categoriesName'],
          ParamType.String,
          false,
        ),
        trendingServices: deserializeParam(
          data['trendingServices'],
          ParamType.bool,
          false,
        ),
        popularServices: deserializeParam(
          data['popularServices'],
          ParamType.bool,
          false,
        ),
        suggestedService: deserializeParam(
          data['suggestedService'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ServicesModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ServicesModelStruct &&
        id == other.id &&
        image == other.image &&
        name == other.name &&
        reviews == other.reviews &&
        duration == other.duration &&
        price == other.price &&
        description == other.description &&
        categoriesName == other.categoriesName &&
        trendingServices == other.trendingServices &&
        popularServices == other.popularServices &&
        suggestedService == other.suggestedService;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        image,
        name,
        reviews,
        duration,
        price,
        description,
        categoriesName,
        trendingServices,
        popularServices,
        suggestedService
      ]);
}

ServicesModelStruct createServicesModelStruct({
  int? id,
  String? image,
  String? name,
  String? reviews,
  String? duration,
  String? price,
  String? description,
  String? categoriesName,
  bool? trendingServices,
  bool? popularServices,
  bool? suggestedService,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ServicesModelStruct(
      id: id,
      image: image,
      name: name,
      reviews: reviews,
      duration: duration,
      price: price,
      description: description,
      categoriesName: categoriesName,
      trendingServices: trendingServices,
      popularServices: popularServices,
      suggestedService: suggestedService,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ServicesModelStruct? updateServicesModelStruct(
  ServicesModelStruct? servicesModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    servicesModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addServicesModelStructData(
  Map<String, dynamic> firestoreData,
  ServicesModelStruct? servicesModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (servicesModel == null) {
    return;
  }
  if (servicesModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && servicesModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final servicesModelData =
      getServicesModelFirestoreData(servicesModel, forFieldValue);
  final nestedData =
      servicesModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = servicesModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getServicesModelFirestoreData(
  ServicesModelStruct? servicesModel, [
  bool forFieldValue = false,
]) {
  if (servicesModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(servicesModel.toMap());

  // Add any Firestore field values
  servicesModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getServicesModelListFirestoreData(
  List<ServicesModelStruct>? servicesModels,
) =>
    servicesModels
        ?.map((e) => getServicesModelFirestoreData(e, true))
        .toList() ??
    [];

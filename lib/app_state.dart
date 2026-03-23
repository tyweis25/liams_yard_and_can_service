import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _isIntroQA = prefs.getBool('ff_isIntroQA') ?? _isIntroQA;
    });
    _safeInit(() {
      _isLoginQA = prefs.getBool('ff_isLoginQA') ?? _isLoginQA;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_userDetailQA')) {
        try {
          final serializedData = prefs.getString('ff_userDetailQA') ?? '{}';
          _userDetailQA =
              LoginModelStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _bookingListQA = prefs
              .getStringList('ff_bookingListQA')
              ?.map((x) {
                try {
                  return BookingModelStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _bookingListQA;
    });
    _safeInit(() {
      _recentlyViewedListQA = prefs
              .getStringList('ff_recentlyViewedListQA')
              ?.map((x) {
                try {
                  return ServicesModelStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _recentlyViewedListQA;
    });
    _safeInit(() {
      _deviceId = prefs.getString('ff_deviceId') ?? _deviceId;
    });
    _safeInit(() {
      _currencyType = prefs.getString('ff_currencyType') ?? _currencyType;
    });
    _safeInit(() {
      _phone = prefs.getString('ff_phone') ?? _phone;
    });
    _safeInit(() {
      _countryName = prefs.getString('ff_countryName') ?? _countryName;
    });
    _safeInit(() {
      _searchList = prefs.getStringList('ff_searchList') ?? _searchList;
    });
    _safeInit(() {
      _defTimeZoneName =
          prefs.getString('ff_defTimeZoneName') ?? _defTimeZoneName;
    });
    _safeInit(() {
      _currentPassword =
          prefs.getString('ff_currentPassword') ?? _currentPassword;
    });
    _safeInit(() {
      _reviewAllList = prefs
              .getStringList('ff_reviewAllList')
              ?.map((x) {
                try {
                  return ReviewModelStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _reviewAllList;
    });
    _safeInit(() {
      _myReviewsList = prefs
              .getStringList('ff_myReviewsList')
              ?.map((x) {
                try {
                  return ReviewModelStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _myReviewsList;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_cartDetail')) {
        try {
          final serializedData = prefs.getString('ff_cartDetail') ?? '{}';
          _cartDetail =
              CartModelStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _modeIndex = prefs.getInt('ff_modeIndex') ?? _modeIndex;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _isIntroQA = false;
  bool get isIntroQA => _isIntroQA;
  set isIntroQA(bool value) {
    _isIntroQA = value;
    prefs.setBool('ff_isIntroQA', value);
  }

  bool _isLoginQA = false;
  bool get isLoginQA => _isLoginQA;
  set isLoginQA(bool value) {
    _isLoginQA = value;
    prefs.setBool('ff_isLoginQA', value);
  }

  LoginModelStruct _userDetailQA = LoginModelStruct.fromSerializableMap(jsonDecode(
      '{\"firstName\":\"Dev\",\"lastName\":\"Cooper\",\"email\":\"devcooper@gmail.com\",\"countryCode\":\"+91\",\"phoneNumber\":\"9909999099\",\"password\":\"123456\"}'));
  LoginModelStruct get userDetailQA => _userDetailQA;
  set userDetailQA(LoginModelStruct value) {
    _userDetailQA = value;
    prefs.setString('ff_userDetailQA', value.serialize());
  }

  void updateUserDetailQAStruct(Function(LoginModelStruct) updateFn) {
    updateFn(_userDetailQA);
    prefs.setString('ff_userDetailQA', _userDetailQA.serialize());
  }

  List<BookingModelStruct> _bookingListQA = [];
  List<BookingModelStruct> get bookingListQA => _bookingListQA;
  set bookingListQA(List<BookingModelStruct> value) {
    _bookingListQA = value;
    prefs.setStringList(
        'ff_bookingListQA', value.map((x) => x.serialize()).toList());
  }

  void addToBookingListQA(BookingModelStruct value) {
    bookingListQA.add(value);
    prefs.setStringList(
        'ff_bookingListQA', _bookingListQA.map((x) => x.serialize()).toList());
  }

  void removeFromBookingListQA(BookingModelStruct value) {
    bookingListQA.remove(value);
    prefs.setStringList(
        'ff_bookingListQA', _bookingListQA.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromBookingListQA(int index) {
    bookingListQA.removeAt(index);
    prefs.setStringList(
        'ff_bookingListQA', _bookingListQA.map((x) => x.serialize()).toList());
  }

  void updateBookingListQAAtIndex(
    int index,
    BookingModelStruct Function(BookingModelStruct) updateFn,
  ) {
    bookingListQA[index] = updateFn(_bookingListQA[index]);
    prefs.setStringList(
        'ff_bookingListQA', _bookingListQA.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInBookingListQA(int index, BookingModelStruct value) {
    bookingListQA.insert(index, value);
    prefs.setStringList(
        'ff_bookingListQA', _bookingListQA.map((x) => x.serialize()).toList());
  }

  List<ServicesModelStruct> _recentlyViewedListQA = [];
  List<ServicesModelStruct> get recentlyViewedListQA => _recentlyViewedListQA;
  set recentlyViewedListQA(List<ServicesModelStruct> value) {
    _recentlyViewedListQA = value;
    prefs.setStringList(
        'ff_recentlyViewedListQA', value.map((x) => x.serialize()).toList());
  }

  void addToRecentlyViewedListQA(ServicesModelStruct value) {
    recentlyViewedListQA.add(value);
    prefs.setStringList('ff_recentlyViewedListQA',
        _recentlyViewedListQA.map((x) => x.serialize()).toList());
  }

  void removeFromRecentlyViewedListQA(ServicesModelStruct value) {
    recentlyViewedListQA.remove(value);
    prefs.setStringList('ff_recentlyViewedListQA',
        _recentlyViewedListQA.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromRecentlyViewedListQA(int index) {
    recentlyViewedListQA.removeAt(index);
    prefs.setStringList('ff_recentlyViewedListQA',
        _recentlyViewedListQA.map((x) => x.serialize()).toList());
  }

  void updateRecentlyViewedListQAAtIndex(
    int index,
    ServicesModelStruct Function(ServicesModelStruct) updateFn,
  ) {
    recentlyViewedListQA[index] = updateFn(_recentlyViewedListQA[index]);
    prefs.setStringList('ff_recentlyViewedListQA',
        _recentlyViewedListQA.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInRecentlyViewedListQA(
      int index, ServicesModelStruct value) {
    recentlyViewedListQA.insert(index, value);
    prefs.setStringList('ff_recentlyViewedListQA',
        _recentlyViewedListQA.map((x) => x.serialize()).toList());
  }

  bool _connected = true;
  bool get connected => _connected;
  set connected(bool value) {
    _connected = value;
  }

  String _deviceId = '';
  String get deviceId => _deviceId;
  set deviceId(String value) {
    _deviceId = value;
    prefs.setString('ff_deviceId', value);
  }

  String _currencyType = '';
  String get currencyType => _currencyType;
  set currencyType(String value) {
    _currencyType = value;
    prefs.setString('ff_currencyType', value);
  }

  List<IntroModelStruct> _introList = [
    IntroModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/lu5qrlzusfjz/intro1.png\",\"title\":\"Create and Grow Your Perfect Garden ♻\",\"subTitle\":\"Discover expert gardening services to plant, nurture, and transform your space into a green paradise.\"}')),
    IntroModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/l4vu25klivno/intro2.png\",\"title\":\"Simple Care for a Healthy Green Space 🌿\",\"subTitle\":\"From watering to seasonal upkeep, we provide hassle free solutions to keep your plants thriving.\"}')),
    IntroModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/j3xxyy9ip2e7/intro3.png\",\"title\":\"Professional Landscaping for Every Home 😊\",\"subTitle\":\"Connect with skilled experts for beautiful lawns, stylish landscapes, and sustainable outdoor designs.\"}'))
  ];
  List<IntroModelStruct> get introList => _introList;
  set introList(List<IntroModelStruct> value) {
    _introList = value;
  }

  void addToIntroList(IntroModelStruct value) {
    introList.add(value);
  }

  void removeFromIntroList(IntroModelStruct value) {
    introList.remove(value);
  }

  void removeAtIndexFromIntroList(int index) {
    introList.removeAt(index);
  }

  void updateIntroListAtIndex(
    int index,
    IntroModelStruct Function(IntroModelStruct) updateFn,
  ) {
    introList[index] = updateFn(_introList[index]);
  }

  void insertAtIndexInIntroList(int index, IntroModelStruct value) {
    introList.insert(index, value);
  }

  String _phone = '9909999099';
  String get phone => _phone;
  set phone(String value) {
    _phone = value;
    prefs.setString('ff_phone', value);
  }

  String _countryName = 'IN';
  String get countryName => _countryName;
  set countryName(String value) {
    _countryName = value;
    prefs.setString('ff_countryName', value);
  }

  int _homePageIndex = 0;
  int get homePageIndex => _homePageIndex;
  set homePageIndex(int value) {
    _homePageIndex = value;
  }

  List<String> _searchList = [
    'Basic Lawn Mowing',
    'Premium Lawn Mowing',
    'Tree Pruning Service',
    'Emergency Tree Removal'
  ];
  List<String> get searchList => _searchList;
  set searchList(List<String> value) {
    _searchList = value;
    prefs.setStringList('ff_searchList', value);
  }

  void addToSearchList(String value) {
    searchList.add(value);
    prefs.setStringList('ff_searchList', _searchList);
  }

  void removeFromSearchList(String value) {
    searchList.remove(value);
    prefs.setStringList('ff_searchList', _searchList);
  }

  void removeAtIndexFromSearchList(int index) {
    searchList.removeAt(index);
    prefs.setStringList('ff_searchList', _searchList);
  }

  void updateSearchListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchList[index] = updateFn(_searchList[index]);
    prefs.setStringList('ff_searchList', _searchList);
  }

  void insertAtIndexInSearchList(int index, String value) {
    searchList.insert(index, value);
    prefs.setStringList('ff_searchList', _searchList);
  }

  List<CategoryModelStruct> _categoriesList = [
    CategoryModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/njwdql1s76ca/c1.png\",\"name\":\"Lawn Care & Maintenance\"}')),
    CategoryModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/fhfvgaqnt062/c2.png\",\"name\":\"Garden Care & Planting\"}')),
    CategoryModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/bscnd80wmnhv/c3.png\",\"name\":\"Tree Care & Arborist Services\"}')),
    CategoryModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/sbfxq587tmvk/c4.png\",\"name\":\"Landscaping & Outdoor Design\"}')),
    CategoryModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/p4trwxry8w9d/c5.png\",\"name\":\"Seasonal & Specialized Services\"}')),
    CategoryModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/bk9nskt169t7/c6.png\",\"name\":\"Specialized Lawn & Garden Enhancements\"}'))
  ];
  List<CategoryModelStruct> get categoriesList => _categoriesList;
  set categoriesList(List<CategoryModelStruct> value) {
    _categoriesList = value;
  }

  void addToCategoriesList(CategoryModelStruct value) {
    categoriesList.add(value);
  }

  void removeFromCategoriesList(CategoryModelStruct value) {
    categoriesList.remove(value);
  }

  void removeAtIndexFromCategoriesList(int index) {
    categoriesList.removeAt(index);
  }

  void updateCategoriesListAtIndex(
    int index,
    CategoryModelStruct Function(CategoryModelStruct) updateFn,
  ) {
    categoriesList[index] = updateFn(_categoriesList[index]);
  }

  void insertAtIndexInCategoriesList(int index, CategoryModelStruct value) {
    categoriesList.insert(index, value);
  }

  List<NotificationsModelStruct> _notificationsList = [
    NotificationsModelStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Upcoming Nutrition Session\",\"subTitle\":\"Your scheduled consultation is a key step in reaching your health goals.\",\"createAt\":\"30 seconds ago\"}')),
    NotificationsModelStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Your Appointment Confirmed Now\",\"subTitle\":\"We’ve secured your spot with the dietitian Get ready to discuss your lifestyle.\",\"createAt\":\"30 seconds ago\"}')),
    NotificationsModelStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Don’t Forget Your Upcoming Nutrition\",\"subTitle\":\"Your feedback matters! Share your thoughts on your session so we can track.\",\"createAt\":\"30 seconds ago\"}')),
    NotificationsModelStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Fresh Nutrition Appointment Slots\",\"subTitle\":\"Secure your next appointment today and keep building momentum.\",\"createAt\":\"30 seconds ago\"}')),
    NotificationsModelStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"You Missed Your Scheduled Nutrition \",\"subTitle\":\"As a valued client, you get 10% off your next session book today to take advantages.\",\"createAt\":\"30 seconds ago\"}'))
  ];
  List<NotificationsModelStruct> get notificationsList => _notificationsList;
  set notificationsList(List<NotificationsModelStruct> value) {
    _notificationsList = value;
  }

  void addToNotificationsList(NotificationsModelStruct value) {
    notificationsList.add(value);
  }

  void removeFromNotificationsList(NotificationsModelStruct value) {
    notificationsList.remove(value);
  }

  void removeAtIndexFromNotificationsList(int index) {
    notificationsList.removeAt(index);
  }

  void updateNotificationsListAtIndex(
    int index,
    NotificationsModelStruct Function(NotificationsModelStruct) updateFn,
  ) {
    notificationsList[index] = updateFn(_notificationsList[index]);
  }

  void insertAtIndexInNotificationsList(
      int index, NotificationsModelStruct value) {
    notificationsList.insert(index, value);
  }

  List<ServicesModelStruct> _favouriteList = [];
  List<ServicesModelStruct> get favouriteList => _favouriteList;
  set favouriteList(List<ServicesModelStruct> value) {
    _favouriteList = value;
  }

  void addToFavouriteList(ServicesModelStruct value) {
    favouriteList.add(value);
  }

  void removeFromFavouriteList(ServicesModelStruct value) {
    favouriteList.remove(value);
  }

  void removeAtIndexFromFavouriteList(int index) {
    favouriteList.removeAt(index);
  }

  void updateFavouriteListAtIndex(
    int index,
    ServicesModelStruct Function(ServicesModelStruct) updateFn,
  ) {
    favouriteList[index] = updateFn(_favouriteList[index]);
  }

  void insertAtIndexInFavouriteList(int index, ServicesModelStruct value) {
    favouriteList.insert(index, value);
  }

  String _favText = 'Service is favourite';
  String get favText => _favText;
  set favText(String value) {
    _favText = value;
  }

  String _unfavText = 'Service is unfavourite';
  String get unfavText => _unfavText;
  set unfavText(String value) {
    _unfavText = value;
  }

  String _defTimeZoneName = 'America/Detroit';
  String get defTimeZoneName => _defTimeZoneName;
  set defTimeZoneName(String value) {
    _defTimeZoneName = value;
    prefs.setString('ff_defTimeZoneName', value);
  }

  String _currentPassword = '';
  String get currentPassword => _currentPassword;
  set currentPassword(String value) {
    _currentPassword = value;
    prefs.setString('ff_currentPassword', value);
  }

  List<ServicesModelStruct> _allServicesList = [
    ServicesModelStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"1\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/ri61njf5iu0m/s7.png\",\"name\":\"Basic Lawn Mowing\",\"reviews\":\"4.2 (120 reviews)\",\"duration\":\"45 mins\",\"price\":\"40\",\"description\":\"Regular mowing is the foundation of a healthy, vibrant lawn. Our basic lawn mowing service ensures your grass is kept at the ideal height for strong growth and aesthetic appeal. By trimming evenly and cleaning the surface, we help your lawn resist pests and diseases.\\n In addition to mowing, we include edge trimming around sidewalks and driveways for a neat finish. This service is ideal for homeowners who want consistent upkeep without investing time or effort.\\n We recommend booking this service bi-weekly for best results, although frequency can be adjusted depending on your lawn’s growth rate. Our professionals use eco-friendly and well-maintained equipment to deliver a polished look every time.\\n With consistent care, your lawn remains lush, healthy, and welcoming throughout the year.\",\"categoriesName\":\"Lawn Care & Maintenance\",\"trendingServices\":\"true\"}')),
    ServicesModelStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"2\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/ekxwavn00bu4/s12.png\",\"name\":\"Premium Lawn Mowing & Edging\",\"reviews\":\"4.4 (150 reviews)\",\"duration\":\"1 hour\",\"price\":\"60\",\"description\":\"This premium service goes beyond basic mowing by adding precision edging along garden beds, pathways, and fences. A perfectly edged lawn highlights your landscaping and gives a professional appearance to your property.\\n Our team carefully trims hard-to-reach corners that standard mowers cannot handle, ensuring uniform results. The service also includes a final blow-cleaning of clippings from hard surfaces for a tidy finish.\\n It is ideal for homeowners preparing for guests, open houses, or seasonal upkeep where presentation matters. By combining mowing and edging in one appointment, you save time and money.\\n The polished look achieved with this package enhances curb appeal and leaves your property looking its absolute best.\",\"categoriesName\":\"Lawn Care & Maintenance\",\"trendingServices\":\"true\",\"popularServices\":\"true\"}')),
    ServicesModelStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"3\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/g7h59v3dzp8m/s15.png\",\"name\":\"Lawn Aeration Treatment\",\"reviews\":\"4.2 (120 reviews)\",\"duration\":\"1.5 hours\",\"price\":\"90\",\"description\":\"Aeration is essential for promoting healthy root growth and improving water and nutrient absorption. This service uses professional aerators to create small holes in your lawn, allowing oxygen and moisture to penetrate compacted soil.\\n Over time, soil compaction reduces the health of your lawn, causing thin, patchy grass. Aeration combats this by revitalizing the root system and encouraging thicker turf growth.\\n We recommend this service twice a year, especially in spring and fall, to maximize effectiveness. Combining aeration with overseeding or fertilization delivers even greater results.\\n A properly aerated lawn becomes more drought-resistant, pest-resistant, and vibrant in appearance.\",\"categoriesName\":\"Lawn Care & Maintenance\",\"trendingServices\":\"true\",\"popularServices\":\"true\",\"suggestedService\":\"true\"}')),
    ServicesModelStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"4\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/u7g6lv2cjlim/s19.png\",\"name\":\"Seasonal Fertilization Program\",\"reviews\":\"4.2 (120 reviews)\",\"duration\":\"1 hour\",\"price\":\"80\",\"description\":\"Fertilization is key to providing your lawn with the nutrients it needs to thrive year-round. Our seasonal program applies slow-release fertilizers tailored to each season’s requirements.\\n This service promotes deeper root growth, greener grass, and improved resistance against stress factors like heat or pests. By scheduling multiple sessions annually, you ensure your lawn receives balanced nutrition.\\n We customize fertilizer blends to suit soil conditions and grass types for maximum effectiveness. Clients often notice significant improvement in just a few weeks.\\n With professional fertilization, your lawn maintains long-term health, beauty, and resilience.\",\"categoriesName\":\"Lawn Care & Maintenance\",\"trendingServices\":\"true\",\"popularServices\":\"true\"}')),
    ServicesModelStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"5\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/eogrqe487wn1/s20.png\",\"name\":\"Weed Control Service\",\"reviews\":\"4.2 (120 reviews)\",\"duration\":\"45 min\",\"price\":\"50\",\"description\":\"Uncontrolled weeds can choke out healthy grass and ruin the appearance of your lawn. Our targeted weed control service addresses both broadleaf and grassy weeds.\\n We use eco-safe herbicides that are tough on weeds but gentle on your turf, ensuring lasting results. By eliminating invasive growth, your grass has more room and nutrients to flourish.\\n This service is perfect for seasonal cleanups or tackling persistent weed issues. It can be combined with mowing, aeration, or fertilization for comprehensive care.\\n A weed-free lawn is not only more attractive but also healthier and easier to maintain long term.\",\"categoriesName\":\"Lawn Care & Maintenance\",\"trendingServices\":\"true\",\"popularServices\":\"false\",\"suggestedService\":\"true\"}')),
    ServicesModelStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"6\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/fseae5pyol5c/s17.png\",\"name\":\"Flower Bed Planting & Design\",\"reviews\":\"4.2 (120 reviews)\",\"duration\":\"2 hours\",\"price\":\"120\",\"description\":\"Flower beds add vibrant color and charm to any outdoor space. Our planting and design service helps you select seasonal flowers that thrive in your climate and soil type. We prepare the soil, arrange plants for maximum appeal, and provide finishing touches like mulch.\\n Our team ensures plants are spaced correctly for healthy growth while maximizing visual impact. Whether you prefer bright annuals, elegant perennials, or a mix of both, we customize the design to suit your style.\\n This service is perfect for homeowners looking to refresh their gardens in spring or enhance curb appeal year-round.\\n A well-designed flower bed not only beautifies your property but also creates a welcoming atmosphere.\",\"categoriesName\":\"Garden Care & Planting\",\"trendingServices\":\"true\",\"popularServices\":\"true\"}')),
    ServicesModelStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"7\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/w1iv2b24ui25/s18.png\",\"name\":\"Tree & Shrub Planting\",\"reviews\":\"4.2 (120 reviews)\",\"duration\":\"2.5 hours\",\"price\":\"150\",\"description\":\"Trees and shrubs form the backbone of any landscape. Our planting service includes soil preparation, professional planting, and guidance on long-term care. We select species suited to your yard’s conditions and your aesthetic goals.\\n Proper planting ensures strong root establishment, reducing the risk of disease or poor growth. Our experts handle everything from hole depth to mulching and initial watering.\\n This service is suitable for both new landscapes and upgrades to existing gardens. Clients often choose it to add privacy, shade, or seasonal interest to their property.\\n With professional planting, your garden investment thrives for years to come.\",\"categoriesName\":\"Garden Care & Planting\",\"trendingServices\":\"false\",\"popularServices\":\"true\",\"suggestedService\":\"true\"}')),
    ServicesModelStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"8\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/np3f0m0tso0f/s16.png\",\"name\":\"Hedge Trimming & Shaping\",\"reviews\":\"4.4 (150 reviews)\",\"duration\":\"1.5 hours\",\"price\":\"70\",\"description\":\"Hedges require regular maintenance to maintain their structure and health. Our trimming and shaping service keeps hedges neat, proportional, and free from overgrowth.\\n We use precision tools to sculpt hedges into clean lines or decorative shapes, depending on your preference. Regular trimming also encourages denser foliage and reduces the risk of pests.\\n This service is ideal for formal gardens, property borders, or ornamental designs. Homeowners can choose from light touch-ups to complete reshaping sessions.\\n A well-trimmed hedge enhances privacy, aesthetics, and the overall harmony of your landscape.\",\"categoriesName\":\"Garden Care & Planting\",\"trendingServices\":\"false\",\"popularServices\":\"true\"}')),
    ServicesModelStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"9\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/9bkqyayc6mm6/s14.png\",\"name\":\"Garden Mulching Service\",\"reviews\":\"4.2 (120 reviews)\",\"duration\":\"1 hour\",\"price\":\"60\",\"description\":\"Mulching is an essential practice for maintaining soil health and controlling weeds. Our garden mulching service applies organic or decorative mulch around plants, trees, and flower beds.\\n Mulch retains moisture, moderates soil temperature, and improves overall soil structure. It also reduces weed growth, minimizing the need for constant maintenance.\\n Clients may choose from a variety of mulch types, including bark, wood chips, or colored mulch to complement their landscape design.\\n This service improves both the appearance and health of your garden, providing benefits throughout the season.\",\"categoriesName\":\"Garden Care & Planting\",\"trendingServices\":\"false\",\"popularServices\":\"true\"}')),
    ServicesModelStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"10\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/7yxe7hzgqup0/s13.png\",\"name\":\"Seasonal Flower Replacement\",\"reviews\":\"4.4 (150 reviews)\",\"duration\":\"1.5 hours\",\"price\":\"90\",\"description\":\"Seasonal flowers bring fresh life and beauty to your garden. Our replacement service removes fading plants and installs vibrant new varieties suited to the current season.\\n We recommend spring blooms for brightness, summer varieties for durability, and autumn options for rich colors. Our team ensures plants are acclimated properly for longer-lasting impact.\\n This service is perfect for homeowners who want a fresh look several times a year without the hassle of managing it themselves.\\n By refreshing your garden seasonally, you maintain visual appeal and keep your outdoor space lively year-round.\",\"categoriesName\":\"Garden Care & Planting\",\"trendingServices\":\"false\",\"popularServices\":\"true\",\"suggestedService\":\"true\"}')),
    ServicesModelStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"11\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/akhqm82j5ty6/s8.png\",\"name\":\"Tree Pruning Service\",\"reviews\":\"4.2 (120 reviews)\",\"duration\":\"2 hours\",\"price\":\"130\",\"description\":\"Pruning is vital for tree health and safety. Our tree pruning service removes dead, diseased, or overgrown branches while shaping the canopy for balanced growth.\\n Proper pruning enhances air circulation and sunlight penetration, reducing the risk of disease and storm damage. It also improves the overall appearance of your trees.\\n This service is recommended annually, especially for ornamental or fruit-bearing trees. Our arborists follow safe and effective techniques for long-term tree vitality.\\n Healthy, well-pruned trees add beauty and value to your property.\",\"categoriesName\":\"Tree Care & Arborist Services\",\"trendingServices\":\"false\",\"popularServices\":\"true\"}')),
    ServicesModelStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"12\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/33ukr0w4xy0j/s2.png\",\"name\":\"Emergency Tree Removal\",\"reviews\":\"4.4 (150 reviews)\",\"duration\":\"3 hours\",\"price\":\"250\",\"description\":\"Storms, high winds, or disease can cause trees to become hazards. Our emergency removal service safely eliminates damaged or fallen trees to protect your property.\\n We use professional equipment and safety protocols to minimize risk during removal. This service is available for urgent needs or scheduled clearances.\\n In addition to removal, we also provide stump grinding or hauling as add-ons. Our team ensures your yard is clean and safe after the process.\\n By acting quickly, you prevent accidents and restore the safety of your outdoor space.\",\"categoriesName\":\"Tree Care & Arborist Services\",\"trendingServices\":\"false\",\"popularServices\":\"true\"}')),
    ServicesModelStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"13\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/fo1hfh0tbcpr/s9.png\",\"name\":\"Tree Health Inspection\",\"reviews\":\"4.7 (120 reviews)\",\"duration\":\"1.5 hours\",\"price\":\"110\",\"description\":\"Our arborists provide detailed health inspections to identify diseases, pests, or growth issues. Early detection prevents costly damage and keeps your trees strong.\\n We evaluate soil conditions, root structure, and canopy development. Based on findings, we recommend treatments such as fertilization, pruning, or pest control.\\n This service is ideal for large properties with multiple trees or for clients concerned about declining growth. Healthy trees not only last longer but also contribute to a thriving landscape ecosystem.\",\"categoriesName\":\"Tree Care & Arborist Services\",\"trendingServices\":\"true\",\"popularServices\":\"false\"}')),
    ServicesModelStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"14\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/2nm9e4rmegqi/s1.png\",\"name\":\"Stump Grinding & Removal\",\"reviews\":\"4.6 (240 reviews)\",\"duration\":\"2 hours\",\"price\":\"180\",\"description\":\"Tree stumps can be unsightly, hazardous, and prone to attracting pests. Our stump grinding service removes them quickly and efficiently.\\n We grind stumps below ground level, leaving the area ready for replanting or landscaping. The process is safe, fast, and minimizes lawn disruption.\\n This service is particularly useful after tree removal or when reclaiming outdoor space.\\n By eliminating stumps, you restore safety and enhance the beauty of your yard.\",\"categoriesName\":\"Tree Care & Arborist Services\",\"trendingServices\":\"true\",\"popularServices\":\"false\",\"suggestedService\":\"true\"}')),
    ServicesModelStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"15\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/thfm6oa04a7h/s11.png\",\"name\":\"Fruit Tree Care & Maintenance\",\"reviews\":\"4.2 (120 reviews)\",\"duration\":\"2 hours\",\"price\":\"140\",\"description\":\"Fruit trees require specialized care to maximize yield and longevity. Our service includes pruning, fertilizing, and pest management tailored to fruit-bearing species.\\n We help homeowners grow healthier, more productive trees while maintaining their appearance. Proper care ensures better harvests and reduces the risk of disease.\\n This service is best scheduled seasonally to align with growth and fruiting cycles.\\n A well-maintained fruit tree provides not only beauty but also a rewarding harvest.\",\"categoriesName\":\"Tree Care & Arborist Services\",\"trendingServices\":\"true\",\"popularServices\":\"false\",\"suggestedService\":\"true\"}')),
    ServicesModelStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"16\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/gbkpndodu12y/s10.png\",\"name\":\"Landscape Design Consultation\",\"reviews\":\"4.2 (120 reviews)\",\"duration\":\"2 hours\",\"price\":\"200\",\"description\":\"Every beautiful yard begins with a strong design. Our consultation service helps you plan the perfect layout for your outdoor space. We discuss your goals, style preferences, and budget to create a tailored design.\\n Our experts consider factors like plant selection, lighting, pathways, and water features. The result is a cohesive plan that enhances both beauty and functionality.\\n This service is ideal for new homeowners or anyone looking to completely revamp their garden.\\n A professional design ensures long-term value and harmony for your landscape.\",\"categoriesName\":\"Landscaping & Outdoor Design\",\"trendingServices\":\"true\",\"popularServices\":\"false\"}')),
    ServicesModelStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"17\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/pulqslueexre/s6.png\",\"name\":\"Hardscape Installation (Patios & Pathways)\",\"reviews\":\"4.2 (120 reviews)\",\"duration\":\"4 hours\",\"price\":\"400\",\"description\":\"Hardscapes add structure and durability to your outdoor living areas. Our installation service includes patios, stone pathways, and decorative borders.\\n We use high-quality materials such as pavers, flagstone, or gravel to suit your design preferences. Proper installation ensures longevity and minimal maintenance.\\n This service creates inviting areas for entertaining, walking, or simply enjoying your garden.\\n A well-installed hardscape adds elegance, functionality, and property value.\",\"categoriesName\":\"Landscaping & Outdoor Design\",\"trendingServices\":\"true\",\"popularServices\":\"false\",\"suggestedService\":\"true\"}')),
    ServicesModelStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"18\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/eqfqqye3k5xe/s5.png\",\"name\":\"Water Feature Installation\",\"reviews\":\"4.2 (120 reviews)\",\"duration\":\"5 hours\",\"price\":\"500\",\"description\":\"Water features bring tranquility and elegance to any landscape. Our service includes the installation of fountains, ponds, or small waterfalls.\\n We ensure proper placement, plumbing, and maintenance guidance for long-lasting operation. Eco-friendly options like solar-powered fountains are also available.\\n This service is popular for homeowners seeking a relaxing retreat in their backyard.The soothing sound of water creates a calming atmosphere while boosting curb appeal.\",\"categoriesName\":\"Landscaping & Outdoor Design\",\"trendingServices\":\"true\",\"popularServices\":\"false\",\"suggestedService\":\"true\"}')),
    ServicesModelStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"19\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/thfm6oa04a7h/s11.png\",\"name\":\"Rock Garden Design & Installation\",\"reviews\":\"4.2 (120 reviews)\",\"duration\":\"3 hours\",\"price\":\"250\",\"description\":\"Rock gardens combine low-maintenance beauty with natural textures. Our design service integrates rocks, drought-tolerant plants, and decorative gravel.\\n They are perfect for areas with poor soil or for clients seeking unique, modern aesthetics. Rock gardens also reduce maintenance needs compared to traditional gardens.\\n We carefully balance rock placement with plant selection for maximum visual appeal.\\n A rock garden adds character and charm, while conserving water and effort.\",\"categoriesName\":\"Landscaping & Outdoor Design\",\"trendingServices\":\"true\",\"popularServices\":\"true\",\"suggestedService\":\"false\"}')),
    ServicesModelStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"20\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/xjf1t0eeq3ak/s4.png\",\"name\":\"Outdoor Lighting Setup\",\"reviews\":\"4.5 (129 reviews)\",\"duration\":\"2.5 hours\",\"price\":\"220\",\"description\":\"Proper lighting transforms your outdoor space at night. Our installation includes pathway lights, spotlights for trees, and accent lighting for patios.\\n We use energy-efficient LED systems to reduce costs while providing brilliant illumination. Timers and smart controls are also available for added convenience.\\n This service improves safety, usability, and aesthetics of your garden.\\n With professional lighting, your landscape shines beautifully day and night.\",\"categoriesName\":\"Landscaping & Outdoor Design\",\"trendingServices\":\"false\",\"popularServices\":\"true\",\"suggestedService\":\"true\"}')),
    ServicesModelStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"21\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/gwpezm0hg47c/s3.png\",\"name\":\"Spring Yard Cleanup\",\"reviews\":\"4.2 (120 reviews)\",\"duration\":\"3 hours\",\"price\":\"180\",\"description\":\"Spring cleanup prepares your yard for the growing season. This service includes debris removal, pruning, lawn dethatching, and mulching.\\n We restore your garden after winter stress, promoting new growth and freshness. Our team also inspects for early pest or disease issues.\\n It’s an essential service for homeowners wanting a healthy start to the season.\\n Your outdoor space becomes clean, lively, and ready for spring planting.\",\"categoriesName\":\"Seasonal & Specialized Services\",\"trendingServices\":\"false\",\"popularServices\":\"true\",\"suggestedService\":\"false\"}')),
    ServicesModelStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"22\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/7yxe7hzgqup0/s13.png\",\"name\":\"Fall Leaf Removal\",\"reviews\":\"4.3 (120 reviews)\",\"duration\":\"2.5 hours\",\"price\":\"150\",\"description\":\"Falling leaves can smother your lawn and create a messy appearance. Our service clears leaves from lawns, gardens, and gutters.\\n We use blowers, rakes, and eco-friendly disposal methods to leave your yard spotless. Regular removal prevents mold, pests, and suffocated grass.\\n This service is best scheduled multiple times during autumn for lasting results.\\n Your lawn remains healthy while your property looks neat and inviting.\",\"categoriesName\":\"Seasonal & Specialized Services\",\"trendingServices\":\"true\",\"popularServices\":\"false\",\"suggestedService\":\"true\"}')),
    ServicesModelStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"23\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/9bkqyayc6mm6/s14.png\",\"name\":\"Snow Removal (Driveway & Pathways)\",\"reviews\":\"4.2 (120 reviews)\",\"duration\":\"2 hours\",\"price\":\"120\",\"description\":\"Winter snow can be both hazardous and inconvenient. Our snow removal service clears driveways, sidewalks, and pathways for safety and accessibility.\\n We use shovels, blowers, and eco-safe de-icing solutions to minimize surface damage. Quick response ensures you can move freely even after heavy snowfall.This service is particularly useful for elderly homeowners or busy families.\\n A clear, safe property helps you enjoy winter without the hassle.\",\"categoriesName\":\"Seasonal & Specialized Services\",\"trendingServices\":\"false\",\"popularServices\":\"true\",\"suggestedService\":\"true\"}')),
    ServicesModelStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"24\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/np3f0m0tso0f/s16.png\",\"name\":\"Seasonal Garden Decorations\",\"reviews\":\"4.2 (128 reviews)\",\"duration\":\"2 hours\",\"price\":\"100\",\"description\":\"Celebrate holidays with professional garden decorations. We install lights, wreaths, ornaments, or themed garden accents.\\n Our team customizes designs for Christmas, Halloween, or other special occasions. Safe installation and timely removal are included.\\n This service adds festive spirit without stress or risk.\\n Your garden becomes a joyful centerpiece during any celebration.\",\"categoriesName\":\"Seasonal & Specialized Services\",\"trendingServices\":\"false\",\"popularServices\":\"true\",\"suggestedService\":\"false\"}')),
    ServicesModelStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"25\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/fseae5pyol5c/s17.png\",\"name\":\"Irrigation System Setup & Maintenance\",\"reviews\":\"4.2 (155 reviews)\",\"duration\":\" 3 hours\",\"price\":\"200\",\"description\":\"Watering efficiency is crucial for garden health. Our irrigation service installs or maintains drip systems, sprinklers, or smart controllers.\\n We design layouts tailored to your plants’ needs, ensuring water conservation. Regular maintenance prevents leaks and uneven watering.\\n This service saves time while reducing water bills and environmental impact.\\n An efficient irrigation system guarantees lush greenery year-round.\",\"categoriesName\":\"Seasonal & Specialized Services\",\"trendingServices\":\"true\",\"popularServices\":\"true\",\"suggestedService\":\"false\"}')),
    ServicesModelStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"26\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/eogrqe487wn1/s20.png\",\"name\":\"Sod Installation (New Lawn)\",\"reviews\":\"4.2 (120 reviews)\",\"duration\":\"4 hours\",\"price\":\"350\",\"description\":\"For an instant green lawn, sod installation is the best choice. Our service includes soil preparation, sod laying, and initial watering guidance.\\n We ensure tight seams and proper rooting for long-lasting results. Sod provides immediate beauty while reducing erosion risks.\\n This service is ideal for new homes or lawn replacements.\\n A fresh, lush lawn instantly boosts curb appeal.\",\"categoriesName\":\"Specialized Lawn & Garden Enhancements\",\"trendingServices\":\"false\",\"popularServices\":\"true\",\"suggestedService\":\"false\"}')),
    ServicesModelStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"27\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/u7g6lv2cjlim/s19.png\",\"name\":\"Artificial Turf Installation\",\"reviews\":\"4.2 (120 reviews)\",\"duration\":\"5 hours\",\"price\":\"600\",\"description\":\"Artificial turf offers a low-maintenance alternative to natural grass. Our installation includes ground leveling, turf laying, and infill application.\\n It’s pet-friendly, durable, and ideal for high-traffic areas. Clients enjoy a green lawn without mowing, watering, or fertilizing.\\n This service is popular for families, play areas, or businesses seeking cost efficiency.\\n Artificial turf guarantees a pristine look year-round.\",\"categoriesName\":\"Specialized Lawn & Garden Enhancements\",\"trendingServices\":\"false\",\"popularServices\":\"true\",\"suggestedService\":\"true\"}')),
    ServicesModelStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"28\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/g7h59v3dzp8m/s15.png\",\"name\":\"Vertical Garden Installation\",\"reviews\":\"4.2 (120 reviews)\",\"duration\":\"3 hours\",\"price\":\"280\",\"description\":\"Vertical gardens maximize greenery in small spaces. Our service installs wall-mounted planters or living panels for a unique effect.\\n They are perfect for balconies, patios, or modern landscape designs. We use lightweight, durable systems suited for various plant types.This service adds visual impact while improving air quality.\\n A vertical garden is a stylish and eco-friendly solution for compact areas.\",\"categoriesName\":\"Specialized Lawn & Garden Enhancements\",\"trendingServices\":\"false\",\"popularServices\":\"false\",\"suggestedService\":\"true\"}')),
    ServicesModelStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"29\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/ekxwavn00bu4/s12.png\",\"name\":\"Organic Pest Control Treatment\",\"reviews\":\"4.2 (120 reviews)\",\"duration\":\"1.5 hours\",\"price\":\"110\",\"description\":\"Pests can damage lawns and gardens if left unchecked. Our organic pest control uses eco-friendly solutions to target harmful insects.\\n We avoid harsh chemicals, protecting beneficial organisms and the environment. Treatments are safe for pets, children, and plants.\\n This service prevents infestations and ensures plant vitality.\\n With organic methods, you enjoy a healthy garden naturally.\",\"categoriesName\":\"Specialized Lawn & Garden Enhancements\",\"trendingServices\":\"true\",\"popularServices\":\"true\",\"suggestedService\":\"false\"}')),
    ServicesModelStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"30\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/ri61njf5iu0m/s7.png\",\"name\":\"Greenhouse Setup Consultation\",\"reviews\":\"4.2 (120 reviews)\",\"duration\":\"2 hours\",\"price\":\"240\",\"description\":\"A greenhouse allows year-round gardening regardless of weather. Our consultation service guides you on size, materials, and placement.\\n We provide expert advice on ventilation, irrigation, and plant selection. This ensures optimal productivity and sustainability.\\n This service is ideal for hobbyists or serious gardeners.\\n With a greenhouse, your gardening potential expands beyond seasons.\",\"categoriesName\":\"Specialized Lawn & Garden Enhancements\",\"trendingServices\":\"true\",\"popularServices\":\"false\",\"suggestedService\":\"true\"}'))
  ];
  List<ServicesModelStruct> get allServicesList => _allServicesList;
  set allServicesList(List<ServicesModelStruct> value) {
    _allServicesList = value;
  }

  void addToAllServicesList(ServicesModelStruct value) {
    allServicesList.add(value);
  }

  void removeFromAllServicesList(ServicesModelStruct value) {
    allServicesList.remove(value);
  }

  void removeAtIndexFromAllServicesList(int index) {
    allServicesList.removeAt(index);
  }

  void updateAllServicesListAtIndex(
    int index,
    ServicesModelStruct Function(ServicesModelStruct) updateFn,
  ) {
    allServicesList[index] = updateFn(_allServicesList[index]);
  }

  void insertAtIndexInAllServicesList(int index, ServicesModelStruct value) {
    allServicesList.insert(index, value);
  }

  List<BannerModelStruct> _bannerList = [
    BannerModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/5mup4uckhbx4/Banner1.png\"}')),
    BannerModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/42ybuozsj9j0/Banner2.png\"}')),
    BannerModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/al97xzr7rmxx/Banner3.png\"}'))
  ];
  List<BannerModelStruct> get bannerList => _bannerList;
  set bannerList(List<BannerModelStruct> value) {
    _bannerList = value;
  }

  void addToBannerList(BannerModelStruct value) {
    bannerList.add(value);
  }

  void removeFromBannerList(BannerModelStruct value) {
    bannerList.remove(value);
  }

  void removeAtIndexFromBannerList(int index) {
    bannerList.removeAt(index);
  }

  void updateBannerListAtIndex(
    int index,
    BannerModelStruct Function(BannerModelStruct) updateFn,
  ) {
    bannerList[index] = updateFn(_bannerList[index]);
  }

  void insertAtIndexInBannerList(int index, BannerModelStruct value) {
    bannerList.insert(index, value);
  }

  List<ReviewModelStruct> _reviewAllList = [];
  List<ReviewModelStruct> get reviewAllList => _reviewAllList;
  set reviewAllList(List<ReviewModelStruct> value) {
    _reviewAllList = value;
    prefs.setStringList(
        'ff_reviewAllList', value.map((x) => x.serialize()).toList());
  }

  void addToReviewAllList(ReviewModelStruct value) {
    reviewAllList.add(value);
    prefs.setStringList(
        'ff_reviewAllList', _reviewAllList.map((x) => x.serialize()).toList());
  }

  void removeFromReviewAllList(ReviewModelStruct value) {
    reviewAllList.remove(value);
    prefs.setStringList(
        'ff_reviewAllList', _reviewAllList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromReviewAllList(int index) {
    reviewAllList.removeAt(index);
    prefs.setStringList(
        'ff_reviewAllList', _reviewAllList.map((x) => x.serialize()).toList());
  }

  void updateReviewAllListAtIndex(
    int index,
    ReviewModelStruct Function(ReviewModelStruct) updateFn,
  ) {
    reviewAllList[index] = updateFn(_reviewAllList[index]);
    prefs.setStringList(
        'ff_reviewAllList', _reviewAllList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInReviewAllList(int index, ReviewModelStruct value) {
    reviewAllList.insert(index, value);
    prefs.setStringList(
        'ff_reviewAllList', _reviewAllList.map((x) => x.serialize()).toList());
  }

  List<PaymentMethodModelStruct> _paymentMethodList = [
    PaymentMethodModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/car-services-f1godk/assets/818kzc2pjkxd/paypal.png\",\"name\":\"Paypal\"}')),
    PaymentMethodModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/ezt8qq5me4br/g_pay.png\",\"name\":\"G Pay\"}')),
    PaymentMethodModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/car-services-f1godk/assets/ck5ji57azqwr/stripe.png\",\"name\":\"Stripe\"}')),
    PaymentMethodModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/car-services-f1godk/assets/t0a2tii3irow/razor_pay.png\",\"name\":\"Razor pay\"}'))
  ];
  List<PaymentMethodModelStruct> get paymentMethodList => _paymentMethodList;
  set paymentMethodList(List<PaymentMethodModelStruct> value) {
    _paymentMethodList = value;
  }

  void addToPaymentMethodList(PaymentMethodModelStruct value) {
    paymentMethodList.add(value);
  }

  void removeFromPaymentMethodList(PaymentMethodModelStruct value) {
    paymentMethodList.remove(value);
  }

  void removeAtIndexFromPaymentMethodList(int index) {
    paymentMethodList.removeAt(index);
  }

  void updatePaymentMethodListAtIndex(
    int index,
    PaymentMethodModelStruct Function(PaymentMethodModelStruct) updateFn,
  ) {
    paymentMethodList[index] = updateFn(_paymentMethodList[index]);
  }

  void insertAtIndexInPaymentMethodList(
      int index, PaymentMethodModelStruct value) {
    paymentMethodList.insert(index, value);
  }

  List<ReviewModelStruct> _myReviewsList = [];
  List<ReviewModelStruct> get myReviewsList => _myReviewsList;
  set myReviewsList(List<ReviewModelStruct> value) {
    _myReviewsList = value;
    prefs.setStringList(
        'ff_myReviewsList', value.map((x) => x.serialize()).toList());
  }

  void addToMyReviewsList(ReviewModelStruct value) {
    myReviewsList.add(value);
    prefs.setStringList(
        'ff_myReviewsList', _myReviewsList.map((x) => x.serialize()).toList());
  }

  void removeFromMyReviewsList(ReviewModelStruct value) {
    myReviewsList.remove(value);
    prefs.setStringList(
        'ff_myReviewsList', _myReviewsList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromMyReviewsList(int index) {
    myReviewsList.removeAt(index);
    prefs.setStringList(
        'ff_myReviewsList', _myReviewsList.map((x) => x.serialize()).toList());
  }

  void updateMyReviewsListAtIndex(
    int index,
    ReviewModelStruct Function(ReviewModelStruct) updateFn,
  ) {
    myReviewsList[index] = updateFn(_myReviewsList[index]);
    prefs.setStringList(
        'ff_myReviewsList', _myReviewsList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInMyReviewsList(int index, ReviewModelStruct value) {
    myReviewsList.insert(index, value);
    prefs.setStringList(
        'ff_myReviewsList', _myReviewsList.map((x) => x.serialize()).toList());
  }

  List<StaffMemberModelStruct> _selectSpecialistsList = [
    StaffMemberModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/6mqbkadolmrs/sp1.png\",\"title\":\"Maria schleifer\",\"catName\":\"Garden Care & Planting\"}')),
    StaffMemberModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/ijia1lxsjx26/sp2.png\",\"title\":\"Alexander Luxe\",\"catName\":\"Landscaping & Outdoor Design\"}')),
    StaffMemberModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/7z9v0wtb3sx9/sp3.png\",\"title\":\"James Sterling\",\"catName\":\"Landscaping & Outdoor Design\"}')),
    StaffMemberModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/7z9v0wtb3sx9/sp3.png\",\"title\":\"Maria schleifer\",\"catName\":\"General Dentistry\"}')),
    StaffMemberModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/ijia1lxsjx26/sp2.png\",\"title\":\"Alexander Luxe\",\"catName\":\"Cosmetic\"}')),
    StaffMemberModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/6mqbkadolmrs/sp1.png\",\"title\":\"James Sterling\",\"catName\":\"Restorative\"}'))
  ];
  List<StaffMemberModelStruct> get selectSpecialistsList =>
      _selectSpecialistsList;
  set selectSpecialistsList(List<StaffMemberModelStruct> value) {
    _selectSpecialistsList = value;
  }

  void addToSelectSpecialistsList(StaffMemberModelStruct value) {
    selectSpecialistsList.add(value);
  }

  void removeFromSelectSpecialistsList(StaffMemberModelStruct value) {
    selectSpecialistsList.remove(value);
  }

  void removeAtIndexFromSelectSpecialistsList(int index) {
    selectSpecialistsList.removeAt(index);
  }

  void updateSelectSpecialistsListAtIndex(
    int index,
    StaffMemberModelStruct Function(StaffMemberModelStruct) updateFn,
  ) {
    selectSpecialistsList[index] = updateFn(_selectSpecialistsList[index]);
  }

  void insertAtIndexInSelectSpecialistsList(
      int index, StaffMemberModelStruct value) {
    selectSpecialistsList.insert(index, value);
  }

  CartModelStruct _cartDetail = CartModelStruct();
  CartModelStruct get cartDetail => _cartDetail;
  set cartDetail(CartModelStruct value) {
    _cartDetail = value;
    prefs.setString('ff_cartDetail', value.serialize());
  }

  void updateCartDetailStruct(Function(CartModelStruct) updateFn) {
    updateFn(_cartDetail);
    prefs.setString('ff_cartDetail', _cartDetail.serialize());
  }

  List<AddTimeModelStruct> _availableTimeSlots = [
    AddTimeModelStruct.fromSerializableMap(jsonDecode(
        '{\"type\":\"Morning\",\"time\":\"[\\\"{\\\\\\\"time\\\\\\\":\\\\\\\"08:00AM\\\\\\\",\\\\\\\"isDone\\\\\\\":\\\\\\\"false\\\\\\\"}\\\",\\\"{\\\\\\\"time\\\\\\\":\\\\\\\"09:00AM\\\\\\\",\\\\\\\"isDone\\\\\\\":\\\\\\\"false\\\\\\\"}\\\",\\\"{\\\\\\\"time\\\\\\\":\\\\\\\"10:00AM\\\\\\\",\\\\\\\"isDone\\\\\\\":\\\\\\\"false\\\\\\\"}\\\",\\\"{\\\\\\\"time\\\\\\\":\\\\\\\"11:00AM\\\\\\\",\\\\\\\"isDone\\\\\\\":\\\\\\\"true\\\\\\\"}\\\",\\\"{\\\\\\\"time\\\\\\\":\\\\\\\"12:00PM\\\\\\\",\\\\\\\"isDone\\\\\\\":\\\\\\\"false\\\\\\\"}\\\"]\"}')),
    AddTimeModelStruct.fromSerializableMap(jsonDecode(
        '{\"type\":\"Afternoon\",\"time\":\"[\\\"{\\\\\\\"time\\\\\\\":\\\\\\\"03:00PM\\\\\\\",\\\\\\\"isDone\\\\\\\":\\\\\\\"false\\\\\\\"}\\\",\\\"{\\\\\\\"time\\\\\\\":\\\\\\\"04:00PM\\\\\\\",\\\\\\\"isDone\\\\\\\":\\\\\\\"true\\\\\\\"}\\\",\\\"{\\\\\\\"time\\\\\\\":\\\\\\\"05:00PM\\\\\\\",\\\\\\\"isDone\\\\\\\":\\\\\\\"false\\\\\\\"}\\\"]\"}')),
    AddTimeModelStruct.fromSerializableMap(jsonDecode(
        '{\"type\":\"Evening\",\"time\":\"[\\\"{\\\\\\\"time\\\\\\\":\\\\\\\"06:00PM\\\\\\\",\\\\\\\"isDone\\\\\\\":\\\\\\\"true\\\\\\\"}\\\",\\\"{\\\\\\\"time\\\\\\\":\\\\\\\"08:00PM\\\\\\\",\\\\\\\"isDone\\\\\\\":\\\\\\\"false\\\\\\\"}\\\"]\"}'))
  ];
  List<AddTimeModelStruct> get availableTimeSlots => _availableTimeSlots;
  set availableTimeSlots(List<AddTimeModelStruct> value) {
    _availableTimeSlots = value;
  }

  void addToAvailableTimeSlots(AddTimeModelStruct value) {
    availableTimeSlots.add(value);
  }

  void removeFromAvailableTimeSlots(AddTimeModelStruct value) {
    availableTimeSlots.remove(value);
  }

  void removeAtIndexFromAvailableTimeSlots(int index) {
    availableTimeSlots.removeAt(index);
  }

  void updateAvailableTimeSlotsAtIndex(
    int index,
    AddTimeModelStruct Function(AddTimeModelStruct) updateFn,
  ) {
    availableTimeSlots[index] = updateFn(_availableTimeSlots[index]);
  }

  void insertAtIndexInAvailableTimeSlots(int index, AddTimeModelStruct value) {
    availableTimeSlots.insert(index, value);
  }

  List<CouponCodeModelStruct> _couponCodeList = [
    CouponCodeModelStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"1\",\"code\":\"NAILLOVE\",\"description\":\"Get 20% off your next manicure session!\",\"couponCheck\":\"Use code\"}')),
    CouponCodeModelStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"2\",\"code\":\"FRENCHSTYLE\",\"description\":\"Save big on French manicure services today!\",\"couponCheck\":\"Expired\"}')),
    CouponCodeModelStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"3\",\"code\":\"GLAMNAILS\",\"description\":\"Enjoy free nail art on your first booking!\",\"couponCheck\":\"Use code\"}'))
  ];
  List<CouponCodeModelStruct> get couponCodeList => _couponCodeList;
  set couponCodeList(List<CouponCodeModelStruct> value) {
    _couponCodeList = value;
  }

  void addToCouponCodeList(CouponCodeModelStruct value) {
    couponCodeList.add(value);
  }

  void removeFromCouponCodeList(CouponCodeModelStruct value) {
    couponCodeList.remove(value);
  }

  void removeAtIndexFromCouponCodeList(int index) {
    couponCodeList.removeAt(index);
  }

  void updateCouponCodeListAtIndex(
    int index,
    CouponCodeModelStruct Function(CouponCodeModelStruct) updateFn,
  ) {
    couponCodeList[index] = updateFn(_couponCodeList[index]);
  }

  void insertAtIndexInCouponCodeList(int index, CouponCodeModelStruct value) {
    couponCodeList.insert(index, value);
  }

  List<FAQsModelStruct> _faqList = [
    FAQsModelStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"What services does the app provide?\",\"description\":\"Our app connects you with professional gardeners and landscapers for lawn care, garden design, tree trimming, irrigation system installation, and complete landscaping solutions.\"}')),
    FAQsModelStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"How do I book a service?\",\"description\":\"Simply browse available services, select your preferred date and time, and confirm your booking through the app. You’ll receive instant confirmation and booking details.\"}')),
    FAQsModelStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Can I get a custom garden or landscape design?\",\"description\":\"Yes! Our experts can create personalized garden and landscape designs based on your preferences, budget, and space.\"}')),
    FAQsModelStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Do you provide maintenance packages?\",\"description\":\"Absolutely. You can choose one-time services or subscribe to weekly, monthly, or seasonal maintenance packages for hassle-free care.\"}')),
    FAQsModelStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"How are the service providers verified?\",\"description\":\"All professionals are background-checked, experienced, and vetted to ensure high-quality and reliable services.\"}')),
    FAQsModelStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Can I track the status of my booking?\",\"description\":\"Yes, you can track your booking in real-time within the app and get updates about service provider arrival and completion.\"}')),
    FAQsModelStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"What payment methods are accepted?\",\"description\":\"We accept secure payments via credit/debit cards, UPI, net banking, and popular digital wallets.\"}')),
    FAQsModelStruct.fromSerializableMap(jsonDecode(
        '{\"title\":\"Can I reschedule or cancel a booking?\",\"description\":\"Yes, you can reschedule or cancel from the app within the allowed time frame mentioned in the cancellation policy.\"}'))
  ];
  List<FAQsModelStruct> get faqList => _faqList;
  set faqList(List<FAQsModelStruct> value) {
    _faqList = value;
  }

  void addToFaqList(FAQsModelStruct value) {
    faqList.add(value);
  }

  void removeFromFaqList(FAQsModelStruct value) {
    faqList.remove(value);
  }

  void removeAtIndexFromFaqList(int index) {
    faqList.removeAt(index);
  }

  void updateFaqListAtIndex(
    int index,
    FAQsModelStruct Function(FAQsModelStruct) updateFn,
  ) {
    faqList[index] = updateFn(_faqList[index]);
  }

  void insertAtIndexInFaqList(int index, FAQsModelStruct value) {
    faqList.insert(index, value);
  }

  List<BlogModelStruct> _blogList = [
    BlogModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/1crzyyw8h5p7/b1.png\",\"title\":\"Eco-Friendly Gardening Practices...\",\"description\":\"By using organic compost, rainwater harvesting systems, native plants, and natural pest control, you can maintain a healthy.\",\"createAt\":\"10 Sep,2025\"}')),
    BlogModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/4n258izor3rw/b2.png\",\"title\":\"5 Simple Landscaping Ideas to...\",\"description\":\"Start small with ideas like adding stone pathways, planting colorful flower beds, or installing solar garden lights.\",\"createAt\":\"29, Sep 2025\"}')),
    BlogModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/esu9ylh266wx/b3.png\",\"title\":\"Seasonal Gardening Tips for a Healt...\",\"description\":\"Spring is the perfect time to plant new blooms, summer requires smart watering techniques, autumn is ideal for fertilizing, and winter.\",\"createAt\":\"22, Jun 2025\"}')),
    BlogModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/06ftyreuamxm/b4.png\",\"title\":\"Why Professional Landscaping...\",\"description\":\"Features like neatly maintained lawns, outdoor lighting, and hardscaping elements such as patios or decks can boost.\",\"createAt\":\"15, Nov 2025\"}')),
    BlogModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/v4byukqjp83m/b5.png\",\"title\":\" Top 7 Low-Maintenance Plants fo...\",\"description\":\"Plants like succulents, snake plants, lavender, aloevera, and ornamental grasses thrive with little care these choices.\",\"createAt\":\"20, Mar 2025\"}'))
  ];
  List<BlogModelStruct> get blogList => _blogList;
  set blogList(List<BlogModelStruct> value) {
    _blogList = value;
  }

  void addToBlogList(BlogModelStruct value) {
    blogList.add(value);
  }

  void removeFromBlogList(BlogModelStruct value) {
    blogList.remove(value);
  }

  void removeAtIndexFromBlogList(int index) {
    blogList.removeAt(index);
  }

  void updateBlogListAtIndex(
    int index,
    BlogModelStruct Function(BlogModelStruct) updateFn,
  ) {
    blogList[index] = updateFn(_blogList[index]);
  }

  void insertAtIndexInBlogList(int index, BlogModelStruct value) {
    blogList.insert(index, value);
  }

  List<BannerModelStruct> _bannerSecList = [
    BannerModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/v6fzoo3scf59/Banner11.png\"}')),
    BannerModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/mhq9kh7kr0t0/Banner12.png\"}')),
    BannerModelStruct.fromSerializableMap(jsonDecode(
        '{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gardening-and-landscaping-services-app-u7vmu0/assets/nh1pc6mcum4l/Banner13.png\"}'))
  ];
  List<BannerModelStruct> get bannerSecList => _bannerSecList;
  set bannerSecList(List<BannerModelStruct> value) {
    _bannerSecList = value;
  }

  void addToBannerSecList(BannerModelStruct value) {
    bannerSecList.add(value);
  }

  void removeFromBannerSecList(BannerModelStruct value) {
    bannerSecList.remove(value);
  }

  void removeAtIndexFromBannerSecList(int index) {
    bannerSecList.removeAt(index);
  }

  void updateBannerSecListAtIndex(
    int index,
    BannerModelStruct Function(BannerModelStruct) updateFn,
  ) {
    bannerSecList[index] = updateFn(_bannerSecList[index]);
  }

  void insertAtIndexInBannerSecList(int index, BannerModelStruct value) {
    bannerSecList.insert(index, value);
  }

  int _modeIndex = 0;
  int get modeIndex => _modeIndex;
  set modeIndex(int value) {
    _modeIndex = value;
    prefs.setInt('ff_modeIndex', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

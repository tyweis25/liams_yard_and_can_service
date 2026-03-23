import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? HomeMainPageWidget() : SplashPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? HomeMainPageWidget()
              : SplashPageWidget(),
        ),
        FFRoute(
          name: SplashPageWidget.routeName,
          path: SplashPageWidget.routePath,
          builder: (context, params) => SplashPageWidget(),
        ),
        FFRoute(
          name: OnboardingPageWidget.routeName,
          path: OnboardingPageWidget.routePath,
          builder: (context, params) => OnboardingPageWidget(),
        ),
        FFRoute(
          name: DemoPageWidget.routeName,
          path: DemoPageWidget.routePath,
          builder: (context, params) => DemoPageWidget(),
        ),
        FFRoute(
          name: HomeMainPageWidget.routeName,
          path: HomeMainPageWidget.routePath,
          builder: (context, params) => HomeMainPageWidget(),
        ),
        FFRoute(
          name: SignInPageWidget.routeName,
          path: SignInPageWidget.routePath,
          builder: (context, params) => SignInPageWidget(
            isInner: params.getParam(
              'isInner',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: SignUpPageWidget.routeName,
          path: SignUpPageWidget.routePath,
          builder: (context, params) => SignUpPageWidget(
            isInner: params.getParam(
              'isInner',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: ForgotPasswordPageWidget.routeName,
          path: ForgotPasswordPageWidget.routePath,
          builder: (context, params) => ForgotPasswordPageWidget(),
        ),
        FFRoute(
          name: VerificationPageWidget.routeName,
          path: VerificationPageWidget.routePath,
          builder: (context, params) => VerificationPageWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ResetPasswordPageWidget.routeName,
          path: ResetPasswordPageWidget.routePath,
          builder: (context, params) => ResetPasswordPageWidget(),
        ),
        FFRoute(
          name: ForgotVerificationPageWidget.routeName,
          path: ForgotVerificationPageWidget.routePath,
          builder: (context, params) => ForgotVerificationPageWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: MyProfilePageWidget.routeName,
          path: MyProfilePageWidget.routePath,
          builder: (context, params) => MyProfilePageWidget(),
        ),
        FFRoute(
          name: EditProfilePageWidget.routeName,
          path: EditProfilePageWidget.routePath,
          builder: (context, params) => EditProfilePageWidget(),
        ),
        FFRoute(
          name: NotificationPageWidget.routeName,
          path: NotificationPageWidget.routePath,
          builder: (context, params) => NotificationPageWidget(),
        ),
        FFRoute(
          name: AboutusPageWidget.routeName,
          path: AboutusPageWidget.routePath,
          builder: (context, params) => AboutusPageWidget(),
        ),
        FFRoute(
          name: TermsConditionPageWidget.routeName,
          path: TermsConditionPageWidget.routePath,
          builder: (context, params) => TermsConditionPageWidget(),
        ),
        FFRoute(
          name: PrivacyPolicyPageWidget.routeName,
          path: PrivacyPolicyPageWidget.routePath,
          builder: (context, params) => PrivacyPolicyPageWidget(),
        ),
        FFRoute(
          name: SettingsPageWidget.routeName,
          path: SettingsPageWidget.routePath,
          builder: (context, params) => SettingsPageWidget(),
        ),
        FFRoute(
          name: ChangePasswordPageWidget.routeName,
          path: ChangePasswordPageWidget.routePath,
          builder: (context, params) => ChangePasswordPageWidget(),
        ),
        FFRoute(
          name: PaymentMethodPageWidget.routeName,
          path: PaymentMethodPageWidget.routePath,
          builder: (context, params) => PaymentMethodPageWidget(
            cartDetail: params.getParam(
              'cartDetail',
              ParamType.DataStruct,
              isList: false,
              structBuilder: CartModelStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: SummaryPageWidget.routeName,
          path: SummaryPageWidget.routePath,
          builder: (context, params) => SummaryPageWidget(
            paymentType: params.getParam(
              'paymentType',
              ParamType.DataStruct,
              isList: false,
              structBuilder: PaymentMethodModelStruct.fromSerializableMap,
            ),
            cartDetail: params.getParam(
              'cartDetail',
              ParamType.DataStruct,
              isList: false,
              structBuilder: CartModelStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: ReviewsPageWidget.routeName,
          path: ReviewsPageWidget.routePath,
          builder: (context, params) => ReviewsPageWidget(
            reviewList: params.getParam<ReviewModelStruct>(
              'reviewList',
              ParamType.DataStruct,
              isList: true,
              structBuilder: ReviewModelStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: BookingDetailsPageWidget.routeName,
          path: BookingDetailsPageWidget.routePath,
          builder: (context, params) => BookingDetailsPageWidget(
            bookingDetail: params.getParam(
              'bookingDetail',
              ParamType.DataStruct,
              isList: false,
              structBuilder: BookingModelStruct.fromSerializableMap,
            ),
            bookingIndex: params.getParam(
              'bookingIndex',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: MyReviewsPageWidget.routeName,
          path: MyReviewsPageWidget.routePath,
          builder: (context, params) => MyReviewsPageWidget(),
        ),
        FFRoute(
          name: FavoritesPageWidget.routeName,
          path: FavoritesPageWidget.routePath,
          builder: (context, params) => FavoritesPageWidget(),
        ),
        FFRoute(
          name: CatRelatedPageWidget.routeName,
          path: CatRelatedPageWidget.routePath,
          builder: (context, params) => CatRelatedPageWidget(
            title: params.getParam(
              'title',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SearchPageWidget.routeName,
          path: SearchPageWidget.routePath,
          builder: (context, params) => SearchPageWidget(),
        ),
        FFRoute(
          name: AddReviewPageWidget.routeName,
          path: AddReviewPageWidget.routePath,
          builder: (context, params) => AddReviewPageWidget(
            bookingDetail: params.getParam(
              'bookingDetail',
              ParamType.DataStruct,
              isList: false,
              structBuilder: BookingModelStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: SelectDatePageWidget.routeName,
          path: SelectDatePageWidget.routePath,
          builder: (context, params) => SelectDatePageWidget(
            serviceDetail: params.getParam(
              'serviceDetail',
              ParamType.DataStruct,
              isList: false,
              structBuilder: ServicesModelStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: OurSpecialistsDetailsPageWidget.routeName,
          path: OurSpecialistsDetailsPageWidget.routePath,
          builder: (context, params) => OurSpecialistsDetailsPageWidget(
            staffDetail: params.getParam(
              'staffDetail',
              ParamType.DataStruct,
              isList: false,
              structBuilder: StaffMemberModelStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: OurSpecialistPageWidget.routeName,
          path: OurSpecialistPageWidget.routePath,
          builder: (context, params) => OurSpecialistPageWidget(),
        ),
        FFRoute(
          name: ServicesDetailsWidget.routeName,
          path: ServicesDetailsWidget.routePath,
          builder: (context, params) => ServicesDetailsWidget(
            serviceDetail: params.getParam(
              'serviceDetail',
              ParamType.DataStruct,
              isList: false,
              structBuilder: ServicesModelStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: RecommendedPageWidget.routeName,
          path: RecommendedPageWidget.routePath,
          builder: (context, params) => RecommendedPageWidget(),
        ),
        FFRoute(
          name: CouponCodePageWidget.routeName,
          path: CouponCodePageWidget.routePath,
          builder: (context, params) => CouponCodePageWidget(),
        ),
        FFRoute(
          name: ReletedServicesPageWidget.routeName,
          path: ReletedServicesPageWidget.routePath,
          builder: (context, params) => ReletedServicesPageWidget(
            serviceRelatedList: params.getParam<ServicesModelStruct>(
              'serviceRelatedList',
              ParamType.DataStruct,
              isList: true,
              structBuilder: ServicesModelStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: TrendingServicePageWidget.routeName,
          path: TrendingServicePageWidget.routePath,
          builder: (context, params) => TrendingServicePageWidget(),
        ),
        FFRoute(
          name: RateUsPageWidget.routeName,
          path: RateUsPageWidget.routePath,
          builder: (context, params) => RateUsPageWidget(),
        ),
        FFRoute(
          name: FAQsPageWidget.routeName,
          path: FAQsPageWidget.routePath,
          builder: (context, params) => FAQsPageWidget(),
        ),
        FFRoute(
          name: BlogPageWidget.routeName,
          path: BlogPageWidget.routePath,
          builder: (context, params) => BlogPageWidget(),
        ),
        FFRoute(
          name: BlogDetailPageWidget.routeName,
          path: BlogDetailPageWidget.routePath,
          builder: (context, params) => BlogDetailPageWidget(
            blogDetail: params.getParam(
              'blogDetail',
              ParamType.DataStruct,
              isList: false,
              structBuilder: BlogModelStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: RecentlyViewedPageWidget.routeName,
          path: RecentlyViewedPageWidget.routePath,
          builder: (context, params) => RecentlyViewedPageWidget(),
        ),
        FFRoute(
          name: SuggestedForPageWidget.routeName,
          path: SuggestedForPageWidget.routePath,
          builder: (context, params) => SuggestedForPageWidget(),
        ),
        FFRoute(
          name: SuggestedservicePageWidget.routeName,
          path: SuggestedservicePageWidget.routePath,
          builder: (context, params) => SuggestedservicePageWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/splashPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(
                  key: state.pageKey, name: state.name, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/main_appbar/main_appbar_widget.dart';
import '/pages/components/review_component/review_component_widget.dart';
import '/pages/empty_components/no_review_component/no_review_component_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'my_reviews_page_model.dart';
export 'my_reviews_page_model.dart';

class MyReviewsPageWidget extends StatefulWidget {
  const MyReviewsPageWidget({super.key});

  static String routeName = 'MyReviewsPage';
  static String routePath = '/myReviewsPage';

  @override
  State<MyReviewsPageWidget> createState() => _MyReviewsPageWidgetState();
}

class _MyReviewsPageWidgetState extends State<MyReviewsPageWidget> {
  late MyReviewsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyReviewsPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.mainAppbarModel,
                updateCallback: () => safeSetState(() {}),
                child: MainAppbarWidget(
                  title: 'My reviews',
                  isBack: false,
                  isEdit: false,
                  backAction: () async {},
                  editAction: () async {},
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (FFAppState().connected) {
                      return Builder(
                        builder: (context) {
                          if (FFAppState().myReviewsList.isNotEmpty) {
                            return Builder(
                              builder: (context) {
                                final myReviewsList =
                                    FFAppState().myReviewsList.toList();

                                return ListView.separated(
                                  padding: EdgeInsets.symmetric(vertical: 16.0),
                                  scrollDirection: Axis.vertical,
                                  itemCount: myReviewsList.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 16.0),
                                  itemBuilder: (context, myReviewsListIndex) {
                                    final myReviewsListItem =
                                        myReviewsList[myReviewsListIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          valueOrDefault<double>(
                                            FFAppConstants.primaryPadding,
                                            0.0,
                                          ),
                                          0.0,
                                          valueOrDefault<double>(
                                            FFAppConstants.primaryPadding,
                                            0.0,
                                          ),
                                          0.0),
                                      child: wrapWithModel(
                                        model: _model.reviewComponentModels
                                            .getModel(
                                          myReviewsListItem.name,
                                          myReviewsListIndex,
                                        ),
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: ReviewComponentWidget(
                                          key: Key(
                                            'Keyee7_${myReviewsListItem.name}',
                                          ),
                                          image: myReviewsListItem.image,
                                          name: myReviewsListItem.name,
                                          description:
                                              myReviewsListItem.description,
                                          review: myReviewsListItem.review,
                                          width: double.infinity,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          } else {
                            return wrapWithModel(
                              model: _model.noReviewComponentModel,
                              updateCallback: () => safeSetState(() {}),
                              child: NoReviewComponentWidget(),
                            );
                          }
                        },
                      );
                    } else {
                      return Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Lottie.asset(
                          'assets/jsons/No_Wifi.json',
                          width: 120.0,
                          height: 120.0,
                          fit: BoxFit.contain,
                          animate: true,
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/main_appbar/main_appbar_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'blog_detail_page_model.dart';
export 'blog_detail_page_model.dart';

class BlogDetailPageWidget extends StatefulWidget {
  const BlogDetailPageWidget({
    super.key,
    required this.blogDetail,
  });

  final BlogModelStruct? blogDetail;

  static String routeName = 'BlogDetailPage';
  static String routePath = '/blogDetailPage';

  @override
  State<BlogDetailPageWidget> createState() => _BlogDetailPageWidgetState();
}

class _BlogDetailPageWidgetState extends State<BlogDetailPageWidget> {
  late BlogDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlogDetailPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  title: 'Blogs',
                  isBack: false,
                  isEdit: false,
                  backAction: () async {},
                  editAction: () async {},
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    16.0,
                    0,
                    8.0,
                  ),
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
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
                          8.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.blogDetail?.title,
                          'Title',
                        ),
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'SF Pro Display',
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              lineHeight: 1.2,
                            ),
                      ),
                    ),
                    Padding(
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
                          16.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.blogDetail?.createAt,
                          'CreateAt',
                        ),
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'SF Pro Display',
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 15.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              lineHeight: 1.5,
                            ),
                      ),
                    ),
                    Padding(
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
                          16.0),
                      child: Text(
                        'Superfoods like leafy greens, berries, citrus fruits, nuts, seeds, and fatty fish are packed with nutrients that naturally enhance energy levels For example, vitamin C from oranges and strawberries supports your immune system, while iron from spinach and.',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'SF Pro Display',
                              fontSize: 17.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              lineHeight: 1.33,
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
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
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(valueOrDefault<double>(
                            FFAppConstants.radius2Xl,
                            0.0,
                          )),
                          child: CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 500),
                            fadeOutDuration: Duration(milliseconds: 500),
                            imageUrl: widget.blogDetail!.image,
                            width: () {
                              if (MediaQuery.sizeOf(context).width < 810.0) {
                                return double.infinity;
                              } else if ((MediaQuery.sizeOf(context).width >=
                                      810.0) &&
                                  (MediaQuery.sizeOf(context).width < 1280.0)) {
                                return 750.0;
                              } else if ((MediaQuery.sizeOf(context).width >=
                                      1280.0) &&
                                  (MediaQuery.sizeOf(context).width < 2560.0)) {
                                return 810.0;
                              } else {
                                return 810.0;
                              }
                            }(),
                            height: () {
                              if (MediaQuery.sizeOf(context).width < 810.0) {
                                return 212.0;
                              } else if ((MediaQuery.sizeOf(context).width >=
                                      810.0) &&
                                  (MediaQuery.sizeOf(context).width < 1280.0)) {
                                return 232.0;
                              } else if ((MediaQuery.sizeOf(context).width >=
                                      1280.0) &&
                                  (MediaQuery.sizeOf(context).width < 2560.0)) {
                                return 252.0;
                              } else {
                                return 272.0;
                              }
                            }(),
                            fit: BoxFit.cover,
                            errorWidget: (context, error, stackTrace) =>
                                Image.asset(
                              'assets/images/error_image.png',
                              width: () {
                                if (MediaQuery.sizeOf(context).width < 810.0) {
                                  return double.infinity;
                                } else if ((MediaQuery.sizeOf(context).width >=
                                        810.0) &&
                                    (MediaQuery.sizeOf(context).width <
                                        1280.0)) {
                                  return 750.0;
                                } else if ((MediaQuery.sizeOf(context).width >=
                                        1280.0) &&
                                    (MediaQuery.sizeOf(context).width <
                                        2560.0)) {
                                  return 810.0;
                                } else {
                                  return 810.0;
                                }
                              }(),
                              height: () {
                                if (MediaQuery.sizeOf(context).width < 810.0) {
                                  return 212.0;
                                } else if ((MediaQuery.sizeOf(context).width >=
                                        810.0) &&
                                    (MediaQuery.sizeOf(context).width <
                                        1280.0)) {
                                  return 232.0;
                                } else if ((MediaQuery.sizeOf(context).width >=
                                        1280.0) &&
                                    (MediaQuery.sizeOf(context).width <
                                        2560.0)) {
                                  return 252.0;
                                } else {
                                  return 272.0;
                                }
                              }(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          valueOrDefault<double>(
                            FFAppConstants.primaryPadding,
                            0.0,
                          ),
                          16.0,
                          valueOrDefault<double>(
                            FFAppConstants.primaryPadding,
                            0.0,
                          ),
                          16.0),
                      child: Text(
                        'our body’s energy and immunity are deeply connected, and nutrition plays a powerful role in strengthening both When you fuel your body with the right foods, you not only feel more active and productive throughout the day but also give your immune system the tools.',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'SF Pro Display',
                              fontSize: 17.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              lineHeight: 1.33,
                            ),
                      ),
                    ),
                    Padding(
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
                          16.0),
                      child: Text(
                        'Hydration also plays a key role in maintaining both energy and immunity Even slight dehydration can leave you feeling sluggish, impact focus, and weaken your body’s ability to fight infections Drinking enough water, along with herbal teas.',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'SF Pro Display',
                              fontSize: 17.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              lineHeight: 1.33,
                            ),
                      ),
                    ),
                    Padding(
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
                          8.0),
                      child: Text(
                        'Sleep and nutrition work hand in hand when it comes to boosting immunity Foods rich in magnesium, such as almonds and bananas, help relax your body and improve sleep quality, while protein-rich meals support tissue repair and energy restoration Consistent, quality sleep paired with a nutrient-dense diet creates the foundation for better health Ultimately, boosting your energy and immunity isn’t about drastic changes it’s about daily habits Choosing whole foods.',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'SF Pro Display',
                              fontSize: 17.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              lineHeight: 1.33,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

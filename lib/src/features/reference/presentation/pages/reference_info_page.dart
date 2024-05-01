import 'dart:io';

import 'package:aloqa_nazorat/generated/l10n.dart';
import 'package:aloqa_nazorat/src/config/components/app_components.dart';
import 'package:aloqa_nazorat/src/config/components/funs.dart';
import 'package:aloqa_nazorat/src/config/theme/app_colors.dart';
import 'package:aloqa_nazorat/src/core/app_state/cubit/app_cubit.dart';
import 'package:aloqa_nazorat/src/core/network/api_interceptor.dart';
import 'package:aloqa_nazorat/src/core/services/services.dart';
import 'package:aloqa_nazorat/src/core/util/app_constants.dart';
import 'package:aloqa_nazorat/src/features/reference/data/models/ticket_data.dart';
import 'package:aloqa_nazorat/src/features/reference/presentation/manager/reference_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class ReferenceInfoPage extends StatefulWidget {
  const ReferenceInfoPage({super.key});

  @override
  State<ReferenceInfoPage> createState() => _ReferenceInfoPageState();
}

class _ReferenceInfoPageState extends State<ReferenceInfoPage> {
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
              isScrollable: true,
              indicatorColor: AppColors.bottomLineColor,
              unselectedLabelStyle:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              labelColor: AppColors.bottomLineColor,
              labelStyle:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              tabs: [
                Tab(text: S.of(context).murojaat),
                Tab(text: S.of(context).malumot),
                Tab(text: S.of(context).javob),
              ]),
          title: Text(
            S.of(context).meningMurojaatlarim,
            style: TextStyle(fontSize: 16.sp),
          ),
        ),
        body: BlocConsumer<ReferenceBloc, ReferenceState>(
          listener: (context, state) {
            if (state.hasError) {
              snackBar(state.errorMessage);
            }
          },
          builder: (context, state) {
            final List<UserFile> userImgFiles = state
                    .ticketModel?.data?.userFiles
                    ?.where((element) =>
                        element.fileExtension == "jpg" ||
                        element.fileExtension == "jpeg" ||
                        element.fileExtension == "png" ||
                        element.fileExtension == "heic")
                    .toList() ??
                [];

            final List<UserFile> userDocFiles = state
                    .ticketModel?.data?.userFiles
                    ?.where((element) =>
                        element.fileExtension == "pdf" ||
                        element.fileExtension == "doc" ||
                        element.fileExtension == "docx" ||
                        element.fileExtension == "xls" ||
                        element.fileExtension == "document")
                    .toList() ??
                [];

            final List<ResponseFile> responseImgFiles = state
                    .ticketModel?.data?.responseFiles
                    ?.where((element) =>
                        element.fileExtension == "jpg" ||
                        element.fileExtension == "jpeg" ||
                        element.fileExtension == "png" ||
                        element.fileExtension == "heic")
                    .toList() ??
                [];

            final List<ResponseFile> responseDocFiles = state
                    .ticketModel?.data?.responseFiles
                    ?.where((element) =>
                        element.fileExtension == "pdf" ||
                        element.fileExtension == "doc" ||
                        element.fileExtension == "docx" ||
                        element.fileExtension == "xls" ||
                        element.fileExtension == "document")
                    .toList() ??
                [];

            return FutureBuilder(
                future: Prefs.getString(AppConstants.kToken),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.data != null) {}
                  return BlocBuilder<AppCubit, AppState>(
                    builder: (context, state1) {
                      final bg = state1.isDark
                          ? 'assets/images/img_bg_night.jpg'
                          : 'assets/images/img_bg_light.jpg';
                      return Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(bg),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: (!state.isLoading)
                            ? TabBarView(
                                children: [
                                  // reference
                                  Card(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 12.h, horizontal: 12.w),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.r)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.w),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            12.verticalSpace,
                                            Text(
                                              S.of(context).murojaatTuri,
                                              style: TextStyle(fontSize: 12.sp),
                                            ),
                                            2.verticalSpace,
                                            Text(
                                              textLocale(
                                                  state.ticketModel?.data
                                                      ?.reference?.name,
                                                  state1.lang),
                                              style: TextStyle(fontSize: 14.sp),
                                            ),
                                            16.verticalSpace,
                                            Text(
                                              S
                                                  .of(context)
                                                  .biriktirilganFayllar,
                                              style: TextStyle(fontSize: 12.sp),
                                            ),
                                            2.verticalSpace,
                                            MediaQuery.removePadding(
                                              context: context,
                                              removeTop: true,
                                              removeBottom: true,
                                              child: GridView.builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                      const ClampingScrollPhysics(),
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      userImgFiles.length,
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 4),
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return GestureDetector(
                                                      onTap: () {},
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.r),
                                                          child: FadeInImage(
                                                            height: 100,
                                                            width: 200,
                                                            placeholder:
                                                                const AssetImage(
                                                                    "assets/images/img_logo_uz.png"),
                                                            image: NetworkImage(
                                                              "https://murojaat.gis.uz/api/get-file/${userImgFiles[index].fileName}",
                                                              headers: {
                                                                "Authorization":
                                                                    "Bearer ${snapshot.data}",
                                                                "mobile-app-key":
                                                                    'mobile_key',
                                                              },
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                            ),
                                            16.verticalSpace,
                                            MediaQuery.removePadding(
                                              context: context,
                                              removeTop: true,
                                              removeBottom: true,
                                              child: ListView.builder(
                                                  physics:
                                                      const ClampingScrollPhysics(),
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  shrinkWrap: true,
                                                  itemCount:
                                                      userDocFiles.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        openFile(
                                                            url:
                                                                "https://murojaat.gis.uz/api/get-file/${userDocFiles[index].fileName}",
                                                            fileName: userDocFiles[
                                                                        index]
                                                                    .fileName ??
                                                                "");
                                                        snackBar(S
                                                            .of(context)
                                                            .yuklanmoqda);
                                                      },
                                                      child: Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical: 4.h),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.h),
                                                            color: AppColors
                                                                .mainColorDark),
                                                        padding:
                                                            EdgeInsets.all(8.h),
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              height: 42.h,
                                                              width: 42.h,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(21
                                                                              .h),
                                                                  color: AppColors
                                                                      .bottomNavNoActiveIconColor),
                                                              child: Icon(
                                                                Icons
                                                                    .arrow_downward,
                                                                color: Colors
                                                                    .white,
                                                                size: 24.r,
                                                              ),
                                                            ),
                                                            8.horizontalSpace,
                                                            Flexible(
                                                                child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Text(
                                                                  userDocFiles[
                                                                              index]
                                                                          .fileName ??
                                                                      "--",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        14.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  maxLines: 1,
                                                                ),
                                                              ],
                                                            ))
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                            ),
                                            16.verticalSpace,
                                            const AppDivider(),
                                            16.verticalSpace,
                                            Text(
                                              S.of(context).murojaatMatni,
                                              style: TextStyle(fontSize: 12.sp),
                                            ),
                                            2.verticalSpace,
                                            Text(
                                              state.ticketModel?.data
                                                      ?.description ??
                                                  "--",
                                              style: TextStyle(fontSize: 14.sp),
                                            ),
                                            12.verticalSpace
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  // info
                                  Card(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 12.h, horizontal: 12.w),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.r)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.w),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            12.verticalSpace,
                                            Text(
                                              S.of(context).murojaatHolati,
                                              style: TextStyle(fontSize: 12.sp),
                                            ),
                                            2.verticalSpace,
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 4.h,
                                                  horizontal: 8.w),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.h),
                                                  color: textColor(state
                                                              .ticketModel
                                                              ?.data
                                                              ?.status ??
                                                          '2')
                                                      .withOpacity(0.1)),
                                              child: Text(
                                                textTitle(
                                                    state.ticketModel?.data
                                                            ?.status ??
                                                        '2',
                                                    context),
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: textColor(state
                                                            .ticketModel
                                                            ?.data
                                                            ?.status ??
                                                        '2')),
                                              ),
                                            ),
                                            16.verticalSpace,
                                            Text(
                                              S.of(context).murojaatTuri,
                                              style: TextStyle(fontSize: 12.sp),
                                            ),
                                            2.verticalSpace,
                                            Text(
                                              textLocale(
                                                  state.ticketModel?.data
                                                      ?.reference?.name,
                                                  state1.lang),
                                              style: TextStyle(fontSize: 14.sp),
                                            ),
                                            16.verticalSpace,
                                            Text(
                                              S
                                                  .of(context)
                                                  .murojaatYaratilganSana,
                                              style: TextStyle(fontSize: 12.sp),
                                            ),
                                            2.verticalSpace,
                                            Text(
                                              _fromDataTimeToString(state
                                                      .ticketModel
                                                      ?.data
                                                      ?.createdAt ??
                                                  ""),
                                              style: TextStyle(fontSize: 14.sp),
                                            ),
                                            16.verticalSpace,
                                            Text(
                                              S
                                                  .of(context)
                                                  .murojaatIjrogaYuborilganSana,
                                              style: TextStyle(fontSize: 12.sp),
                                            ),
                                            2.verticalSpace,
                                            Text(
                                              _fromDataTimeToString(state
                                                      .ticketModel
                                                      ?.data
                                                      ?.sentAt ??
                                                  ""),
                                              style: TextStyle(fontSize: 14.sp),
                                            ),
                                            16.verticalSpace,
                                            Text(
                                              S.of(context).ijroEtishVaqti,
                                              style: TextStyle(fontSize: 12.sp),
                                            ),
                                            2.verticalSpace,
                                            Text(
                                              _fromDataTimeToString(state
                                                      .ticketModel
                                                      ?.data
                                                      ?.deadline ??
                                                  ""),
                                              style: TextStyle(fontSize: 14.sp),
                                            ),
                                            16.verticalSpace,
                                            Text(
                                              S
                                                  .of(context)
                                                  .murojaatIjrosigaMasulBolimVaHududiyInspeksiya,
                                              style: TextStyle(fontSize: 12.sp),
                                            ),
                                            2.verticalSpace,
                                            Text(
                                              state
                                                      .ticketModel
                                                      ?.data
                                                      ?.ticketRegion
                                                      ?.name
                                                      ?.uz ??
                                                  "",
                                              style: TextStyle(fontSize: 14.sp),
                                            ),
                                            16.verticalSpace,
                                            Text(
                                              S.of(context).ijrochilar,
                                              style: TextStyle(fontSize: 12.sp),
                                            ),
                                            2.verticalSpace,
                                            Text(
                                              _executions(state.ticketModel
                                                  ?.data?.executions),
                                              style: TextStyle(fontSize: 14.sp),
                                            ),
                                            12.verticalSpace,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  // response
                                  Card(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 12.w, vertical: 12.h),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.r)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.w),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            12.verticalSpace,
                                            Text(
                                              S.of(context).murojaatMatni,
                                              style: TextStyle(fontSize: 12.sp),
                                            ),
                                            2.verticalSpace,
                                            Text(
                                              state.ticketModel?.data
                                                      ?.comment ??
                                                  "--",
                                              style: TextStyle(fontSize: 14.sp),
                                            ),
                                            16.verticalSpace,
                                            const AppDivider(),
                                            16.verticalSpace,
                                            Text(
                                              S
                                                  .of(context)
                                                  .biriktirilganFayllar,
                                              style: TextStyle(fontSize: 12.sp),
                                            ),
                                            2.verticalSpace,
                                            MediaQuery.removePadding(
                                              context: context,
                                              removeTop: true,
                                              removeBottom: true,
                                              child: GridView.builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                      const ClampingScrollPhysics(),
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      responseImgFiles.length,
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 4),
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return GestureDetector(
                                                      onTap: () {},
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.r),
                                                        child: FadeInImage(
                                                          height: 100,
                                                          width: 200,
                                                          placeholder:
                                                              const AssetImage(
                                                                  "assets/images/img_logo_uz.png"),
                                                          image: NetworkImage(
                                                              "https://murojaat.gis.uz/api/get-file/${responseImgFiles[index].fileName}",
                                                              headers: {
                                                                "Authorization":
                                                                    "Bearer ${snapshot.data}",
                                                                "mobile-app-key":
                                                                    'mobile_key',
                                                              }),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                            ),
                                            16.verticalSpace,
                                            MediaQuery.removePadding(
                                              context: context,
                                              removeTop: true,
                                              removeBottom: true,
                                              child: ListView.builder(
                                                  physics:
                                                      const ClampingScrollPhysics(),
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  shrinkWrap: true,
                                                  itemCount:
                                                      responseDocFiles.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        openFile(
                                                            url:
                                                                "https://murojaat.gis.uz/api/get-file/${responseDocFiles[index].fileName}",
                                                            fileName: responseDocFiles[
                                                                        index]
                                                                    .fileName ??
                                                                "");
                                                        snackBar(
                                                            "Yuklanmoqda...");
                                                      },
                                                      child: Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical: 4.h),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.h),
                                                            color: AppColors
                                                                .mainColorDark),
                                                        padding:
                                                            EdgeInsets.all(8.h),
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              height: 42.h,
                                                              width: 42.h,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(21
                                                                              .h),
                                                                  color: AppColors
                                                                      .bottomNavNoActiveIconColor),
                                                              child: Icon(
                                                                Icons
                                                                    .arrow_downward,
                                                                size: 24.r,
                                                              ),
                                                            ),
                                                            8.horizontalSpace,
                                                            Flexible(
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Text(
                                                                    responseDocFiles[index]
                                                                            .fileName ??
                                                                        "--",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    maxLines: 1,
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                            ),
                                            16.verticalSpace,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Center(
                                child: CircularProgressIndicator(
                                color: Theme.of(context).colorScheme.tertiary,
                              )),
                      );
                    },
                  );
                });
          },
        ),
      ),
    );
  }

  String _executions(List<Execution>? executions) {
    var executors = "";
    if (executions == null) {
      return "--";
    }
    for (var element in executions) {
      "$executors \n ${element.executor?.firstname} ${element.executor?.lastname}";
    }
    return executors;
  }

  String _fromDataTimeToString(String dataString) {
    if (dataString.isEmpty) {
      return "--";
    }
    DateTime dateTime = DateTime.parse(dataString);
    String formattedString = DateFormat('yyyy.MM.dd HH:mm:ss').format(dateTime);
    return formattedString;
  }

  Future openFile({required String url, required String fileName}) async {
    final file = await downloadFile(url, fileName);
    if (file == null) return;
    print('Path: ${file.path}');
    OpenFile.open(file.path);
  }

  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');

    Dio dio = Dio(
      BaseOptions(
        baseUrl: "https://murojaat.gis.uz/",
        contentType: "application/json",
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 60 * 1000),
        receiveTimeout: const Duration(seconds: 60 * 1000),
        listFormat: ListFormat.multiCompatible,
      ),
    );
    dio.interceptors.add(ApiInterceptor());

    final response = await dio.get(url,
        options:
            Options(responseType: ResponseType.bytes, followRedirects: false));

    final raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();

    return file;
  }
}

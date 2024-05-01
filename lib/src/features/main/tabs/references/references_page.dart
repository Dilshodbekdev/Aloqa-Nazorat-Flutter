import 'package:aloqa_nazorat/generated/l10n.dart';
import 'package:aloqa_nazorat/src/config/components/funs.dart';
import 'package:aloqa_nazorat/src/config/routes/names.dart';
import 'package:aloqa_nazorat/src/config/theme/app_colors.dart';
import 'package:aloqa_nazorat/src/core/app_state/cubit/app_cubit.dart';
import 'package:aloqa_nazorat/src/features/reference/data/models/ticket_data.dart';
import 'package:aloqa_nazorat/src/features/reference/presentation/manager/reference_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReferencesPage extends StatefulWidget {
  const ReferencesPage({super.key});

  @override
  State<ReferencesPage> createState() => _ReferencesPageState();
}

class _ReferencesPageState extends State<ReferencesPage> {
  late final bloc = context.read<ReferenceBloc>();

  @override
  void initState() {
    super.initState();
    bloc.tickets();
  }

  List<TicketData> allTickets = [];
  List<TicketData> execution = [];
  List<TicketData> completed = [];

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
                Tab(text: S.of(context).all),
                Tab(text: S.of(context).ijrodagi),
                Tab(text: S.of(context).yakunlangan),
              ]),
          automaticallyImplyLeading: false,
          title: Text(
            S.of(context).meningMurojaatlarim,
            style: TextStyle(fontSize: 16.sp),
          ),
        ),
        body: BlocConsumer<ReferenceBloc, ReferenceState>(
          listener: (context, state) {
            if (state.isLoginVerified) {
              allTickets = state.ticketsModel?.data ?? [];
              execution = state.ticketsModel?.data
                      ?.where((element) =>
                          element.status != '1' && element.status != '5')
                      .toList() ??
                  [];
              completed = state.ticketsModel?.data
                      ?.where((element) => element.status == '5')
                      .toList() ??
                  [];
            }
          },
          builder: (context, state) {
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
                            ListView.builder(
                                itemCount: allTickets.length,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 12.h),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      bloc.ticket(allTickets[index].code ?? "");
                                      Navigator.of(context).pushNamed(
                                          AppRoutes.REFERENCE_INFO,
                                          arguments: allTickets[index]);
                                    },
                                    child: Card(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 4.h),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.r)),
                                      color: AppColors.bottomLineColor,
                                      child: Container(
                                        height: 100.h,
                                        margin: EdgeInsets.only(bottom: 1.h),
                                        padding: EdgeInsets.all(12.h),
                                        decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(8.r)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              textLocale(
                                                  allTickets[index]
                                                      .reference
                                                      ?.name,
                                                  state1.lang),
                                              style: TextStyle(fontSize: 14.sp),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 4.h,
                                                      horizontal: 8.w),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.h),
                                                      color: textColor(
                                                              allTickets[index]
                                                                      .status ??
                                                                  '2')
                                                          .withOpacity(0.1)),
                                                  child: Text(
                                                    textTitle(
                                                        allTickets[index]
                                                                .status ??
                                                            '2',
                                                        context),
                                                    style: TextStyle(
                                                        fontSize: 12.sp,
                                                        color: textColor(
                                                            allTickets[index]
                                                                    .status ??
                                                                '2')),
                                                  ),
                                                ),
                                                Text(
                                                  allTickets[index]
                                                          .sentAt
                                                          ?.split(" ")[0]
                                                          .replaceAll(
                                                              "-", ".") ??
                                                      "",
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: Colors.grey),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                            ListView.builder(
                                itemCount: execution.length,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 12.h),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      bloc.ticket(execution[index].code ?? "");
                                      Navigator.of(context).pushNamed(
                                          AppRoutes.REFERENCE_INFO,
                                          arguments: execution[index]);
                                    },
                                    child: Card(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 4.h),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.r)),
                                      color: AppColors.bottomLineColor,
                                      child: Container(
                                        height: 100.h,
                                        margin: EdgeInsets.only(bottom: 1.h),
                                        padding: EdgeInsets.all(12.h),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              textLocale(
                                                  execution[index]
                                                      .reference
                                                      ?.name,
                                                  state1.lang),
                                              style: TextStyle(fontSize: 14.sp),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 4.h,
                                                      horizontal: 8.w),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.r),
                                                      color: textColor(
                                                              execution[index]
                                                                      .status ??
                                                                  '2')
                                                          .withOpacity(0.1)),
                                                  child: Text(
                                                    textTitle(
                                                        execution[index]
                                                                .status ??
                                                            '2',
                                                        context),
                                                    style: TextStyle(
                                                        fontSize: 12.sp,
                                                        color: textColor(
                                                            execution[index]
                                                                    .status ??
                                                                '2')),
                                                  ),
                                                ),
                                                Text(
                                                  execution[index]
                                                          .sentAt
                                                          ?.split(" ")[0]
                                                          .replaceAll(
                                                              "-", ".") ??
                                                      "",
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: Colors.grey),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                            ListView.builder(
                                itemCount: completed.length,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 12.h),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      bloc.ticket(completed[index].code ?? "");
                                      Navigator.of(context).pushNamed(
                                          AppRoutes.REFERENCE_INFO,
                                          arguments: completed[index]);
                                    },
                                    child: Card(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 4.h),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.r)),
                                      color: AppColors.bottomLineColor,
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 1.h),
                                        padding: EdgeInsets.all(12.h),
                                        height: 100.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            color:
                                                Theme.of(context).primaryColor),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              textLocale(
                                                  completed[index]
                                                      .reference
                                                      ?.name,
                                                  state1.lang),
                                              style: TextStyle(fontSize: 14.sp),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 4.h,
                                                      horizontal: 8.w),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.h),
                                                      color: textColor(
                                                              completed[index]
                                                                      .status ??
                                                                  '2')
                                                          .withOpacity(0.1)),
                                                  child: Text(
                                                    textTitle(
                                                        completed[index]
                                                                .status ??
                                                            '2',
                                                        context),
                                                    style: TextStyle(
                                                        fontSize: 12.sp,
                                                        color: textColor(
                                                            completed[index]
                                                                    .status ??
                                                                '2')),
                                                  ),
                                                ),
                                                Text(
                                                  completed[index]
                                                          .sentAt
                                                          ?.split(" ")[0]
                                                          .replaceAll(
                                                              "-", ".") ??
                                                      "",
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: Colors.grey),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ],
                        )
                      :  Center(child: CircularProgressIndicator(color: Theme.of(context).colorScheme.tertiary,)),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

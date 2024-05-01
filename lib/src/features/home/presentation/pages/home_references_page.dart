import 'package:aloqa_nazorat/generated/l10n.dart';
import 'package:aloqa_nazorat/src/config/components/funs.dart';
import 'package:aloqa_nazorat/src/config/routes/names.dart';
import 'package:aloqa_nazorat/src/config/theme/app_colors.dart';
import 'package:aloqa_nazorat/src/core/app_state/cubit/app_cubit.dart';
import 'package:aloqa_nazorat/src/features/home/presentation/manager/home_bloc.dart';
import 'package:aloqa_nazorat/src/features/reference/data/models/ticket_data.dart';
import 'package:aloqa_nazorat/src/features/reference/presentation/manager/reference_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeReferencesPage extends StatefulWidget {
  const HomeReferencesPage({super.key});

  @override
  State<HomeReferencesPage> createState() => _HomeReferencesPageState();
}

class _HomeReferencesPageState extends State<HomeReferencesPage> {
  late final bloc = context.read<ReferenceBloc>();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title(args),
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
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
                child: ListView.builder(
                    itemCount:
                        _list(args, state.ticketsModel?.data ?? []).length,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          bloc.ticket(
                              _list(args, state.ticketsModel?.data ?? [])[index]
                                      .code ??
                                  "");
                          Navigator.of(context).pushNamed(
                              AppRoutes.REFERENCE_INFO,
                              arguments: _list(
                                  args, state.ticketsModel?.data ?? [])[index]);
                        },
                        child: Card(
                          margin: EdgeInsets.symmetric(vertical: 4.h),
                          color: AppColors.bottomLineColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Container(
                            height: 100.h,
                            margin: EdgeInsets.only(bottom: 1.h),
                            padding: EdgeInsets.all(12.h),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  textLocale(_list(args, state.ticketsModel?.data ?? [])[index].reference?.name,state1.lang),
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4.h, horizontal: 8.w),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6.r),
                                          color: textColor(_list(
                                                          args,
                                                          state.ticketsModel
                                                                  ?.data ??
                                                              [])[index]
                                                      .status ??
                                                  '2')
                                              .withOpacity(0.1)),
                                      child: Text(
                                        textTitle(_list(args, state.ticketsModel?.data ?? [])[index].status ?? '2',context),
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: textColor(_list(args, state.ticketsModel?.data ?? [])[index].status ?? '2')),
                                      ),
                                    ),
                                    Text(
                                      _list(
                                                  args,
                                                  state.ticketsModel?.data ??
                                                      [])[index]
                                              .sentAt
                                              ?.split(" ")[0]
                                              .replaceAll("-", ".") ??
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
              );
            },
          );
        },
      ),
    );
  }

  String _title(int arg) {
    String title = "";
    if (arg == 1) {
      title = S.of(context).ijrodagi;
    } else if (arg == 2) {
      title = S.of(context).yakunlangan;
    } else {
      title = S.of(context).all;
    }
    return title;
  }

  List<TicketData> _list(int arg, List<TicketData> tickets) {
    List<TicketData> list = [];
    if (arg == 1) {
      list = tickets
          .where((element) => element.status != '1' && element.status != '5')
          .toList();
    } else if (arg == 2) {
      list = tickets.where((element) => element.status == '5').toList();
    } else {
      list = tickets;
    }
    return list;
  }
}

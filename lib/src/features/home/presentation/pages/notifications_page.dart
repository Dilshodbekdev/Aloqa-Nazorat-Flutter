import 'package:aloqa_nazorat/generated/l10n.dart';
import 'package:aloqa_nazorat/src/config/components/funs.dart';
import 'package:aloqa_nazorat/src/config/theme/app_colors.dart';
import 'package:aloqa_nazorat/src/core/app_state/cubit/app_cubit.dart';
import 'package:aloqa_nazorat/src/features/home/presentation/manager/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  late final bloc = context.read<HomeBloc>();

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).bildirishnomalar,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            onPressed: () {
              bloc.notificationsDeleteAll();
              bloc.getNotifications();
            },
            icon: const Icon(Icons.playlist_add_check),
          )
        ],
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.isLoginVerified) {
            snackBar(state.notificationsDeleteAllModel?.message);
          }
          if (state.hasError) {
            snackBar(state.errorMessage);
          }
        },
        builder: (context, state) {
          return BlocBuilder<AppCubit, AppState>(
            builder: (context, state1) {
              final bg = state1.isDark
                  ? 'assets/images/img_bg_night.jpg'
                  : 'assets/images/img_bg_light.jpg';
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(bg),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ListView.builder(
                    itemCount: state.notificationsModel?.notifications?.length,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 100.h,
                        child: Card(
                          margin: EdgeInsets.symmetric(vertical: 4.h),
                          color: AppColors.bottomLineColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r)),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 1.h),
                            padding: EdgeInsets.all(12.h),
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(8.r)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state
                                              .notificationsModel
                                              ?.notifications?[index]
                                              .statusId ==
                                          1
                                      ? "Hurmatli foydalanuvchi! Sizning ${textLocale(state.notificationsModel?.notifications?[index].ticket?.referenceModel?.name, state1.lang)} bo'yicha murojaatingiz ijroga qabul qilindi."
                                      : "Hurmatli foydalanuvchi! Sizning ${textLocale(state.notificationsModel?.notifications?[index].ticket?.referenceModel?.name, state1.lang)} bo'yicha murojaatingiz ko’rib chiqildi. Ijrochining javob xati sizga yuborildi.",
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                                Text(
                                  state.notificationsModel
                                          ?.notifications?[index].createdAt
                                          ?.split("T")[0] ??
                                      "--",
                                  style: TextStyle(
                                      fontSize: 12.sp, color: Colors.grey),
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
}

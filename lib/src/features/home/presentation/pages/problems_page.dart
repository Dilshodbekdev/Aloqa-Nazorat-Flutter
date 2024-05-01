import 'package:aloqa_nazorat/src/config/components/app_components.dart';
import 'package:aloqa_nazorat/src/config/components/funs.dart';
import 'package:aloqa_nazorat/src/config/routes/names.dart';
import 'package:aloqa_nazorat/src/core/app_state/cubit/app_cubit.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/references_model.dart';
import 'package:aloqa_nazorat/src/features/home/presentation/manager/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProblemsPage extends StatefulWidget {
  const ProblemsPage({super.key});

  @override
  State<ProblemsPage> createState() => _ProblemsPageState();
}

class _ProblemsPageState extends State<ProblemsPage> {
  late final bloc = context.read<HomeBloc>();

  List<ReferenceModel> allActiveTickets = [];

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ReferenceModel;

    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state1) {
        final bg = state1.isDark
            ? 'assets/images/img_bg_night.jpg'
            : 'assets/images/img_bg_light.jpg';
        return Scaffold(
          appBar: AppBar(
            title: Text(
              textLocale(args.name, state1.lang),
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
          ),
          body: BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state.isProblemsLoaded) {
                allActiveTickets = state.referenceChildren
                        ?.where((element) => element.isActive == true)
                        .toList() ??
                    [];
              }
            },
            builder: (context, state) {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(16.h),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(bg),
                    fit: BoxFit.cover,
                  ),
                ),
                child: (state.isLoading)
                    ? Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.tertiary,
                        ))
                    : Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          removeBottom: true,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: allActiveTickets.length,
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    ListTile(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          AppRoutes.CREATRE_REFERENCE,
                                          arguments: allActiveTickets[index],
                                        );
                                      },
                                      title: Text(
                                        textLocale(allActiveTickets[index].name,
                                            state1.lang),
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ),
                                    const AppDivider(),
                                  ],
                                );
                              }),
                        ),
                      ),
              );
            },
          ),
        );
      },
    );
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:aloqa_nazorat/generated/l10n.dart';
import 'package:aloqa_nazorat/src/config/components/app_elevated_button.dart';
import 'package:aloqa_nazorat/src/config/components/funs.dart';
import 'package:aloqa_nazorat/src/config/components/text_field_components.dart';
import 'package:aloqa_nazorat/src/config/theme/app_colors.dart';
import 'package:aloqa_nazorat/src/core/app_state/cubit/app_cubit.dart';
import 'package:aloqa_nazorat/src/core/services/services.dart';
import 'package:aloqa_nazorat/src/core/util/app_constants.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/user_data.dart';
import 'package:aloqa_nazorat/src/features/home/data/body/create_ticket_body.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/references_model.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/upload_file_model.dart';
import 'package:aloqa_nazorat/src/features/home/presentation/manager/home_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class CreateReferencePage extends StatefulWidget {
  const CreateReferencePage({super.key});

  @override
  State<CreateReferencePage> createState() => _CreateReferencePageState();
}

class _CreateReferencePageState extends State<CreateReferencePage> {
  late final bloc = context.read<HomeBloc>();

  final neighborhoodCon = TextEditingController();
  final streetCon = TextEditingController();
  final homeCon = TextEditingController();
  final textCon = TextEditingController();

  bool _errorNeighborhood = false;
  bool _errorStreet = false;
  bool _errorHome = false;
  bool _errorText = false;
  bool _errorRegion = false;
  bool _errorDistrict = false;

  int regionId = -1;
  int districtId = -1;

  final List<Data> imgFiles = [];
  final List<Data> docFiles = [];
  final List<Data?> allFiles = [];
  String _filePath = "";

  void _pickedImage() {
    showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
          content: Text(S.of(context).rasmManbasiniTanlang),
          actions: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    backgroundColor: AppColors.buttonColorDark),
                child: Text(
                  S.of(context).kamera,
                  style: const TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  pickCameraImage();
                }),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    backgroundColor: AppColors.buttonColorDark),
                child: Text(
                  S.of(context).galereya,
                  style: const TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  pickGalleryImage();
                }),
          ]),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          title: Text(
            S.of(context).murojaatHolati,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
          content: SvgPicture.asset(
            'assets/icons/ic_create_ticket_dialog.svg',
            height: 160,
          ),
          actions: <Widget>[
            Text(
              S
                  .of(context)
                  .sizningMurojatingizMuvaffaqiyatliRavishdaTizmgaYuborildi,
              style: TextStyle(fontSize: 14.sp),
              textAlign: TextAlign.center,
            ),
            8.verticalSpace,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  backgroundColor: AppColors.buttonColorDark),
              child: Text(
                S.of(context).ha,
                style: const TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future pickCameraImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      _filePath = imageTemp.path;
      bloc.uploadFile(imageTemp);
      //setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future pickGalleryImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      _filePath = imageTemp.path;
      bloc.uploadFile(imageTemp);
      //setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
        'pdf',
        'doc',
        'docx',
        'xls',
        'jpeg',
        'png',
        'heic'
      ],
    );

    if (result != null && result.files.single.path != null) {
      snackBar(S.of(context).yuklanmoqda);

      /// Load result and file details
      PlatformFile file = result.files.first;
      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);

      /// normal file
      File file0 = File(result.files.single.path!);
      _filePath = file.path ?? "";
      bloc.uploadFile(file0);
      setState(() {
        //_fileText = _file.path;
      });
    } else {
      /// User canceled the picker
    }
  }

  @override
  void initState() {
    super.initState();
    bloc.regions();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ReferenceModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).murojaatYuborish,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.isUploadFileVerified) {
            if (state.uploadFileModel?.data != null) {
              allFiles.add(
                  state.uploadFileModel?.data?.copyWith(filePath: _filePath));
              imgFiles.clear();
              docFiles.clear();

              for (var element in allFiles) {
                if (element?.fileExtension == "jpg" ||
                    element?.fileExtension == "jpeg" ||
                    element?.fileExtension == "png" ||
                    element?.fileExtension == "heic") {
                  imgFiles.add(element!);
                }
              }

              for (var element in allFiles) {
                if (element?.fileExtension == "pdf" ||
                    element?.fileExtension == "doc" ||
                    element?.fileExtension == "docx" ||
                    element?.fileExtension == "xls") {
                  docFiles.add(element!);
                }
              }
            } else {
              snackBar(S.of(context).yuklanganFaylHajmi10mbDanOshmasligiKerak);
            }
          }
          if (state.isLoginVerified) {
            _showMyDialog();
          }
        },
        builder: (context, state) {
          return FutureBuilder(
              future: Prefs.getString(AppConstants.kUser),
              builder: (context, snapshot) {
                final userString = snapshot.data.toString();
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
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              16.verticalSpace,
                              Text(
                                S.of(context).murojaatniShakllantirish,
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              13.verticalSpace,
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.info,
                                        color: Colors.red,
                                      ),
                                      8.horizontalSpace,
                                      Expanded(
                                          child: Text(
                                        S.of(context).hurmatliFoydalanuvchiMurojaatingizniKoribChiqishnitaminlashUchunOzManzilingizniTogriVa,
                                        style: TextStyle(fontSize: 12.sp, color: Colors.red),
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                              16.verticalSpace,
                              (state.regions?.isNotEmpty == true)
                                  ? DropdownButtonFormField(
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Theme.of(context).textTheme.bodyMedium?.color,
                                      ),
                                      decoration: InputDecoration(
                                        errorStyle: TextStyle(height: 0.h),
                                        errorText: _errorRegion ? "" : null,
                                        filled: true,
                                        fillColor: Theme.of(context).colorScheme.onTertiary,
                                        labelText: S.of(context).viloyatniTanlang,
                                        labelStyle: TextStyle(color: Theme.of(context).colorScheme.tertiary),
                                        border: appTextFiledBorder(context),
                                        enabledBorder: appTextFiledBorder(context),
                                        disabledBorder: appTextFiledBorder(context),
                                        focusedBorder: appTextFiledBorder(context),
                                        errorBorder: appTextFiledErrorBorder(),
                                      ),
                                      borderRadius: BorderRadius.circular(8.r),
                                      items: state.regions?.map((e) {
                                        return DropdownMenuItem(
                                          value: e,
                                          child: Text(textLocale(e.name, state1.lang)),
                                        );
                                      }).toList(),
                                      onChanged: (val) {
                                        bloc.districts(val?.id ?? 1);
                                        regionId = val?.id ?? -1;
                                        setState(() {
                                          _errorRegion = false;
                                        });
                                      },
                                    )
                                  : Center(
                                      child: CircularProgressIndicator(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                    )),
                              16.verticalSpace,
                              if (state.districts?.isNotEmpty == true)
                                DropdownButtonFormField(
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.color),
                                  decoration: InputDecoration(
                                    errorStyle: TextStyle(height: 0.h),
                                    errorText: _errorDistrict ? "" : null,
                                    filled: true,
                                    fillColor: Theme.of(context)
                                        .colorScheme
                                        .onTertiary,
                                    labelText: S.of(context).tumanniTanlang,
                                    labelStyle: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary),
                                    border: appTextFiledBorder(context),
                                    enabledBorder: appTextFiledBorder(context),
                                    disabledBorder: appTextFiledBorder(context),
                                    focusedBorder: appTextFiledBorder(context),
                                    errorBorder: appTextFiledErrorBorder(),
                                  ),
                                  isDense: true,
                                  borderRadius: BorderRadius.circular(8.r),
                                  items: state.districts?.map((e) {
                                    return DropdownMenuItem(
                                      value: e,
                                      child:
                                          Text(textLocale(e.name, state1.lang)),
                                    );
                                  }).toList(),
                                  onChanged: (val) {
                                    districtId = val?.id ?? -1;
                                    setState(() {
                                      _errorDistrict = false;
                                    });
                                  },
                                ),
                              16.verticalSpace,
                              TextField(
                                controller: neighborhoodCon,
                                cursorColor:
                                    Theme.of(context).colorScheme.tertiary,
                                onChanged: (value) {
                                  setState(() {
                                    _errorNeighborhood = false;
                                  });
                                },
                                style: TextStyle(fontSize: 16.sp),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      Theme.of(context).colorScheme.onTertiary,
                                  labelText: S.of(context).mfyOfyNominiKiriting,
                                  labelStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary),
                                  errorStyle: TextStyle(height: 0.h),
                                  errorText: _errorNeighborhood ? "" : null,
                                  border: appTextFiledBorder(context),
                                  enabledBorder: appTextFiledBorder(context),
                                  disabledBorder: appTextFiledBorder(context),
                                  focusedBorder: appTextFiledBorder(context),
                                  errorBorder: appTextFiledErrorBorder(),
                                ),
                              ),
                              16.verticalSpace,
                              TextField(
                                controller: streetCon,
                                cursorColor:
                                    Theme.of(context).colorScheme.tertiary,
                                onChanged: (value) {
                                  setState(() {
                                    _errorStreet = false;
                                  });
                                },
                                style: TextStyle(fontSize: 16.sp),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      Theme.of(context).colorScheme.onTertiary,
                                  labelText: S.of(context).kochaNominiKiriting,
                                  labelStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary),
                                  errorStyle: TextStyle(height: 0.h),
                                  errorText: _errorStreet ? "" : null,
                                  border: appTextFiledBorder(context),
                                  enabledBorder: appTextFiledBorder(context),
                                  disabledBorder: appTextFiledBorder(context),
                                  focusedBorder: appTextFiledBorder(context),
                                  errorBorder: appTextFiledErrorBorder(),
                                ),
                              ),
                              16.verticalSpace,
                              TextField(
                                controller: homeCon,
                                cursorColor:
                                    Theme.of(context).colorScheme.tertiary,
                                onChanged: (value) {
                                  setState(() {
                                    _errorHome = false;
                                  });
                                },
                                style: TextStyle(fontSize: 16.sp),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      Theme.of(context).colorScheme.onTertiary,
                                  labelText: S.of(context).uyRaqaminiKiriting,
                                  labelStyle: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary),
                                  errorStyle: TextStyle(height: 0.h),
                                  errorText: _errorHome ? "" : null,
                                  border: appTextFiledBorder(context),
                                  enabledBorder: appTextFiledBorder(context),
                                  disabledBorder: appTextFiledBorder(context),
                                  focusedBorder: appTextFiledBorder(context),
                                  errorBorder: appTextFiledErrorBorder(),
                                ),
                              ),
                              16.verticalSpace,
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.w, vertical: 12.h),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 200.h,
                                        child: TextField(
                                          keyboardType: TextInputType.multiline,
                                          cursorColor: Theme.of(context)
                                              .colorScheme
                                              .tertiary,
                                          maxLines: 1000,
                                          controller: textCon,
                                          onChanged: (value) {
                                            setState(() {
                                              _errorText = false;
                                            });
                                          },
                                          style: TextStyle(fontSize: 16.sp),
                                          decoration: InputDecoration(
                                            counterText:
                                                "${textCon.text.length} / 1000",
                                            hintText:
                                                S.of(context).murojaatMatni,
                                            hintStyle:
                                                TextStyle(fontSize: 14.sp),
                                            contentPadding:
                                                EdgeInsets.all(12.r),
                                            isCollapsed: true,
                                            filled: true,
                                            fillColor: Theme.of(context)
                                                .colorScheme
                                                .onTertiary,
                                            errorStyle: TextStyle(height: 0.h),
                                            errorText: _errorText ? "" : null,
                                            border: appTextFiledBorder(context),
                                            enabledBorder:
                                                appTextFiledBorder(context),
                                            disabledBorder:
                                                appTextFiledBorder(context),
                                            focusedBorder:
                                                appTextFiledBorder(context),
                                            errorBorder:
                                                appTextFiledErrorBorder(),
                                          ),
                                        ),
                                      ),
                                      12.verticalSpace,
                                      Row(
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              height: 48.h,
                                              child: ElevatedButton.icon(
                                                style: ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                    ),
                                                    backgroundColor: AppColors
                                                        .buttonColorDark),
                                                icon: Icon(
                                                  Icons.add,
                                                  size: 20.r,
                                                  color: Colors.white,
                                                ),
                                                label: Text(
                                                  S.of(context).faylBiriktirish,
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      color: Colors.white),
                                                ),
                                                onPressed: () {
                                                  _pickFile();
                                                },
                                              ),
                                            ),
                                          ),
                                          12.horizontalSpace,
                                          SizedBox(
                                            width: 90.w,
                                            height: 50.h,
                                            child: ElevatedButton.icon(
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r),
                                                  ),
                                                  backgroundColor: AppColors
                                                      .buttonColorDark),
                                              icon: Icon(
                                                Icons.photo_camera_rounded,
                                                size: 20.r,
                                                color: Colors.white,
                                              ),
                                              label: Text(''),
                                              onPressed: () {
                                                _pickedImage();
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      6.verticalSpace,
                                      Text(
                                        "( pdf, doc, docs, xls, jpg, jpeg, png )",
                                        style: TextStyle(fontSize: 13.sp),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              16.verticalSpace,
                              if (imgFiles.isNotEmpty)
                                MediaQuery.removePadding(
                                  context: context,
                                  removeBottom: true,
                                  child: GridView.builder(
                                      shrinkWrap: true,
                                      physics: const ClampingScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemCount: imgFiles.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 4),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            height: 100,
                                            margin: EdgeInsets.all(2.h),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                                image: DecorationImage(
                                                    image: FileImage(File(
                                                        imgFiles[index]
                                                                .filePath ??
                                                            "")),
                                                    fit: BoxFit.cover)),
                                          ),
                                        );
                                      }),
                                ),
                              10.verticalSpace,
                              if (docFiles.isNotEmpty)
                                MediaQuery.removePadding(
                                  context: context,
                                  removeBottom: true,
                                  child: ListView.builder(
                                      physics: const ClampingScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: docFiles.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {},
                                          child: Card(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 4.h),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.r),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 8.h,
                                                  horizontal: 8.w),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 42.h,
                                                    width: 42.h,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(21.h),
                                                        color: AppColors
                                                            .bottomNavNoActiveIconColor),
                                                    child: Icon(
                                                      Icons.attach_file,
                                                      size: 24.r,
                                                    ),
                                                  ),
                                                  8.horizontalSpace,
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Text(
                                                        docFiles[index]
                                                                .fileName ??
                                                            "--",
                                                        style: TextStyle(
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      4.verticalSpace,
                                                      Text(
                                                        '--',
                                                        style: TextStyle(
                                                            fontSize: 12.sp),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              16.verticalSpace,
                              state.isLoading
                                  ? Center(
                                      child: CircularProgressIndicator(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                    ))
                                  : AppElevatedButton(
                                      text: S.of(context).yuborish,
                                      onClick: () {
                                        {
                                          if (districtId != -1 &&
                                              regionId != -1 &&
                                              neighborhoodCon.text.isNotEmpty &&
                                              streetCon.text.isNotEmpty &&
                                              homeCon.text.isNotEmpty &&
                                              textCon.text.isNotEmpty) {
                                            List<int> ids = [];

                                            UserData? user = UserData.fromJson(
                                                jsonDecode(userString));

                                            if (allFiles.isNotEmpty) {
                                              for (var element in allFiles) {
                                                ids.add(element?.id ?? 0);
                                              }
                                            }

                                            bloc.createTicket(CreateTicketBody(
                                                address:
                                                    "${neighborhoodCon.text} ${streetCon.text} ${homeCon.text}",
                                                description: textCon.text,
                                                files: ids,
                                                firstName: user.firstName,
                                                lastName: user.lastName,
                                                letterId: 1,
                                                phone: user.phone,
                                                referenceId: args.id,
                                                referenceParentId:
                                                    args.parentId,
                                                ticketDistrictId: districtId,
                                                ticketRegionId: regionId,
                                                midName: user.midName));
                                          } else {
                                            if (districtId == -1) {
                                              setState(() {
                                                _errorDistrict = true;
                                              });
                                            }
                                            if (regionId == -1) {
                                              setState(() {
                                                _errorRegion = true;
                                              });
                                            }
                                            if (neighborhoodCon.text.isEmpty) {
                                              setState(() {
                                                _errorNeighborhood = true;
                                              });
                                            }
                                            if (streetCon.text.isEmpty) {
                                              setState(() {
                                                _errorStreet = true;
                                              });
                                            }
                                            if (homeCon.text.isEmpty) {
                                              setState(() {
                                                _errorHome = true;
                                              });
                                            }
                                            if (textCon.text.isEmpty) {
                                              setState(() {
                                                _errorText = true;
                                              });
                                            }
                                          }
                                        }
                                      }),
                              16.verticalSpace
                            ],
                          ),
                        ));
                  },
                );
              });
        },
      ),
    );
  }
}

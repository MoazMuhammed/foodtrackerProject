import 'dart:typed_data';
import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtracker/core/cubits/userPosts/user_posts_cubit.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/utills/app_image.dart';
import 'package:foodtracker/core/utills/easy_loading.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/core/widgets/custom_bar_widget.dart';
import 'package:foodtracker/features/Home/view/comment_screen.dart';
import 'package:foodtracker/features/Home/widget/post_widget.dart';
import 'package:foodtracker/features/profile/data/userPostsModel.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final cubit = UserPostsCubit();

  @override
  void initState() {
    cubit.getUserPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<UserPostsCubit, UserPostsState>(
        listener: (context, state) {
          if (state is UserPostsLoading) {
            showLoading();
          }
          if (state is UserPostsSuccess) {
            hideLoading();
          }
          if (state is UserPostsFailure) {
            hideLoading();
            showError("Error");
          }
        },
        builder: (context, state) {
          return SafeArea(
              child: Scaffold(
            body: Column(
              children: [
                ForgetPasswordBarWidget(
                    onPressed: () => pop(context), title: "Profile"),
                // Stack(
                //   alignment: Alignment.topCenter,
                //   children: [
                //     // Padding(
                //     //   padding: EdgeInsets.symmetric(
                //     //       horizontal: 18.sp, vertical: 20.sp),
                //     //   child: Container(
                //     //     decoration: BoxDecoration(
                //     //       boxShadow: [
                //     //         BoxShadow(
                //     //           color: Theme.of(context).brightness ==
                //     //                   Brightness.light
                //     //               ? Colors.grey.withOpacity(0.5)
                //     //               : Colors.grey.withOpacity(0.1),
                //     //           spreadRadius: 5,
                //     //           blurRadius: 7,
                //     //           offset:
                //     //               Offset(0, 3), // changes position of shadow
                //     //         ),
                //     //       ],
                //     //       color:
                //     //           Theme.of(context).brightness == Brightness.light
                //     //               ? Colors.white
                //     //               : Colors.black,
                //     //       borderRadius: BorderRadius.circular(28.sp),
                //     //     ),
                //     //     child: Column(children: [
                //     //       Padding(
                //     //         padding: EdgeInsets.symmetric(
                //     //             vertical: 15.sp, horizontal: 14.sp),
                //     //         child: Center(
                //     //             child: Column(
                //     //           crossAxisAlignment: CrossAxisAlignment.center,
                //     //           mainAxisAlignment: MainAxisAlignment.center,
                //     //           children: [
                //     //             Center(
                //     //               child: Padding(
                //     //                 padding: EdgeInsets.symmetric(
                //     //                   horizontal: 14.sp,
                //     //                 ),
                //     //                 child: Column(
                //     //                   children: [
                //     //                     SizedBox(
                //     //                       height: 6.h,
                //     //                     ),
                //     //                     Text(
                //     //                         MyShared.getString(
                //     //                             key: MySharedKeys.name),
                //     //                         style: TextStyle(
                //     //                             fontSize: 17.sp,
                //     //                             color: Theme.of(context)
                //     //                                         .brightness ==
                //     //                                     Brightness.light
                //     //                                 ? Colors.black
                //     //                                 : Colors.white,
                //     //                             overflow: TextOverflow.ellipsis,
                //     //                             fontWeight: FontWeight.bold),
                //     //                         maxLines: 1),
                //     //                     Text(
                //     //                         MyShared.getString(
                //     //                             key: MySharedKeys.email),
                //     //                         style: TextStyle(
                //     //                           fontSize: 16.sp,
                //     //                           color: Theme.of(context)
                //     //                                       .brightness ==
                //     //                                   Brightness.light
                //     //                               ? Colors.grey
                //     //                               : Colors.white,
                //     //                           overflow: TextOverflow.ellipsis,
                //     //                         ),
                //     //                         maxLines: 1),
                //     //                     SizedBox(
                //     //                       height: 2.h,
                //     //                     ),
                //     //                     Row(
                //     //                       mainAxisAlignment:
                //     //                           MainAxisAlignment.center,
                //     //                       children: [
                //     //                         Column(
                //     //                           children: [
                //     //                             Text("Posts",
                //     //                                 style: TextStyle(
                //     //                                     fontSize: 16.sp,
                //     //                                     color: Theme.of(context)
                //     //                                                 .brightness ==
                //     //                                             Brightness.light
                //     //                                         ? Colors.black
                //     //                                         : Colors.white,
                //     //                                     overflow: TextOverflow
                //     //                                         .ellipsis,
                //     //                                     fontWeight:
                //     //                                         FontWeight.bold),
                //     //                                 maxLines: 1),
                //     //                             Text("12",
                //     //                                 style: TextStyle(
                //     //                                     fontSize: 16.sp,
                //     //                                     color: Theme.of(context)
                //     //                                                 .brightness ==
                //     //                                             Brightness.light
                //     //                                         ? Colors.black
                //     //                                         : Colors.white,
                //     //                                     overflow: TextOverflow
                //     //                                         .ellipsis,
                //     //                                     fontWeight:
                //     //                                         FontWeight.bold),
                //     //                                 maxLines: 1),
                //     //                           ],
                //     //                         ),
                //     //                         SizedBox(
                //     //                           width: 6.w,
                //     //                         ),
                //     //                         Column(
                //     //                           children: [
                //     //                             Text("Follow",
                //     //                                 style: TextStyle(
                //     //                                     fontSize: 16.sp,
                //     //                                     color: Theme.of(context)
                //     //                                                 .brightness ==
                //     //                                             Brightness.light
                //     //                                         ? Colors.black
                //     //                                         : Colors.white,
                //     //                                     overflow: TextOverflow
                //     //                                         .ellipsis,
                //     //                                     fontWeight:
                //     //                                         FontWeight.bold),
                //     //                                 maxLines: 1),
                //     //                             Text("88",
                //     //                                 style: TextStyle(
                //     //                                     fontSize: 16.sp,
                //     //                                     color: Theme.of(context)
                //     //                                                 .brightness ==
                //     //                                             Brightness.light
                //     //                                         ? Colors.black
                //     //                                         : Colors.white,
                //     //                                     overflow: TextOverflow
                //     //                                         .ellipsis,
                //     //                                     fontWeight:
                //     //                                         FontWeight.bold),
                //     //                                 maxLines: 1),
                //     //                           ],
                //     //                         ),
                //     //                         SizedBox(
                //     //                           width: 6.w,
                //     //                         ),
                //     //                         Column(
                //     //                           children: [
                //     //                             Text("Followed",
                //     //                                 style: TextStyle(
                //     //                                     fontSize: 16.sp,
                //     //                                     color: Theme.of(context)
                //     //                                                 .brightness ==
                //     //                                             Brightness.light
                //     //                                         ? Colors.black
                //     //                                         : Colors.white,
                //     //                                     overflow: TextOverflow
                //     //                                         .ellipsis,
                //     //                                     fontWeight:
                //     //                                         FontWeight.bold),
                //     //                                 maxLines: 1),
                //     //                             Text("120",
                //     //                                 style: TextStyle(
                //     //                                     fontSize: 16.sp,
                //     //                                     color: Theme.of(context)
                //     //                                                 .brightness ==
                //     //                                             Brightness.light
                //     //                                         ? Colors.black
                //     //                                         : Colors.white,
                //     //                                     overflow: TextOverflow
                //     //                                         .ellipsis,
                //     //                                     fontWeight:
                //     //                                         FontWeight.bold),
                //     //                                 maxLines: 1),
                //     //                           ],
                //     //                         ),
                //     //                       ],
                //     //                     )
                //     //                   ],
                //     //                 ),
                //     //               ),
                //     //             )
                //     //           ],
                //     //         )),
                //     //       ),
                //     //     ]),
                //     //   ),
                //     // ),
                //     Stack(children: [
                //       Container(
                //           decoration: BoxDecoration(
                //               border: Border.all(width: 0.2.w),
                //               borderRadius: BorderRadius.circular(20.sp),
                //               color: Theme.of(context).brightness ==
                //                       Brightness.light
                //                   ? Colors.black
                //                   : Colors.white),
                //           child: AppImage(
                //               imageUrl:
                //                   "${MyShared.getString(key: MySharedKeys.pic)}",
                //               width: 35.sp,
                //               height: 35.sp,
                //               borderRadius: BorderRadius.circular(20.sp)))
                //     ]),
                //   ],
                // ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.sp),
                    child: Container(
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.white
                                  : Colors.black,
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.grey.withOpacity(0.5)
                                  : Colors.grey.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(18.sp)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.sp, vertical: 18.sp),
                        child: Column(
                          children: [
                            Container(
                                height: 3.h,
                                width: 20.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18.sp),
                                    border: Border.all(color: Colors.grey)),
                                child: Center(child: Text("Posts"))),
                            SizedBox(
                              height: 2.h,
                            ),
                            Expanded(
                              child: ListView.separated(
                                itemBuilder: (context, index) {
                                  UserPostsModel userPostModel = cubit.userPosts[index];
                                  return PostWidget(
                                  name: userPostModel.ownerName,
                                  time: userPostModel.createdAt,
                                  title: userPostModel.title,
                                  likes: userPostModel.likes.length,
                                  onPressed: () { push(context, CommentScreen());},
                                  onPressed1: () async {
                                    safePrint(userPostModel.title);
                                  try {
                                    final ByteData bytes = await rootBundle.load(userPostModel.image);
                                    await Share.file(
                                        'Share image',
                                        'image.jpg',
                                        bytes.buffer.asUint8List(),
                                        'image/jpg',
                                        text:userPostModel.title  // Optional text to share
                                    );

                                  }
                                  catch (e) {
                                    // Handle any exceptions thrown during the share process
                                    print('Error sharing text: $e');
                                    Share.text('my text title',
                                        userPostModel.title, 'text/plain');

                                  }
                                  },
                                );
                                },
                                itemCount: cubit.userPosts.reversed.length,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return Divider(
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? Colors.black
                                        : Colors.white,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.5.h,
                )
              ],
            ),
          ));
        },
      ),
    );
  }
}

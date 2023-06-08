import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtracker/core/cubits/comments/posts/add_comment_cubit.dart';
import 'package:foodtracker/core/cubits/posts/delete_post_cubit.dart';
import 'package:foodtracker/core/cubits/posts/edit/edit_post_cubit.dart';
import 'package:foodtracker/core/cubits/posts/get/get_posts_cubit.dart';
import 'package:foodtracker/core/cubits/posts/likes/likes_cubit.dart';
import 'package:foodtracker/core/cubits/userData/user_data_cubit.dart';
import 'package:foodtracker/core/cubits/userPosts/user_posts_cubit.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/styles/colors.dart';
import 'package:foodtracker/core/utills/app_image.dart';
import 'package:foodtracker/core/utills/easy_loading.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/core/widgets/custom_bar_widget.dart';
import 'package:foodtracker/features/Home/view/comment_screen.dart';
import 'package:foodtracker/features/Home/widget/post_widget.dart';
import 'package:foodtracker/features/profile/data/userPostModel.dart';
import 'package:foodtracker/features/profile/view/edit_post_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final cubit = UserPostsCubit();
  final cubitComment = AddCommentCubit();
  final cubitLike = LikesCubit();
  final cubitUser = GetPostsCubit();
  final cubitDeletePost = DeletePostCubit();
  final cubitEditPost = EditPostCubit();
  final cubitUserDetails = UserDataCubit();
  bool isPressed = false;
  TextEditingController _addCommentController = TextEditingController();
  TextEditingController addCommentController = TextEditingController();

  @override
  void initState() {
    cubit.getUserPost();
    cubitUserDetails.getUserDetails(id: MyShared.getInt(key: MySharedKeys.UID));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubitUserDetails,
      child: BlocProvider(
        create: (context) => cubitEditPost,
        child: BlocProvider(
          create: (context) => cubit,
          child: BlocProvider(
            create: (context) => cubitLike,
            child: BlocProvider(
              create: (context) => cubitComment,
              child: BlocConsumer<UserDataCubit, UserDataState>(
                listener: (context, state) {
                  if (state is UserDataLoading) {
                    showLoading();
                  }
                  if (state is UserDataSuccess) {
                    hideLoading();
                  }
                  if (state is UserDataFailure) {
                    hideLoading();
                  }
                },
                builder: (context, state) {
                  return BlocConsumer<LikesCubit, LikesState>(
                    listener: (context, state) {
                      if (state is AddCommentLoading) {
                        showLoading();
                      }
                      if (state is AddCommentSuccess) {
                        hideLoading();
                      }
                      if (state is AddCommentFailure) {
                        hideLoading();
                        showError("Error");
                      }
                    },
                    builder: (context, state) {
                      return BlocConsumer<EditPostCubit, EditPostState>(
                        listener: (context, state) {
                          if (state is AddCommentLoading) {
                            showLoading();
                          }
                          if (state is AddCommentSuccess) {
                            hideLoading();
                          }
                          if (state is AddCommentFailure) {
                            hideLoading();
                            showError("Error");
                          }
                        },
                        builder: (context, state) {
                          return BlocConsumer<AddCommentCubit, AddCommentState>(
                            listener: (context, state) {
                              if (state is AddCommentLoading) {
                                showLoading();
                              }
                              if (state is AddCommentSuccess) {
                                hideLoading();
                              }
                              if (state is AddCommentFailure) {
                                hideLoading();
                                showError("Error");
                              }
                            },
                            builder: (context, state) {
                              return BlocConsumer<UserPostsCubit,
                                  UserPostsState>(
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
                                  return RefreshIndicator(
                                    onRefresh: () {
                                      return cubit.getUserPost();
                                    },
                                    child: SafeArea(
                                        child: Scaffold(
                                      body: Column(
                                        children: [
                                          ForgetPasswordBarWidget(
                                              onPressed: () => pop(context),
                                              title: "Profile"),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 18.sp,
                                                vertical: 20.sp),
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8.sp,
                                                  vertical: 20.sp),
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.light
                                                        ? Colors.grey
                                                            .withOpacity(0.5)
                                                        : Colors.black54
                                                            .withOpacity(0.1),
                                                    spreadRadius: 5,
                                                    blurRadius: 7,
                                                    offset: Offset(0,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.light
                                                    ? Colors.white
                                                    : Colors.black26,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        12.sp),
                                              ),
                                              child: Column(children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 1.sp,
                                                      horizontal: 14.sp),
                                                  child: Center(
                                                      child: Row(
                                                    children: [
                                                      Container(
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  width: 0.9.w,
                                                                  color: Colors
                                                                      .white),
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                      14.sp),
                                                              color: Theme.of(context).brightness ==
                                                                      Brightness
                                                                          .light
                                                                  ? Colors
                                                                      .white24
                                                                  : Colors
                                                                      .white),
                                                          child: AppImage(
                                                              imageUrl: 'http://moazmuhammed.pythonanywhere.com' +
                                                                  cubitUserDetails
                                                                      .userData
                                                                      .profilePic,
                                                              width: 40.sp,
                                                              height: 40.sp,
                                                              borderRadius:
                                                                  BorderRadius.circular(10.sp))),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      Container(
                                                        height: 40.sp,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(
                                                            color: Theme.of(context)
                                                                        .brightness ==
                                                                    Brightness
                                                                        .light
                                                                ? Colors.black54
                                                                : Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Center(
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                  horizontal:
                                                                      14.sp,
                                                                ),
                                                                child: Column(
                                                                  children: [

                                                                    Text(
                                                                        cubitUserDetails
                                                                            .userData
                                                                            .username,
                                                                        style: TextStyle(
                                                                            fontSize: 18
                                                                                .sp,
                                                                            color: Theme.of(context).brightness == Brightness.light
                                                                                ? Colors
                                                                                    .black
                                                                                : Colors
                                                                                    .white,
                                                                            overflow: TextOverflow
                                                                                .ellipsis,
                                                                            fontWeight: FontWeight
                                                                                .bold),
                                                                        maxLines:
                                                                            1),
                                                                    SizedBox(
                                                                      height:
                                                                          0.4.h,
                                                                    ),
                                                                    Text(
                                                                        cubitUserDetails
                                                                            .userData
                                                                            .email,
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              16.sp,
                                                                          color: Theme.of(context).brightness ==
                                                                                  Brightness.light
                                                                              ? Colors.grey
                                                                              : Colors.white,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                        maxLines:
                                                                            1),
                                                                    SizedBox(
                                                                      height:
                                                                          2.5.h,
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Row(
                                                                          children: [
                                                                            Text(
                                                                                "Posts: ",
                                                                                style: TextStyle(fontSize: 16.sp, color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white, overflow: TextOverflow.ellipsis, fontWeight: FontWeight.bold),
                                                                                maxLines: 1),
                                                                            Text(
                                                                                "${cubit.userPosts.length}",
                                                                                style: TextStyle(fontSize: 16.sp, color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white, overflow: TextOverflow.ellipsis, fontWeight: FontWeight.bold),
                                                                                maxLines: 1),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                                ),
                                              ]),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 15.sp),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 5.sp,
                                                    vertical: 10.sp),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                        height: 3.h,
                                                        width: 20.w,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.sp),
                                                            border: Border.all(
                                                                color: Colors
                                                                    .grey)),
                                                        child: Center(
                                                            child:
                                                                Text("Posts"))),
                                                    SizedBox(
                                                      height: 2.h,
                                                    ),
                                                    Expanded(
                                                        child: ListView.builder(
                                                      itemBuilder:
                                                          (context, index) {
                                                        UserPostModel
                                                            userPostModel =
                                                            cubit.userPosts[
                                                                index];
                                                        return Column(
                                                          children: [
                                                            PostWidget(
                                                              imageUser:
                                                                  userPostModel
                                                                      .ownerProfilePic,
                                                              name: userPostModel
                                                                  .ownerName,
                                                              time: userPostModel
                                                                  .createdAt,
                                                              title:
                                                                  userPostModel
                                                                      .title,
                                                              image:
                                                                  userPostModel
                                                                      .image,
                                                              likes:
                                                                  userPostModel
                                                                      .comments
                                                                      .length,
                                                              onPressed1:
                                                                  () async {
                                                                safePrint(
                                                                    userPostModel
                                                                        .title);
                                                                try {
                                                                  final ByteData
                                                                      bytes =
                                                                      await rootBundle
                                                                          .load(
                                                                              userPostModel.image);
                                                                  await Share.file(
                                                                      'Share image',
                                                                      'image.jpg',
                                                                      bytes
                                                                          .buffer
                                                                          .asUint8List(),
                                                                      'image/jpg',
                                                                      text: userPostModel
                                                                          .title // Optional text to share
                                                                      );
                                                                } catch (e) {
                                                                  // Handle any exceptions thrown during the share process
                                                                  print(
                                                                      'Error sharing text: $e');
                                                                  Share.text(
                                                                      'my text title',
                                                                      userPostModel
                                                                          .title,
                                                                      'text/plain');
                                                                }
                                                              },
                                                              allergyType:
                                                                  userPostModel
                                                                      .allergyEnglishName
                                                                      .toString(),
                                                              share: () async {
                                                                safePrint(
                                                                    userPostModel
                                                                        .title);
                                                                try {
                                                                  final ByteData
                                                                      bytes =
                                                                      await rootBundle
                                                                          .load(
                                                                              userPostModel.image);
                                                                  await Share.file(
                                                                      'Share image',
                                                                      'image.jpg',
                                                                      bytes
                                                                          .buffer
                                                                          .asUint8List(),
                                                                      'image/jpg',
                                                                      text: userPostModel
                                                                          .title // Optional text to share
                                                                      );
                                                                } catch (e) {
                                                                  // Handle any exceptions thrown during the share process
                                                                  print(
                                                                      'Error sharing text: $e');
                                                                  Share.text(
                                                                      'my text title',
                                                                      userPostModel
                                                                          .title,
                                                                      'text/plain');
                                                                }
                                                              },
                                                              commentScreen:
                                                                  () {
                                                                push(
                                                                    context,
                                                                    CommentScreen(
                                                                      id: userPostModel
                                                                          .id
                                                                          .toInt(),
                                                                      onPressed:
                                                                          () {
                                                                        safePrint(
                                                                            "message");
                                                                        cubitComment.postComment(
                                                                            postID:
                                                                                userPostModel.id.toInt(),
                                                                            text: _addCommentController.text);
                                                                      },
                                                                    ));
                                                              },
                                                              id: userPostModel
                                                                  .id
                                                                  .toInt(),
                                                              controller:
                                                                  _addCommentController,
                                                              like: () {
                                                                safePrint(
                                                                    'message');
                                                                setState(() {
                                                                  userPostModel.isLiked =! userPostModel.isLiked;
                                                                  cubitLike.likes(
                                                                      id: userPostModel
                                                                          .id
                                                                          .toInt());
                                                                });
                                                              },
                                                              onPressed7: () {
                                                                safePrint("0");
                                                                cubitComment.postComment(
                                                                    postID: userPostModel
                                                                        .id
                                                                        .toInt(),
                                                                    text: _addCommentController
                                                                        .text);
                                                              },
                                                              color: userPostModel.isLiked == true ? Colors.red : Colors.black,
                                                              deletePost: () {
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) =>
                                                                            AlertDialog(
                                                                              actions: <Widget>[
                                                                                Column(
                                                                                  children: [
                                                                                    Center(
                                                                                      child: TextButton(
                                                                                        style: TextButton.styleFrom(
                                                                                          textStyle: Theme.of(context).textTheme.labelLarge,
                                                                                        ),
                                                                                        child: Text('Edit Post', style: TextStyle(fontSize: 16.sp, color: AppColors.primary, fontWeight: FontWeight.bold)),
                                                                                        onPressed: () {
                                                                                          push(context, EditPostScreen(userPostModel.id.toInt(), userPostModel.title, userPostModel.image));
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                    TextButton(
                                                                                      style: TextButton.styleFrom(
                                                                                        textStyle: Theme.of(context).textTheme.labelLarge,
                                                                                      ),
                                                                                      child: Text('Delete Post', style: TextStyle(fontSize: 16.sp, color: AppColors.primary, fontWeight: FontWeight.bold)),
                                                                                      onPressed: () {
                                                                                        this.cubitDeletePost.deletePosts(Id: userPostModel.id.toInt());
                                                                                        pop(context);
                                                                                      },
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ));
                                                              },
                                                              visible: true,
                                                            ),
                                                            SizedBox(
                                                              height: 2.h,
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                      itemCount: cubit.userPosts
                                                          .reversed.length,
                                                    ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 0.5.h,
                                          )
                                        ],
                                      ),
                                    )),
                                  );
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

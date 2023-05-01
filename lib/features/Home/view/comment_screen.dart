import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtracker/core/cubits/comments/comments_cubit.dart';
import 'package:foodtracker/core/cubits/comments/posts/add_comment_cubit.dart';
import 'package:foodtracker/core/cubits/posts/get/get_posts_cubit.dart';
import 'package:foodtracker/core/shared_preferences/my_shared.dart';
import 'package:foodtracker/core/shared_preferences/my_shared_keys.dart';
import 'package:foodtracker/core/utills/app_image.dart';
import 'package:foodtracker/core/utills/easy_loading.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/core/utills/svg.dart';
import 'package:foodtracker/core/widgets/custom_bar_widget.dart';
import 'package:foodtracker/features/Home/data/commentPostModel.dart';
import 'package:foodtracker/features/Home/widget/comment_widget.dart';
import 'package:foodtracker/features/Home/widget/text_form_field_comment.dart';
import 'package:foodtracker/generated/l10n.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/styles/colors.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({
    Key? key,
    required this.id,
    required this.onPressed,
  }) : super(key: key);
  final int id;
  final GestureTapCallback onPressed;

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final cubit = CommentsCubit();
  TextEditingController addCommentController = TextEditingController();
  final cubitComment = AddCommentCubit();

  @override
  void initState() {
    cubit.getPost(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubitComment,
      child: BlocProvider(
        create: (context) => cubit,
        child: BlocConsumer<AddCommentCubit, AddCommentState>(
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
            return BlocConsumer<CommentsCubit, CommentsState>(
              listener: (context, state) {
                if (state is GetPostsLoading) {
                  showLoading();
                }
                if (state is GetPostsSuccess) {
                  hideLoading();
                }
                if (state is GetPostsFailure) {
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
                          onPressed: () => pop(context),
                          title: "${S().comment}"),
                      Visibility(
                          visible: true,
                          child: MyShared.getBoolean(
                                  key: MySharedKeys.is_doctor)
                              ? Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5.sp, horizontal: 20.sp),
                                    child: ListView.builder(
                                        itemBuilder: (context, index) {
                                          CommentPostModel commentPostModel =
                                              cubit.comment[index];
                                          return CommentWidget(
                                            name: commentPostModel.owner,
                                            time: commentPostModel.createdDate,
                                            comment: commentPostModel.text,
                                          );
                                        },
                                        itemCount: cubit.comment.length),
                                  ),
                                )
                              : Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5.sp, horizontal: 20.sp),
                                    child: cubit.comment.isEmpty
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              AppSVG(assetName: 'emtyComment'),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Text(
                                                  "Sorry their is no comments for Now ",
                                                  style: TextStyle(
                                                      fontSize: 15.sp)),
                                            ],
                                          )
                                        : ListView.separated(
                                            itemBuilder: (context, index) {
                                              CommentPostModel
                                                  commentPostModel =
                                                  cubit.comment[index];

                                              return CommentWidget(
                                                name: commentPostModel.owner,
                                                time: commentPostModel
                                                    .createdDate,
                                                comment: commentPostModel.text,
                                              );
                                            },
                                            itemCount: cubit.comment.length,
                                            separatorBuilder:
                                                (BuildContext context,
                                                    int index) {
                                              return Divider(
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.light
                                                    ? Colors.grey.shade500
                                                    : Colors.grey,
                                              );
                                            },
                                          ),
                                  ),
                                )),
                      Visibility(
                          visible: true,
                          child: MyShared.getBoolean(
                                  key: MySharedKeys.is_doctor)
                              ? Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.sp, vertical: 12.sp),
                                  child: Row(
                                    children: [
                                      AppImage(
                                          imageUrl: 'http://10.0.2.2:8000//' +
                                              MyShared.getString(
                                                  key: MySharedKeys.userImage),
                                          width: 28.sp,
                                          height: 28.sp,
                                          borderRadius:
                                              BorderRadius.circular(30.sp)),
                                      Expanded(
                                        child: AppComment(
                                          hint: "${S().addComment}",
                                          keyboardType: TextInputType.text,
                                          controller: addCommentController,
                                          textInputAction: TextInputAction.send,
                                          textInputType: TextInputType.text,
                                          icon: Icons.send,
                                          sufColor: MyShared.getBoolean(
                                                      key: MySharedKeys
                                                          .is_doctor) ==
                                                  true
                                              ? AppColors.primary
                                              : Colors.grey,
                                          enable: MyShared.getBoolean(
                                                      key: MySharedKeys
                                                          .is_doctor) ==
                                                  true
                                              ? true
                                              : false,
                                          onPressed: () {
                                            safePrint("message");
                                            cubitComment.postComment(
                                                postID: widget.id,
                                                text:
                                                    addCommentController.text);
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.sp, vertical: 15.sp),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14.sp),
                                    border: Border.all(width: 0.2.w),
                                  ),
                                  child: Center(
                                      child: Text(
                                          "only The Admins And Doctors can set a comment")),
                                )),
                    ],
                  ),
                ));
              },
            );
          },
        ),
      ),
    );
  }
}

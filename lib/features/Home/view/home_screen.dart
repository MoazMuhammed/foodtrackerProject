import 'dart:typed_data';

import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtracker/core/cubits/comments/posts/add_comment_cubit.dart';
import 'package:foodtracker/core/cubits/posts/get/get_posts_cubit.dart';
import 'package:foodtracker/core/cubits/posts/likes/likes_cubit.dart';
import 'package:foodtracker/core/utills/easy_loading.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/utills/safe_print.dart';
import 'package:foodtracker/core/widgets/app_bar.dart';
import 'package:foodtracker/core/widgets/app_search.dart';
import 'package:foodtracker/features/Home/data/postsModel.dart';
import 'package:foodtracker/features/Home/view/comment_screen.dart';
import 'package:foodtracker/features/Home/widget/post_widget.dart';
import 'package:foodtracker/generated/l10n.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final cubit = GetPostsCubit();
  final cubitComment = AddCommentCubit();
  final cubitLike = LikesCubit();
  bool isPressed = false;
  TextEditingController addCommentController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    cubit.getPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocProvider(
        create: (context) => cubitComment,
        child: BlocProvider(
          create: (context) => cubitLike,
          child: BlocConsumer<LikesCubit, LikesState>(
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
                  return BlocConsumer<GetPostsCubit, GetPostsState>(
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
                      return RefreshIndicator(
                        onRefresh: () {
                          return cubit.getPost();
                        },
                        child: Column(
                          children: [
                            SizedBox(height: 18.sp,),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 18.sp),
                              child: AppBarWidget(),
                            ),
                            AppSearch(
                              hint: '${S().search}',
                              keyboardType: TextInputType.text,
                              controller: TextEditingController(),
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.text,
                              onChanged: (value) {
                                cubit.getPostFromSearch(text:value );

                              },
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Expanded(
                                child: ListView.builder(
                              itemBuilder: (context, index) {
                                PostsModel postModel = cubit.posts[index];
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.sp,),
                                  child: Column(
                                    children: [
                                      PostWidget(
                                        imageUser:postModel.ownerProfilePic ,
                                        name: postModel.ownerName,
                                        time: postModel.createdAt,
                                        title: postModel.title,
                                        image: postModel.image,
                                        likes: postModel.likes.length,
                                        onPressed1: () async {
                                          safePrint(postModel.title);
                                          try {
                                            final ByteData bytes = await rootBundle
                                                .load(postModel.image);
                                            await Share.file(
                                                'esys image',
                                                "esys.jpg",
                                                bytes.buffer.asUint64List(),
                                                "image/jpg",
                                                text: postModel
                                                    .image // Optional text to share
                                                );
                                          } catch (e) {
                                            // Handle any exceptions thrown during the share process
                                            print('Error sharing text: $e');
                                            Share.text('my text title',
                                                postModel.title, 'text/plain');
                                          }
                                        },
                                        allergyType: postModel.allergyEnglishName.toString() ,
                                        share: () async {
                                          safePrint(postModel.title);
                                          try {
                                            final ByteData bytes = await rootBundle
                                                .load(postModel.image);
                                            await Share.file(
                                                'Share image',
                                                'image.jpg',
                                                bytes.buffer.asUint8List(),
                                                'image/jpg',
                                                text: postModel
                                                    .title // Optional text to share
                                                );
                                          } catch (e) {
                                            // Handle any exceptions thrown during the share process
                                            print('Error sharing text: $e');
                                            Share.text('my text title',
                                                postModel.title, 'text/plain');
                                          }
                                        },
                                        commentScreen: () {
                                          push(
                                              context,
                                              CommentScreen(
                                                  id: postModel.id.toInt(), onPressed: () {   cubitComment.postComment(
                                                  postID: postModel.id.toInt(),
                                                  text: addCommentController.text); },));
                                        },
                                        id: postModel.id.toInt(),
                                        controller: addCommentController,
                                        like: () {
                                          setState(() {
                                            postModel.isLiked =! postModel.isLiked;
                                            cubitLike.likes(
                                                id: postModel.id.toInt()
                                            );

                                          });
                                        },
                                        onPressed7: () {
                                          cubitComment.postComment(
                                          postID: postModel.id.toInt(),
                                          text: addCommentController.text);addCommentController.clear(); }, deletePost: () {  }, visible: false   ,color: postModel.isLiked == true ? Colors.red : Colors.black,

                                      ),
                                  SizedBox(height: 3.h),

                                  ],
                                  ),
                                );
                              },
                              itemCount: cubit.posts.reversed.length,

                            ))
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'dart:typed_data';

import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtracker/core/cubits/posts/get/get_posts_cubit.dart';
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

  @override
  void initState() {
    cubit.getPost();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<GetPostsCubit, GetPostsState>(
        listener: (context, state) {
          if (state is GetPostsLoading) {
            showLoading();
          }
          if (state is GetPostsSuccess) {
            hideLoading();
          }
          if (state is  GetPostsFailure) {
            hideLoading();
            showError("Error");
          }        },
        builder: (context, state) {
          return RefreshIndicator(

            onRefresh: () {
              return cubit.getPost();

            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.sp, vertical: 18.sp),
              child: Column(
                children: [
                  AppBarWidget(),
                  AppSearch(
                    hint: '${S().search}',
                    keyboardType: TextInputType.text,
                    controller: TextEditingController(),
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Expanded(child:
                  ListView.separated(itemBuilder: (context, index) {
                    PostsModel postModel = cubit.posts[index];
                    return PostWidget(
                      name: postModel.ownerName,
                      time: postModel.createdAt,
                      title: postModel.title,
                      image: postModel.image,
                      likes: postModel.likes.length, onPressed: () {
                        push(context, CommentScreen());},
                      onPressed1: () async {
                      safePrint(postModel.title);
                      try {
                      final ByteData bytes = await rootBundle.load(postModel.image);
                      await Share.file(
                          'Share image',
                          'image.jpg',
                          bytes.buffer.asUint8List(),
                          'image/jpg',
                          text:postModel.title  // Optional text to share
                      );

                      }
                      catch (e) {
                        // Handle any exceptions thrown during the share process
                        print('Error sharing text: $e');
                        Share.text('my text title',
                            postModel.title, 'text/plain');

                      }

                      }

                    ,);
                  }, itemCount: cubit.posts.reversed.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        color: Theme
                            .of(context)
                            .brightness == Brightness.light
                            ? Colors.grey.shade300
                            : Colors
                            .grey,

                      );
                    },))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

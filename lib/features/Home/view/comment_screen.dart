import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtracker/core/cubits/posts/get/get_posts_cubit.dart';
import 'package:foodtracker/core/utills/app_image.dart';
import 'package:foodtracker/core/utills/easy_loading.dart';
import 'package:foodtracker/core/utills/navigators.dart';
import 'package:foodtracker/core/widgets/app_search.dart';
import 'package:foodtracker/core/widgets/custom_bar_widget.dart';
import 'package:foodtracker/core/widgets/text_form_field.dart';
import 'package:foodtracker/features/Home/data/postsModel.dart';
import 'package:foodtracker/features/Home/widget/comment_widget.dart';
import 'package:foodtracker/features/Home/widget/text_form_field_comment.dart';
import 'package:foodtracker/generated/l10n.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen(
      {Key? key,})
      : super(key: key);


  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
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
                    onPressed: () => pop(context), title: "${S().comment}"),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.sp, horizontal: 20.sp),
                    child: ListView.builder(

                        itemBuilder: (context, index) {
                          Comments comments = cubit.comments[index];

                          return CommentWidget(


                              name: comments.owner,
                              time: comments.createdDate,
                              comment: comments.text,
                            );
                        },

                        itemCount: cubit.comments.length),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.sp, vertical: 12.sp),
                  child: Row(
                    children: [
                      AppImage(
                          imageUrl:
                              "https://media.istockphoto.com/id/1309328823/photo/headshot-portrait-of-smiling-male-employee-in-office.jpg?b=1&s=612x612&w=0&k=20&c=eU56mZTN4ZXYDJ2SR2DFcQahxEnIl3CiqpP3SOQVbbI=",
                          width: 30.sp,
                          height: 30.sp,
                          borderRadius: BorderRadius.circular(30.sp)),
                      Expanded(
                        child:
                        AppComment(
                          hint: "${S().addComment}",
                          keyboardType: TextInputType.text,
                          controller: TextEditingController(),
                          textInputAction: TextInputAction.send,
                          textInputType: TextInputType.text,

                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ));
        },
      ),
    );
  }
}

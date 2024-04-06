import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_app/app/network/utils/log_util.dart';
import 'package:stock_app/app/theme/app_colors.dart';
import 'package:stock_app/app/widgets/common_app_bar.dart';
import 'package:stock_app/app/widgets/common_text.dart';
import 'package:stock_app/app/widgets/image.dart';

import '../controllers/tutorial_controller.dart';

class TutorialView extends GetView<TutorialController> {
  const TutorialView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CommonAppBar(title: "Tutorial"),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Flexible(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) => _singleTutorialItem(context, () {
                            Alert.log(runtimeType.toString(), "CLICK");
                          })),
                ),
              ],
            )));
  }

  Widget _singleTutorialItem(BuildContext context, VoidCallback callback) {
    return GestureDetector(
      onTap: () {
        callback();
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(left: 8, right: 8),
        decoration: carDecoration,
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Container(
              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8))),
              child: SquareImageFromNetwork(
                imageUrl:
                    "https://media.licdn.com/dms/image/C4D03AQF_SFRTefclCQ/profile-displayphoto-shrink_200_200/0/1643266035268?e=2147483647&v=beta&t=QYc3CC5AqG8oBq767o2TlJDnu4MoYOxbRLY0J2dOXZA",
                fit: BoxFit.cover,
                size: MediaQuery.of(context).size.height * .35,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Flexible(
              child: SingleChildScrollView(
                child: CommonText.regular(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin non tellus ante. Nulla mattis urna eu elit faucibus tincidunt. Quisque id egestas eros. Suspendisse potenti. Mauris ultricies urna vitae euismod faucibus. Morbi eu purus dictum, egestas felis sit amet, tincidunt diam. Ut gravida rhoncus hendrerit. Integer eget eros et sem ultrices mollis. Aenean lacinia elit id nulla porta, ac sodales enim lacinia. Donec viverra risus nec neque dignissim, id consectetur nisi ornare. Nullam vel lorem in lorem faucibus viverra. Nulla congue malesuada sagittis. Proin vel malesuada nisl. Vestibulum at lectus id eros bibendum molestie quis sed dolor. Vestibulum interdum in diam quis laoreet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin non tellus ante. Nulla mattis urna eu elit faucibus tincidunt. Quisque id egestas eros. Suspendisse potenti. Mauris ultricies urna vitae euismod faucibus. Morbi eu purus dictum, egestas felis sit amet, tincidunt diam. Ut gravida rhoncus hendrerit. Integer eget eros et sem ultrices mollis. Aenean lacinia elit id nulla porta, ac sodales enim lacinia. Donec viverra risus nec neque dignissim, id consectetur nisi ornare. Nullam vel lorem in lorem faucibus viverra. Nulla congue malesuada sagittis. Proin vel malesuada nisl. Vestibulum at lectus id eros bibendum molestie quis sed dolor. Vestibulum interdum in diam quis laoreet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin non tellus ante. Nulla mattis urna eu elit faucibus tincidunt. Quisque id egestas eros. Suspendisse potenti. Mauris ultricies urna vitae euismod faucibus. Morbi eu purus dictum, egestas felis sit amet, tincidunt diam. Ut gravida rhoncus hendrerit. Integer eget eros et sem ultrices mollis. Aenean lacinia elit id nulla porta, ac sodales enim lacinia. Donec viverra risus nec neque dignissim, id consectetur nisi ornare. Nullam vel lorem in lorem faucibus viverra. Nulla congue malesuada sagittis. Proin vel malesuada nisl. Vestibulum at lectus id eros bibendum molestie quis sed dolor. Vestibulum interdum in diam quis laoreet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin non tellus ante. Nulla mattis urna eu elit faucibus tincidunt. Quisque id egestas eros. Suspendisse potenti. Mauris ultricies urna vitae euismod faucibus. Morbi eu purus dictum, egestas felis sit amet, tincidunt diam. Ut gravida rhoncus hendrerit. Integer eget eros et sem ultrices mollis. Aenean lacinia elit id nulla porta, ac sodales enim lacinia. Donec viverra risus nec neque dignissim, id consectetur nisi ornare. Nullam vel lorem in lorem faucibus viverra. Nulla congue malesuada sagittis. Proin vel malesuada nisl. Vestibulum at lectus id eros bibendum molestie quis sed dolor. Vestibulum interdum in diam quis laoreet. ",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

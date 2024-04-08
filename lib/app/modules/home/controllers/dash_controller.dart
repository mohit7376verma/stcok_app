import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../models/TutorialModel.dart';
import '../../../utils/constants.dart';

class DashController extends GetxController {
  RxInt currentIndex = 0.obs;
  RxInt drawerOpenIndex = 0.obs;
  late PersistentTabController persistantController;
  var isDrawerOpen = false.obs;

  PageController pageCtrl = PageController(initialPage: 0, keepPage: true);
  var scaffoldKey = GlobalObjectKey<ScaffoldState>(ScaffoldState());

  TextEditingController searchController = TextEditingController();
  final FocusNode searchFocus = FocusNode();

  //News View
  RxList<TutorialModel> newsList = <TutorialModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    newsList.clear();
    newsList.add(TutorialModel(dummyText, false));
    newsList.add(TutorialModel(dummyText, false));
    newsList.add(TutorialModel(dummyText, false));
    newsList.add(TutorialModel(dummyText, false));
    newsList.add(TutorialModel(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin non tellus ante. Nulla mattis urna eu elit faucibus tincidunt. Quisque id egestas eros. Suspendisse potenti. Mauris ultricies urna vitae euismod faucibus. Morbi eu purus dictum, egestas felis sit amet, tincidunt diam. Ut gravida rhoncus hendrerit. Integer eget eros et sem ultrices mollis. Aenean lacinia elit id nulla porta, ac sodales enim lacinia. Donec viverra risus nec neque dignissim, id consectetur nisi ornare. Nullam vel lorem in lorem faucibus viverra. Nulla congue malesuada sagittis. Proin vel malesuada nisl. Vestibulum at lectus id eros bibendum molestie quis sed dolor. Vestibulum interdum in diam quis laoreet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin non tellus ante. Nulla mattis urna eu elit faucibus tincidunt. Quisque id egestas eros. Suspendisse potenti. Mauris ultricies urna vitae euismod faucibus. Morbi eu purus dictum, egestas felis sit amet, tincidunt diam. Ut gravida rhoncus hendrerit. Integer eget eros et sem ultrices mollis. Aenean lacinia elit id nulla porta, ac sodales enim lacinia. Donec viverra risus nec neque dignissim, id consectetur nisi ornare. Nullam vel lorem in lorem faucibus viverra. Nulla congue malesuada sagittis. Proin vel malesuada nisl. Vestibulum at lectus id eros bibendum molestie quis sed dolor. Vestibulum interdum in diam quis laoreet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin non tellus ante. Nulla mattis urna eu elit faucibus tincidunt. Quisque id egestas eros. Suspendisse potenti. Mauris ultricies urna vitae euismod faucibus. Morbi eu purus dictum, egestas felis sit amet, tincidunt diam. Ut gravida rhoncus hendrerit. Integer eget eros et sem ultrices mollis. Aenean lacinia elit id nulla porta, ac sodales enim lacinia. Donec viverra risus nec neque dignissim, id consectetur nisi ornare. Nullam vel lorem in lorem faucibus viverra. Nulla congue malesuada sagittis. Proin vel malesuada nisl. Vestibulum at lectus id eros bibendum molestie quis sed dolor. Vestibulum interdum in diam quis laoreet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin non tellus ante. Nulla mattis urna eu elit faucibus tincidunt. Quisque id egestas eros. Suspendisse potenti. Mauris ultricies urna vitae euismod faucibus. Morbi eu purus dictum, egestas felis sit amet, tincidunt diam. Ut gravida rhoncus hendrerit. Integer eget eros et sem ultrices mollis. Aenean lacinia elit id nulla porta, ac sodales enim lacinia. Donec viverra risus nec neque dignissim, id consectetur nisi ornare. Nullam vel lorem in lorem faucibus viverra. Nulla congue malesuada sagittis. Proin vel malesuada nisl. Vestibulum at lectus id eros bibendum molestie quis sed dolor. Vestibulum interdum in diam quis laoreet.",
        false));
    persistantController = PersistentTabController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  chatRefresh() async{

  }

  onPageChanged(int index) {
    try {
      pageCtrl.animateToPage(index, duration: const Duration(milliseconds: 350), curve: Curves.ease);
      currentIndex.value = index;
    } catch (e) {
      e.printError();
    }
  }
}

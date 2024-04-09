import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:stock_app/app/network/repository/dash_repository.dart';
import 'package:stock_app/app/network/response/StockListResponse.dart';
import 'package:stock_app/app/network/utils/log_util.dart';

import '../../../models/TutorialModel.dart';
import '../../../utils/constants.dart';
import '../../../utils/custom_loader.dart';
import '../../../widgets/widgets.dart';

class DashController extends GetxController {
  RxInt currentIndex = 0.obs;
  RxInt drawerOpenIndex = 0.obs;
  late PersistentTabController persistantController;
  var isDrawerOpen = false.obs;

  PageController pageCtrl = PageController(initialPage: 0, keepPage: true);
  var scaffoldKey = GlobalObjectKey<ScaffoldState>(ScaffoldState());

  //Market View
  TextEditingController searchController = TextEditingController();
  final FocusNode searchFocus = FocusNode();
  ScrollController stockScrollController = ScrollController();
  RxList<Results> stockList = <Results>[].obs;
  List<Results> mailList = <Results>[];
  var stockNextUrl = "";
  RxBool isLoading = false.obs;

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

    stockScrollController.addListener(() {
      if (stockScrollController.position.pixels == stockScrollController.position.maxScrollExtent) {
        if (stockNextUrl.isNotEmpty) {
          getStockList(true);
        }
      }
    });

    /*searchController.addListener(() {
      if (searchController.text.length > 1) {
        searchStocks();
      } else {
        print("CALLEd \n Main SIZE ${mailList.length} \n STOCK SIZE ${stockList.length}");
        if(stockList.length != mailList.length){
          stockList.value = mailList;
        }
      }
    });*/
  }

  @override
  void onReady() {
    super.onReady();
    getStockList(false);
  }

  @override
  void onClose() {
    super.onClose();
  }

  chatRefresh() async {}

  onPageChanged(int index) {
    try {
      pageCtrl.animateToPage(index, duration: const Duration(milliseconds: 350), curve: Curves.ease);
      currentIndex.value = index;
    } catch (e) {
      e.printError();
    }
  }

  void getStockList(bool isLoadMore) async {
   if(isLoadMore) {
     isLoading.value = true;
   } else {
     Loader.showLoading();
   }
    var query = <String, dynamic>{};
    query["market"] = "stocks";
    query["active"] = true;
    if (isLoadMore) {
      query["cursor"] = stockNextUrl;
    }

    var repo = await DashRepository().getStockList(query);
    repo.when(success: (value) {
      if(isLoadMore) {
        isLoading.value = false;
      } else {
        Loader.hideLoading();
      }
      Alert.log(runtimeType.toString(), "RESPONSE ${value.toJson()}");
      if (value.results?.isNotEmpty == true) {
        value.results?.forEach((element) {
          if (stockList.contains(element) == false) {
            stockList.add(element);
          }
        });
        Alert.log(runtimeType.toString(), "STOCK LIST SIZE ${stockList.length}");
      }

      stockNextUrl = value.nextUrl?.split("cursor=").last ?? "";
      Alert.log(runtimeType.toString(), "STOCK NEXT URL $stockNextUrl");

      mailList = stockList;
    }, error: (error) {
      if(isLoadMore) {
        isLoading.value = false;
      } else {
        Loader.hideLoading();
      }
      showSheet(context: Get.context as BuildContext, title: "Error", message: error.errorMessage, primaryBtnText: "Okay", onPrimaryBtnClick: () => Get.back());
    });
  }

  void searchStocks() {
    if (searchController.text.isNotEmpty) {
      print("MAIN SIZE ${mailList.length}");
      var filterList = mailList.where((element) => element.name?.contains(searchController.text) ?? false);
      stockList.clear();
      if (filterList.isNotEmpty) {
        print("INSIDE");
        stockList.value = filterList.toList();
      }
      Alert.log(runtimeType.toString(), "FILTER LIST SIZE ${filterList.length}");
    }
  }
}


import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PaginationController extends GetxController{

  final RxList<int> items = List.generate(20, (index)=> index +1).obs;
  final ScrollController scrollController = ScrollController();
  var isLoading = false.obs;

  @override
  void onInit(){
    super.onInit();
    scrollController.addListener(_onScroll);
  }

  @override
  void onClose(){
    scrollController.dispose();
    super.onClose();
  }

  void _onScroll(){
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent && ! isLoading.value){
      loadMoreItems();
    }
  }
  Future<void> loadMoreItems()async{
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    final newItems = List.generate(20, (index)=> items.length + index +1);
    items.addAll(newItems);
    isLoading.value = false;
  }
}

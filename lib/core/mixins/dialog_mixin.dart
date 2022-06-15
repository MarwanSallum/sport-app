import 'package:get/get.dart';

mixin DialogMixin{
  showLoading(){
    // TODO: Make dialog to show when is loading
    Future.delayed(const Duration(seconds: 5));
  }

  hideLoading({int? nestedNavigationID}){
    if(Get.isDialogOpen == true) {
      Get.back(id: nestedNavigationID );
    }
  }
}
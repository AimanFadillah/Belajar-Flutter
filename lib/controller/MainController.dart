import 'package:get/get.dart';

class MainController extends GetxController{
  RxInt count = RxInt(0);
  increment() => count.value++;
}
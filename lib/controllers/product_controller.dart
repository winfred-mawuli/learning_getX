import 'package:get/get.dart';
import 'package:learning_getx/apiModule/apiModule.dart';
import 'package:learning_getx/models/product_model.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ApiService.fetchProduct();
      productList.assignAll(products);
    } finally {
      isLoading(false);
    }
  }
}

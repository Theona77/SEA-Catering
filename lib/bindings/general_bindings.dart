import 'package:appppppp/common/widgets/network/network_manager.dart';
import 'package:appppppp/data/repositories.authentication/user/user_repository.dart';
import 'package:appppppp/data/repositories.authentication/wishlist/wishlistRepository.dart';
import 'package:appppppp/features/authentication/controllers/cart/CartController.dart';
import 'package:appppppp/features/authentication/controllers/order/orderController.dart';
import 'package:appppppp/features/authentication/controllers/user/userController.dart';
import 'package:appppppp/features/shop/controllers/home_controller.dart';
import 'package:appppppp/features/shop/controllers/wishlist.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class GeneralBindings extends Bindings {

  @override
  void dependencies() {
    Get.put(WishlistRepository());
    Get.put(WishlistController());
    Get.put(NetworkManager());
    Get.put(UserRepository());
    Get.put(HomeController());
    Get.put(CartController());
    Get.put(OrderController());
    Get.put(UserController());
  }
}
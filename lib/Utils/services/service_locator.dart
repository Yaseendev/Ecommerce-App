import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:my_ecommerce/Account/data/providers/account_db_provider.dart';
import 'package:my_ecommerce/Account/data/providers/account_network_provider.dart';
import 'package:my_ecommerce/Account/data/repositories/account_repo.dart';
import 'package:my_ecommerce/Home/data/providers/home_network_provider.dart';
import 'package:my_ecommerce/Home/data/repositories/home_repository.dart';
import 'package:my_ecommerce/Primary/data/providers/category_network_provider.dart';
import 'package:my_ecommerce/Primary/data/repositories/category_repo.dart';
import 'package:my_ecommerce/Search/data/providers/search_database_provider.dart';
import 'package:my_ecommerce/Search/data/providers/search_network_provider.dart';
import 'package:my_ecommerce/Search/data/repositories/search_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'database_service.dart';

final locator = GetIt.instance;

Future locatorsSetup() async {
  final DatabaseService database = DatabaseService();
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  locator.registerLazySingleton<Connectivity>(() => Connectivity());
  locator.registerLazySingleton<AccountNetworkProvider>(() => AccountNetworkProvider());
  locator.registerLazySingleton<AccountDatabaseProvider>(() => AccountDatabaseProvider(database.secureStorage,prefs));
  locator.registerLazySingleton<AccountRepository>(() => AccountRepository(
    networkProvider: locator.get<AccountNetworkProvider>(),
    databaseProvider: locator.get<AccountDatabaseProvider>(),
  ));
  // locator.registerLazySingleton<WishlistNetworkProvider>(() => WishlistNetworkProvider());
  // locator.registerLazySingleton<WishlistRepository>(() => WishlistRepository(
  //   apiService: locator.get<WishlistNetworkProvider>(),
  //   accountDatabaseService: locator.get<AccountDatabaseProvider>(),
  // ));
  locator.registerLazySingleton<SearchNetworkProvider>(() => SearchNetworkProvider());
  locator.registerLazySingleton<SearchDatabaseProvider>(() => SearchDatabaseProvider(database.secureStorage));
  locator.registerLazySingleton<SearchRepository>(() => SearchRepository(
    apiService: locator.get<SearchNetworkProvider>(),
    searchDatabaseService: locator.get<SearchDatabaseProvider>(),
  ));
  locator.registerLazySingleton<CategoryNetworkProvider>(() => CategoryNetworkProvider());
  locator.registerLazySingleton<CategoryRepository>(() => CategoryRepository(
    apiService: locator.get<CategoryNetworkProvider>(),
  ));
  locator.registerLazySingleton<HomeNetworkProvider>(() => HomeNetworkProvider());
  locator.registerLazySingleton<HomeRepository>(() => HomeRepository(
    apiService: locator.get<HomeNetworkProvider>(),
  ));
  // locator.registerLazySingleton<CartNetworkProvider>(() => CartNetworkProvider());
  // locator.registerLazySingleton<CartDatabaseProvider>(() => CartDatabaseProvider(database.secureStorage));
  // locator.registerLazySingleton<CartRepository>(() => CartRepository(
  //   apiService: locator.get<CartNetworkProvider>(),
  //   databaseService: locator.get<CartDatabaseProvider>(),
  //   accountDatabaseService: locator.get<AccountDatabaseProvider>(),
  // ));
  // locator.registerLazySingleton<AddressNetworkProvider>(() => AddressNetworkProvider());
  // locator.registerLazySingleton<AddressRepository>(() => AddressRepository(
  //   apiService: locator.get<AddressNetworkProvider>(),
  //   accountDatabaseService: locator.get<AccountDatabaseProvider>(),
  // ));

}

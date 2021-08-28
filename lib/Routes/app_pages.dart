import 'package:demogetx/ProductModual/Views/splash_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';


class AppPages {
  static final pages = [
  GetPage(
  name: Routes.INITIAL,
  page: () => SplashScreen(),
  )
  ];
}
// class AppPages {
//   static const INITIAL = Routes.HOME;
//
//   static final routes = [
//     GetPage(
//       name: _P,
//       //page: () => HomeView(),
//       binding: HomeBinding(),
//     ),
//   ];
// }


/*class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => SplashScreen(),
    ),

    GetPage(
        name: Routes.TUTORIAL,
        page: () => TutorialScreen(),
        binding: TutorialBinding()),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      bindings: [
        DioBinds(),
        LoginBinding(),
      ],
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeParentScreen(),
      //binding: HomeParentBinding(),

      bindings: [
        DioBinds(),
        HomeBinding(),
        FilterBinding(),
        LeadListingBinding(),
        ProjectBinding(),
        StageWiseBinding(),
      ],
    ),
    GetPage(
        name: Routes.REGION_LIST,
        page: () => RegionList(),
        binding: RegionBinding()),
    GetPage(
      name: Routes.SEARCH_SCREEN,
      page: () => SearchScreen(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: Routes.FILTER_SCREEN,
      page: () => FilterScreen(),
      bindings: [
        DioBinds(),
        FilterBinding(),
      ],
    ),
    GetPage(
      name: Routes.PIPELINE_SCREEN,
      page: () => PipelineScreen(),
      binding: PipeLineBinding(),
    ),
    GetPage(
      name: Routes.UPDATE_LEAD_SCREEN,
      page: () => UpdateLeadScreen(),
      bindings: [
        DioBinds(),
        UpdateLeadBinding(),
      ],
    ),
    GetPage(
      name: Routes.CREATE_LEAD_SCREEN,
      page: () => CreateLeadScreen(),
      bindings: [
        DioBinds(),
        CreateLeadBinding(),
      ],
    ),
    GetPage(
      name: Routes.PROJECT_DETAILS_SCREEN,
      page: () => ProjectDetailsMobile(),
      bindings: [
        DioBinds(),
        ProjectBinding(),
      ],
    ),
    GetPage(
      name: Routes.EDIT_LEAD_SCREEN,
      page: () => EditLeadScreen(),
      bindings: [
        DioBinds(),
        EditLeadBinding(),
      ],
    ),

    GetPage(
      name: Routes.NAVIGATE_TO_HOME_SCREEN,
      page: () => NavigateToHomeScreen(),

    ),
  ];
}*/
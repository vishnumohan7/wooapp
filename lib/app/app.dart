import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stackex/ui/second_view.dart';
import 'package:stackex/ui/startup_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView,initial: true),
    MaterialRoute(page: SecondView),

  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
  ],
)
class AppSetup {}

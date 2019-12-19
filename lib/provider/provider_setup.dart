import 'package:provider/provider.dart';
import 'package:video_list_test_code_ninja/provider/video-provider.dart';

class ProviderSetup {
  static List<SingleChildCloneableWidget> providers = [
    ...kDependentProviders,
  ];

  static List<SingleChildCloneableWidget> kDependentProviders = [
    ChangeNotifierProvider(builder: (_) => VideoProvider()),
  ];
}

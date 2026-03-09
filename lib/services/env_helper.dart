import 'package:ipf_flutter_starter_pack/ipf_flutter_starter_pack.dart';

class EnvHelper extends BaseEnvHelper {
  EnvHelper._();

  static final EnvHelper _instance = EnvHelper._();

  static EnvHelper get instance => _instance;

  static String get localUrl => BaseEnvHelper.read("LOCAL_URL")!;

  static String get stagingUrl => BaseEnvHelper.read("STAGING_URL")!;

  static String get productionUrl => BaseEnvHelper.read("PRODUCTION_URL")!;

  static String get localApiKey => BaseEnvHelper.read("LOCAL_API_KEY")!;

  static String get stagingApiKey => BaseEnvHelper.read("STAGING_API_KEY")!;
}

enum AppEnvironment {
  debug,
  staging,
  production;

  String get url {
    switch (this) {
      case AppEnvironment.debug:
        return EnvHelper.localUrl;
      case AppEnvironment.staging:
        return EnvHelper.stagingUrl;
      case AppEnvironment.production:
        return EnvHelper.productionUrl;
    }
  }

  String get apiKey {
    switch (this) {
      case AppEnvironment.debug:
        return EnvHelper.localApiKey;
      case AppEnvironment.staging:
        return EnvHelper.stagingApiKey;
      case AppEnvironment.production:
        return EnvHelper.stagingApiKey;
    }
  }
}

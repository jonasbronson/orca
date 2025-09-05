enum AppRoute {
  //login,
  home,
  //settings,
}

extension AppRoutePath on AppRoute {
  String get path {
    switch (this) {
      /*
      case AppRoute.login:
        return '/login';
      */
      case AppRoute.home:
        return '/home';
        /*
      case AppRoute.settings:
        return '/home/settings';
        */
    }
  }
}

import 'package:package_info_plus/package_info_plus.dart';

/// Returns the package info of the app.
///
/// Packgae info includes the app name, package name, version, build number, etc.
Future<PackageInfo> returnPackageInfo() async {
  return await PackageInfo.fromPlatform();
}

import 'package:flutter_test/flutter_test.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:simplenoteapp/src/utils/packageinfo.util.dart';

void main() {
  test('returnPackageInfo returns correct PackageInfo', () async {
    const appName = "Test App";
    const packageName = "com.test.app";
    const version = '1.0.0';
    const buildNumber = '1';
    const buildSignature = "buildSignature";

    PackageInfo.setMockInitialValues(
        appName: appName,
        packageName: packageName,
        version: version,
        buildNumber: buildNumber,
        buildSignature: buildSignature);

    var packageInfo = await returnPackageInfo();

    expect(packageInfo.appName, appName);
    expect(packageInfo.packageName, packageName);
    expect(packageInfo.version, version);
    expect(packageInfo.buildNumber, buildNumber);
    expect(packageInfo.buildSignature, buildSignature);
  });
}

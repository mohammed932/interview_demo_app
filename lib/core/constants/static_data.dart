import 'package:interview_test/core/network/domains/domains.imports.dart';
import 'package:valu_network_layer/valu_network_layer.dart';

import '../network/autnetication/authenticator.imports.dart';
import 'collections.dart';

class ValuStaticDataEndpoints {
  static ValuEndpoint generateJwtToken(Map<String, dynamic> body) =>
      ValuEndpoint(
        domain: Gateway(),
        collection: AuthCollection(),
        hostType: HostType.Default,
        method: HttpMethod.POST,
        endpoint: "GenerateToken",
        body: body,
        requiresGatewayId: true,
      );
  static ValuEndpoint getEmployers(Map<String, dynamic> query) => ValuEndpoint(
        domain: Gateway(),
        collection: CmsCollection(),
        method: HttpMethod.GET,
        endpoint: "employers",
        queryParameters: query,
      );

  static ValuEndpoint sendOtp(Map<String, dynamic> body) => ValuEndpoint(
        domain: Gateway(),
        collection: AppCollection(),
        method: HttpMethod.POST,
        hostType: HostType.Default,
        endpoint: "SendOTP",
        body: body,
        extraAuthenticationTypes: [HmacAuthenticator()],
      );
}

// set default domainType in case user don't specify certain domain type = aggregator  ==> Done
// the same thing apply on collection  ==> Not applicable  ==> Done
// try to make all above params as default {first three params}  ==> Done
// Post request => take a look  ==> Done
// make baseUrl as private and not set in setup network config and validate that domains list not empty
// make a condtion when configure network to specify which env { Prod , Dev} ==> Done
// change name of config class to be NetworkConfig  ==> Done
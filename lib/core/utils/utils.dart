import 'package:valu_network_layer/valu_network_layer.dart';

import '../constants/network_keys.dart';

class Utils {
  static List<Domain> getDomains() {
    const env = Environment.DEV;
    return env == Environment.PROD
        ? [
            Domain(
              domainType: DomainType.Aggregator,
              url: 'https://mobagg.valu.com.eg',
            ),
            Domain(
              domainType: DomainType.GateWay,
              url: 'https://mobservices.valu.com.eg',
            )
          ]
        : [
            Domain(
              domainType: DomainType.Aggregator,
              url: 'https://mobagg1.valu.com.eg',
            ),
            Domain(
              domainType: DomainType.GateWay,
              url: 'https://mobservices1.valu.com.eg',
            ),
          ];
  }
}

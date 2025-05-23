import 'package:flutter/material.dart';
import '../screens/protection_dashboard_screen.dart';
import '../screens/visa_paypal_screen.dart';
import '../screens/visa_screen.dart';
import '../screens/paypal_screen.dart';
import '../screens/visa_paypal_combined_screen.dart';
import '../screens/visa_regular_service_screen.dart';
import '../screens/visa_business_service_screen.dart';
import '../screens/paypal_regular_service_screen.dart';
import '../screens/paypal_business_service_screen.dart';
import '../screens/service_plan_comparison_screen.dart';

class AppRoutes {
  static const String dashboard = '/';
  static const String visaPaypal = '/visa-paypal';
  static const String visa = '/visa';
  static const String paypal = '/paypal';
  static const String visaPaypalCombined = '/visa-paypal-combined';
  static const String visaRegularService = '/visa-regular-service';
  static const String visaBusinessService = '/visa-business-service';
  static const String paypalRegularService = '/paypal-regular-service';
  static const String paypalBusinessService = '/paypal-business-service';
  static const String servicePlanComparison = '/service-plan-comparison';
  
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      dashboard: (context) => const ProtectionDashboardScreen(),
      visaPaypal: (context) => const VisaPaypalScreen(),
      visa: (context) => const VisaScreen(),
      paypal: (context) => const PaypalScreen(),
      visaPaypalCombined: (context) => const VisaPaypalCombinedScreen(),
      visaRegularService: (context) => const VisaRegularServiceScreen(),
      visaBusinessService: (context) => const VisaBusinessServiceScreen(),
      paypalRegularService: (context) => const PaypalRegularServiceScreen(),
      paypalBusinessService: (context) => const PaypalBusinessServiceScreen(),
      servicePlanComparison: (context) {
        final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
        return ServicePlanComparisonScreen(
          serviceName: args['serviceName'] as String,
        );
      },
    };
  }
} 
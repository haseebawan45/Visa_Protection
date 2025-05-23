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
import '../screens/card_management_screen.dart';
import '../screens/budget_lock_screen.dart';
import '../screens/freeze_unfreeze_screen.dart';
import '../screens/scam_radar_screen.dart';
import '../screens/ai_refund_assistant_screen.dart';
import '../screens/travel_mode_screen.dart';
import '../screens/ghost_payment_generator_screen.dart';
import '../screens/ghost_payment_details_screen.dart';

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
  static const String cardManagement = '/card-management';
  static const String budgetLock = '/budget-lock';
  static const String freezeUnfreeze = '/freeze-unfreeze';
  static const String scamRadar = '/scam-radar';
  static const String aiRefundAssistant = '/ai-refund-assistant';
  static const String travelMode = '/travel-mode';
  static const String ghostPaymentGenerator = '/ghost-payment-generator';
  static const String ghostPaymentDetails = '/ghost-payment-details';
  
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
      cardManagement: (context) => const CardManagementScreen(),
      budgetLock: (context) => const BudgetLockScreen(),
      freezeUnfreeze: (context) => const FreezeUnfreezeScreen(),
      scamRadar: (context) => const ScamRadarScreen(),
      aiRefundAssistant: (context) => const AIRefundAssistantScreen(),
      travelMode: (context) => const TravelModeScreen(),
      ghostPaymentGenerator: (context) => const GhostPaymentGeneratorScreen(),
      ghostPaymentDetails: (context) => const GhostPaymentDetailsScreen(),
    };
  }
} 
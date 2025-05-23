import 'package:flutter/material.dart';
import '../components/protection_card.dart';
import '../utils/routes.dart';

class ProtectionDashboardScreen extends StatelessWidget {
  final bool isInTabView;
  
  const ProtectionDashboardScreen({
    super.key, 
    this.isInTabView = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top section with title and checkmark
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Visa Protection',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              
              // Quick Actions Section
              const Text(
                'Quick Actions',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              
              // Quick Action buttons
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildQuickAction(
                      context: context,
                      icon: Icons.ac_unit,
                      label: 'Freeze Card',
                      route: AppRoutes.freezeUnfreeze,
                      color: Colors.blue,
                    ),
                    _buildQuickAction(
                      context: context,
                      icon: Icons.security,
                      label: 'Scan for Scams',
                      route: AppRoutes.scamRadar,
                      color: Colors.orange,
                    ),
                    _buildQuickAction(
                      context: context,
                      icon: Icons.code,
                      label: 'Ghost Payment',
                      route: AppRoutes.ghostPaymentGenerator,
                      color: Colors.purple,
                    ),
                    _buildQuickAction(
                      context: context,
                      icon: Icons.lock,
                      label: 'Budget Lock',
                      route: AppRoutes.budgetLock,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Protection Services section
              const Text(
                'Protection Services',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              
              // Grid of protection options
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    // Visa & PayPal
                    ProtectionCard(
                      title: 'Visa & PayPal',
                      icon: Icons.account_balance_wallet,
                      color: Colors.blue,
                      isActive: true,
                      onTap: () => Navigator.pushNamed(context, AppRoutes.visaPaypal),
                    ),
                    
                    // Gmail
                    ProtectionCard(
                      title: 'Gmail',
                      icon: Icons.email,
                      color: Colors.red,
                      isActive: false,
                      onTap: () {},
                    ),
                    
                    // Trading Account
                    ProtectionCard(
                      title: 'Trading Account',
                      icon: Icons.show_chart,
                      color: Colors.blue,
                      isActive: false,
                      onTap: () {},
                    ),
                    
                    // Phone
                    ProtectionCard(
                      title: 'Phone',
                      icon: Icons.smartphone,
                      color: Colors.blue,
                      isActive: false,
                      onTap: () {},
                    ),
                    
                    // Computer & Laptop
                    ProtectionCard(
                      title: 'Computer & Laptop',
                      icon: Icons.laptop,
                      color: Colors.blue,
                      isActive: false,
                      onTap: () {},
                    ),
                    
                    // Securely Card
                    ProtectionCard(
                      title: 'Securely Card',
                      icon: Icons.credit_card,
                      color: Colors.green,
                      isActive: false,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              
              // Coming soon text
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'Coming soon ......',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildQuickAction({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String route,
    required Color color,
  }) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        width: 90,
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: color.withOpacity(0.3),
                  width: 1.5,
                ),
              ),
              child: Icon(
                icon,
                color: color,
                size: 30,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 
import 'package:flutter/material.dart';
import '../components/protection_card.dart';
import '../utils/routes.dart';

class ProtectionDashboardScreen extends StatelessWidget {
  const ProtectionDashboardScreen({super.key});

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
} 
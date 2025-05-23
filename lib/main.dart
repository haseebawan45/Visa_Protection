import 'package:flutter/material.dart';
import 'utils/routes.dart';
import 'screens/protection_dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Visa Protection',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF0A1929),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.white,
        ),
      ),
      home: const ProtectionDashboardScreen(),
      routes: AppRoutes.getRoutes(),
    );
  }
}

class ProtectionDashboard extends StatelessWidget {
  const ProtectionDashboard({super.key});

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
                      onTap: () {},
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
              const SizedBox(height: 16),
              
              // Text description
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.black,
                child: const Text(
                  'In this dashboard just the visa and paypal protection is working',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
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

class ProtectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final bool isActive;
  final VoidCallback onTap;

  const ProtectionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive ? onTap : null,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF0E2A47),
          borderRadius: BorderRadius.circular(12),
          border: isActive 
            ? Border.all(color: Colors.blue, width: 2) 
            : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
              size: 48,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

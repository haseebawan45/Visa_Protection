import 'package:flutter/material.dart';
import 'utils/routes.dart';
import 'screens/protection_dashboard_screen.dart';
import 'screens/card_management_screen.dart';
import 'screens/features_screen.dart';
import 'screens/account_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Visa & Protection',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
        useMaterial3: true,
      ),
      home: const MainNavigation(),
      routes: AppRoutes.getRoutes(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ProtectionDashboardScreen(isInTabView: true),
    const CardManagementScreen(isInTabView: true),
    const FeaturesScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Color(0xFF1C1C1E), width: 1),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
    setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.credit_card),
              label: 'Cards',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shield),
              label: 'Features',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
            ),
          ],
        ),
      ),
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

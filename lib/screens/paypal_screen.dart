import 'package:flutter/material.dart';
import '../utils/routes.dart';

class PaypalScreen extends StatelessWidget {
  const PaypalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151515),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('PayPal Protection'),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // PayPal Logo
            const SizedBox(height: 40),
            const Icon(
              Icons.paypal,
              color: Colors.blue,
              size: 80,
            ),
            const SizedBox(height: 16),
            const Text(
              'PayPal',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            
            // Regular Service Option
            _buildServiceCard(
              icon: Icons.person,
              title: 'Regular Service',
              onTap: () => Navigator.pushNamed(context, AppRoutes.paypalRegularService),
            ),
            const SizedBox(height: 20),
            
            // Business Service Option
            _buildServiceCard(
              icon: Icons.people,
              title: 'Business Service',
              onTap: () => Navigator.pushNamed(context, AppRoutes.paypalBusinessService),
            ),
            
            // Compare Plans Button
            const SizedBox(height: 30),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context, 
                    AppRoutes.servicePlanComparison,
                    arguments: {'serviceName': 'PayPal'},
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blue,
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.compare_arrows),
                    SizedBox(width: 8),
                    Text('Compare Service Plans', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 28,
              color: Colors.black,
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 
import 'package:flutter/material.dart';
import '../utils/routes.dart';

class VisaScreen extends StatelessWidget {
  const VisaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF252A30),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Visa Protection'),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Visa icon and title
            const Icon(
              Icons.credit_card,
              color: Colors.blue,
              size: 60,
            ),
            const SizedBox(height: 16),
            const Text(
              'Visa',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            
            // Regular Service Option
            _buildServiceCard(
              icon: Icons.person,
              title: 'Regular Service',
              onTap: () => Navigator.pushNamed(context, AppRoutes.visaRegularService),
            ),
            const SizedBox(height: 20),
            
            // Business Service Option
            _buildServiceCard(
              icon: Icons.people,
              title: 'Business Service',
              onTap: () => Navigator.pushNamed(context, AppRoutes.visaBusinessService),
            ),
            const SizedBox(height: 30),
            
            // Compare Plans Button
            TextButton(
              onPressed: () {
                Navigator.pushNamed(
                  context, 
                  AppRoutes.servicePlanComparison,
                  arguments: {'serviceName': 'Visa'},
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
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
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
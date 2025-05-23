import 'package:flutter/material.dart';
import '../utils/routes.dart';

class VisaPaypalScreen extends StatelessWidget {
  const VisaPaypalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A1929),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Visa & PayPal Protection'),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Main content with options
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F4F8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Option 1 - Visa & PayPal
                    _buildOptionCard(
                      icon: Icons.credit_card,
                      title: 'Visa & PayPal',
                      onTap: () => Navigator.pushNamed(context, AppRoutes.visaPaypalCombined),
                    ),
                    const SizedBox(height: 16),

                    // Option 2 - Visa
                    _buildOptionCard(
                      title: 'Visa',
                      onTap: () => Navigator.pushNamed(context, AppRoutes.visa),
                      isSmaller: true,
                    ),
                    const SizedBox(height: 16),

                    // Option 3 - PayPal
                    _buildOptionCard(
                      title: 'PayPal',
                      onTap: () => Navigator.pushNamed(context, AppRoutes.paypal),
                      isSmaller: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard({
    IconData? icon,
    required String title,
    required VoidCallback onTap,
    bool isSmaller = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Icon(
                  icon,
                  color: Colors.blue,
                  size: 28,
                ),
              ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: isSmaller ? 18 : 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 
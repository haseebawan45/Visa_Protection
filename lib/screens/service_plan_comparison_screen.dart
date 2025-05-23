import 'package:flutter/material.dart';

class ServicePlanComparisonScreen extends StatelessWidget {
  final String serviceName; // "Visa" or "PayPal"
  
  const ServicePlanComparisonScreen({
    super.key, 
    required this.serviceName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1F2B),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('$serviceName Service Plans'),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Service Plan Comparison',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Regular Plan
                  Expanded(
                    child: _buildPlanCard(
                      title: 'Regular',
                      features: const [
                        'Budget Lock',
                        'One Click Freeze / Unfreeze',
                        'Scam Radar (AI Powered Scam Detector)',
                        'AI Refund Assistant',
                        'Travel Mode',
                        'Ghost Payment Generator',
                      ],
                      hasToggle: true,
                      onGetStarted: () {
                        // Navigate to Regular service setup
                        Navigator.pop(context, 'regular');
                      },
                      color: const Color(0xFF585FD9),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Business Plan
                  Expanded(
                    child: _buildPlanCard(
                      title: 'Business',
                      features: const [
                        'Group Protection Plan',
                        'Multi-Layer Vaulted Accounts',
                        'Ghost Payment Generator',
                        '+Regular Service',
                        'Toggle Hub',
                        'Growth Graph',
                      ],
                      onGetStarted: () {
                        // Navigate to Business service setup
                        Navigator.pop(context, 'business');
                      },
                      color: const Color(0xFF7676E2),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard({
    required String title,
    required List<String> features,
    required VoidCallback onGetStarted,
    required Color color,
    bool hasToggle = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF262D40),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Features
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...features.map((feature) => Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.circle,
                          color: Colors.blue,
                          size: 12,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            feature,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                  if (hasToggle) ...[
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Center(
                        child: Text(
                          'toggle hub',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                  const Spacer(),
                  // Get Started Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: onGetStarted,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: color,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
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
        ],
      ),
    );
  }
} 
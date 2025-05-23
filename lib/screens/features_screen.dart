import 'package:flutter/material.dart';
import '../utils/routes.dart';

class FeaturesScreen extends StatelessWidget {
  const FeaturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Protection Features', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Security Features
            _buildCategoryHeader(context, 'Security Features', Icons.security),
            const SizedBox(height: 16),
            _buildFeatureRow(context, [
              FeatureItem(
                title: 'Freeze/Unfreeze',
                icon: Icons.ac_unit,
                route: AppRoutes.freezeUnfreeze,
                description: 'Instantly freeze your card if it\'s lost or stolen',
              ),
              FeatureItem(
                title: 'Scam Radar',
                icon: Icons.security,
                route: AppRoutes.scamRadar,
                description: 'AI-powered scam detection and alerts',
              ),
            ]),
            
            const SizedBox(height: 32),
            
            // Payment Features
            _buildCategoryHeader(context, 'Payment Features', Icons.payments),
            const SizedBox(height: 16),
            _buildFeatureRow(context, [
              FeatureItem(
                title: 'Ghost Payment',
                icon: Icons.code,
                route: AppRoutes.ghostPaymentGenerator,
                description: 'Generate secure one-time virtual cards',
              ),
              FeatureItem(
                title: 'Budget Lock',
                icon: Icons.lock,
                route: AppRoutes.budgetLock,
                description: 'Set and manage spending limits',
              ),
            ]),
            
            const SizedBox(height: 32),
            
            // Travel Features
            _buildCategoryHeader(context, 'Travel Features', Icons.flight_takeoff),
            const SizedBox(height: 16),
            _buildFeatureRow(context, [
              FeatureItem(
                title: 'Travel Mode',
                icon: Icons.card_travel,
                route: AppRoutes.travelMode,
                description: 'Special protections when traveling',
              ),
              FeatureItem(
                title: 'Currency Exchange',
                icon: Icons.currency_exchange,
                route: '', // No route yet
                description: 'Fee-free currency exchange',
                isComingSoon: true,
              ),
            ]),
            
            const SizedBox(height: 32),
            
            // Support Features
            _buildCategoryHeader(context, 'Support Features', Icons.support_agent),
            const SizedBox(height: 16),
            _buildFeatureRow(context, [
              FeatureItem(
                title: 'AI Refund Assistant',
                icon: Icons.attach_money,
                route: AppRoutes.aiRefundAssistant,
                description: 'Automated dispute resolution',
              ),
              FeatureItem(
                title: 'Group Protection',
                icon: Icons.shield,
                route: AppRoutes.groupProtectionPlan,
                description: 'Manage family protection plan',
              ),
            ]),
          ],
        ),
      ),
    );
  }
  
  Widget _buildCategoryHeader(BuildContext context, String title, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.blue,
          size: 24,
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
  
  Widget _buildFeatureRow(BuildContext context, List<FeatureItem> features) {
    return Row(
      children: features.map((feature) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: feature == features.last ? 0 : 12,
            ),
            child: _buildFeatureCard(context, feature),
          ),
        );
      }).toList(),
    );
  }
  
  Widget _buildFeatureCard(BuildContext context, FeatureItem feature) {
    return GestureDetector(
      onTap: () {
        if (!feature.isComingSoon && feature.route.isNotEmpty) {
          Navigator.pushNamed(context, feature.route);
        }
      },
      child: Container(
        height: 160,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1C1C1E),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blue,
                  child: Icon(
                    feature.icon,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const Spacer(),
                if (feature.isComingSoon)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.amber.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'Coming Soon',
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              feature.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              feature.description,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 12,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            if (!feature.isComingSoon) ...[
              const Spacer(),
              const Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.blue,
                  size: 16,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class FeatureItem {
  final String title;
  final IconData icon;
  final String route;
  final String description;
  final bool isComingSoon;
  
  FeatureItem({
    required this.title,
    required this.icon,
    required this.route,
    required this.description,
    this.isComingSoon = false,
  });
} 
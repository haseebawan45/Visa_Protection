import 'package:flutter/material.dart';
import '../utils/routes.dart';

class CardManagementScreen extends StatelessWidget {
  final bool isInTabView;
  
  const CardManagementScreen({
    super.key,
    this.isInTabView = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: isInTabView 
        ? AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text('My Cards', style: TextStyle(color: Colors.white)),
            actions: [
              Switch(
                value: true, // For dark theme
                onChanged: (_) {},
                activeColor: Colors.blue,
              ),
              const SizedBox(width: 16),
            ],
          )
        : AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.white),
            actions: [
              Switch(
                value: true, // For dark theme
                onChanged: (_) {},
                activeColor: Colors.blue,
              ),
              const SizedBox(width: 16),
            ],
          ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Card Actions Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add, color: Colors.white),
                  label: const Text('Add card'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    side: const BorderSide(color: Colors.grey),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.withOpacity(0.2),
                    foregroundColor: Colors.blue,
                    minimumSize: const Size(150, 40),
                  ),
                  child: const Text('Switch card'),
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Credit Card Display
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: const Color(0xFF1E58B4),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Card Brand Logo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.credit_card,
                            color: Colors.white,
                            size: 24,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Visa Signature',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      // Chip Icon
                      Container(
                        height: 30,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                  
                  const Spacer(),
                  
                  // Card Number
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade700,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      '* * * * * * * * * * * * * * * * * * * *',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                  
                  const Spacer(),
                  
                  // Card Holder & Expiry
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CARD HOLDER',
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'JOHN A. SMITH',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Text(
                                'EXPIRES',
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(width: 24),
                              Text(
                                'CVV',
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                '04/26',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 24),
                              Text(
                                '***',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Bank Name & Show Details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'National Credit Union',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Show details',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Action Buttons
            Row(
              children: [
                // Subscription Management Button
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.switchHub);
                    },
                    icon: const Icon(Icons.subscriptions, color: Colors.white),
                    label: const Text('Manage Subscriptions'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1C1C1E),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Group Protection Plan Button
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.groupProtectionPlan);
                    },
                    icon: const Icon(Icons.shield, color: Colors.white),
                    label: const Text('Protection Plan'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1C1C1E),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Features Section Title
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Card Protection Features',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton(
                    onPressed: isInTabView 
                      ? () => Navigator.pushNamed(context, AppRoutes.features)
                      : null,
                    child: Text(
                      isInTabView ? 'View all' : '',
                      style: const TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Features Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              childAspectRatio: 1.1,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                FeatureCard(
                  icon: Icons.lock,
                  title: 'Budget Lock',
                  iconColor: Colors.blue,
                  onTap: () => Navigator.pushNamed(context, AppRoutes.budgetLock),
                ),
                FeatureCard(
                  icon: Icons.ac_unit,
                  title: 'One Click Freeze / Unfreeze',
                  iconColor: Colors.blue,
                  onTap: () => Navigator.pushNamed(context, AppRoutes.freezeUnfreeze),
                ),
                FeatureCard(
                  icon: Icons.security,
                  title: 'Scam Radar (AI Powered Scam Detector)',
                  iconColor: Colors.blue,
                  onTap: () => Navigator.pushNamed(context, AppRoutes.scamRadar),
                ),
                FeatureCard(
                  icon: Icons.attach_money,
                  title: 'AI Refund Assistant',
                  iconColor: Colors.blue,
                  onTap: () => Navigator.pushNamed(context, AppRoutes.aiRefundAssistant),
                ),
                FeatureCard(
                  icon: Icons.card_travel,
                  title: 'Travel Mode',
                  iconColor: Colors.blue,
                  onTap: () => Navigator.pushNamed(context, AppRoutes.travelMode),
                ),
                FeatureCard(
                  icon: Icons.code,
                  title: 'Ghost Payment Generator',
                  iconColor: Colors.blue,
                  onTap: () => Navigator.pushNamed(context, AppRoutes.ghostPaymentGenerator),
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Bottom Card Management Button (only show if not in tab view)
            if (!isInTabView) 
              Center(
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue,
                  child: IconButton(
                    icon: const Icon(Icons.credit_card, color: Colors.white),
                    onPressed: () {},
                    iconSize: 28,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color iconColor;
  final VoidCallback? onTap;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1C1C1E),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: iconColor,
              child: Icon(
                icon,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 
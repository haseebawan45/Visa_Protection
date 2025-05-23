import 'package:flutter/material.dart';

class BudgetLockScreen extends StatefulWidget {
  const BudgetLockScreen({super.key});

  @override
  State<BudgetLockScreen> createState() => _BudgetLockScreenState();
}

class _BudgetLockScreenState extends State<BudgetLockScreen> {
  bool _budgetLockEnabled = true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Budget Lock', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card with Balance
            _buildCardBalance(),
            
            const SizedBox(height: 24),
            
            // Monthly Spending Progress Bar
            _buildMonthlySpending(),
            
            const SizedBox(height: 20),
            
            // Budget Lock Settings
            _buildSettingsCard(),
            
            const SizedBox(height: 16),
            
            // Budget Range Slider
            _buildBudgetRangeSlider(),
          ],
        ),
      ),
    );
  }
  
  Widget _buildCardBalance() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E58B4),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Visa Signature',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    '\$654.28',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'of \$1,000 limit',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text(
                '•••• 7214',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  Widget _buildMonthlySpending() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Monthly Spending',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                '65% used',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: 0.65,
              backgroundColor: Colors.grey[800],
              color: Colors.blue,
              minHeight: 12,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '\$0',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              Text(
                '\$1,000',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  Widget _buildSettingsCard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Budget Lock Toggle
          ListTile(
            title: const Text(
              'Budget Lock',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            trailing: Switch(
              value: _budgetLockEnabled,
              onChanged: (value) {
                setState(() {
                  _budgetLockEnabled = value;
                });
              },
              activeColor: Colors.blue,
            ),
          ),

          const Divider(height: 1, color: Color(0xFF2C2C2E)),

          // Monthly Budget Limit
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 14,
              child: const Icon(Icons.monetization_on_outlined, color: Colors.white, size: 16),
            ),
            title: const Text(
              'Monthly Budget Limit',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            trailing: const Text(
              '\$1,000',
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
            onTap: () {},
          ),

          const Divider(height: 1, color: Color(0xFF2C2C2E)),

          // Auto-Reset
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 14,
              child: const Icon(Icons.refresh, color: Colors.white, size: 16),
            ),
            title: const Text(
              'Auto-Reset',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            trailing: const Text(
              '1st of month',
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
            onTap: () {},
          ),

          const Divider(height: 1, color: Color(0xFF2C2C2E)),

          // Alert Threshold
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 14,
              child: const Icon(Icons.notifications_outlined, color: Colors.white, size: 16),
            ),
            title: const Text(
              'Alert Threshold',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            trailing: const Text(
              '80%',
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
            onTap: () {},
          ),

          const Divider(height: 1, color: Color(0xFF2C2C2E)),

          // Exclusion Categories
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 14,
              child: const Icon(Icons.category_outlined, color: Colors.white, size: 16),
            ),
            title: const Text(
              'Exclusion Categories',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            trailing: const Text(
              '3 items',
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
  
  Widget _buildBudgetRangeSlider() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '\$0',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            const Text(
              '\$2,000',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
        SliderTheme(
          data: SliderThemeData(
            trackHeight: 8,
            inactiveTrackColor: Colors.grey[800],
            activeTrackColor: Colors.blue,
            thumbColor: Colors.blue,
            overlayColor: Colors.blue.withOpacity(0.2),
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
          ),
          child: Slider(
            value: 1000, // $1,000
            min: 0,
            max: 2000,
            onChanged: (_) {},
          ),
        ),
      ],
    );
  }
} 
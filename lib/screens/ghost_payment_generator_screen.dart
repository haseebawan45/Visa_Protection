import 'package:flutter/material.dart';

class GhostPaymentGeneratorScreen extends StatefulWidget {
  const GhostPaymentGeneratorScreen({super.key});

  @override
  State<GhostPaymentGeneratorScreen> createState() => _GhostPaymentGeneratorScreenState();
}

class _GhostPaymentGeneratorScreenState extends State<GhostPaymentGeneratorScreen> {
  bool _autoExpireAfterUse = true;
  bool _hideFromTransactionHistory = false;
  bool _spendingNotifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Ghost Payment Generator', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Your Card Section
            _buildSectionHeader('Your Card'),
            const SizedBox(height: 12),
            _buildCardSelection(),
            
            const SizedBox(height: 24),
            
            // Generate Ghost Payment Button
            _buildGenerateButton(),
            
            const SizedBox(height: 24),
            
            // Settings Section
            _buildSectionHeader('Settings'),
            const SizedBox(height: 12),
            _buildSettingsSection(),
            
            const SizedBox(height: 24),
            
            // Recent Ghost Payments Section
            _buildRecentPaymentsHeader(),
            const SizedBox(height: 12),
            _buildRecentPayments(),
          ],
        ),
      ),
    );
  }
  
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
  
  Widget _buildCardSelection() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Card Icon
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: const Color(0xFF1E58B4),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.credit_card,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 16),
          // Card Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Visa Signature',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '•••• •••• •••• 5678',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          // Selected Status
          Text(
            'Selected',
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildGenerateButton() {
    return ElevatedButton(
      onPressed: () {
        // Implement ghost payment generation logic
        _showGhostPaymentGeneratedDialog();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1E58B4),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: const Size(double.infinity, 56),
      ),
      child: const Text(
        'Generate Ghost Payment',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
  
  Widget _buildSettingsSection() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Auto-expire after use
          _buildSettingsItem(
            title: 'Auto-expire after use',
            trailing: Switch(
              value: _autoExpireAfterUse,
              onChanged: (value) {
                setState(() {
                  _autoExpireAfterUse = value;
                });
              },
              activeColor: Colors.blue,
            ),
          ),
          
          const Divider(height: 1, color: Color(0xFF2C2C2E)),
          
          // Hide from transaction history
          _buildSettingsItem(
            title: 'Hide from transaction history',
            trailing: Switch(
              value: _hideFromTransactionHistory,
              onChanged: (value) {
                setState(() {
                  _hideFromTransactionHistory = value;
                });
              },
              activeColor: Colors.blue,
            ),
          ),
          
          const Divider(height: 1, color: Color(0xFF2C2C2E)),
          
          // Spending notifications
          _buildSettingsItem(
            title: 'Spending notifications',
            trailing: Switch(
              value: _spendingNotifications,
              onChanged: (value) {
                setState(() {
                  _spendingNotifications = value;
                });
              },
              activeColor: Colors.blue,
            ),
          ),
          
          const Divider(height: 1, color: Color(0xFF2C2C2E)),
          
          // Set spending limit
          _buildSettingsItem(
            title: 'Set spending limit',
            trailing: TextButton(
              onPressed: () {
                // Implement configure spending limit
              },
              child: const Text(
                'Configure',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildSettingsItem({
    required String title,
    required Widget trailing,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          trailing,
        ],
      ),
    );
  }
  
  Widget _buildRecentPaymentsHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildSectionHeader('Recent Ghost Payments'),
        TextButton(
          onPressed: () {
            // View all ghost payments
          },
          child: const Text(
            'View All',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
  
  Widget _buildRecentPayments() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildRecentPaymentItem(
            merchant: 'Netflix',
            date: 'May 5, 2025',
            amount: '\$15.99',
            isComplete: true,
          ),
          // You could add more payment items here
        ],
      ),
    );
  }
  
  Widget _buildRecentPaymentItem({
    required String merchant,
    required String date,
    required String amount,
    required bool isComplete,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  merchant,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'Complete',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  void _showGhostPaymentGeneratedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1C1C1E),
        title: const Text(
          'Ghost Payment Generated',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Your ghost payment method has been created. It will automatically expire after use.',
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade800),
              ),
              child: Column(
                children: [
                  const Text(
                    'Ghost Card Details',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildCardDetailRow('Card Number', '4821 XXXX XXXX 7392'),
                  _buildCardDetailRow('Expiry', '06/25'),
                  _buildCardDetailRow('CVV', '•••'),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }
  
  Widget _buildCardDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.grey[400]),
          ),
          Text(
            value,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
} 
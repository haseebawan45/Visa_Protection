import 'package:flutter/material.dart';

class ScamRadarScreen extends StatefulWidget {
  const ScamRadarScreen({super.key});

  @override
  State<ScamRadarScreen> createState() => _ScamRadarScreenState();
}

class _ScamRadarScreenState extends State<ScamRadarScreen> {
  final TextEditingController _urlController = TextEditingController();
  
  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E58B4),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Scam Radar', style: TextStyle(color: Colors.white)),
            Text(
              'AI Powered Scam Detection',
              style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Card Details
            _buildCardDetails(),
            
            const SizedBox(height: 16),
            
            // Protection Status
            _buildProtectionStatus(),
            
            const SizedBox(height: 16),
            
            // Recent Transactions
            _buildRecentTransactions(),
            
            const SizedBox(height: 24),
            
            // Scan URL/Message
            _buildScanSection(),
          ],
        ),
      ),
    );
  }
  
  Widget _buildCardDetails() {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: const Color(0xFF1E58B4),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Visa Signature',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                '04/25',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const Text(
            'JOHN A. SMITH',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildProtectionStatus() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            'Protection Active',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildRecentTransactions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8.0, bottom: 12.0),
          child: Text(
            'Recent Transactions',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        // Safe Transaction
        _buildTransactionItem(
          merchant: 'Amazon.com',
          date: 'May 5, 2025',
          amount: '\$45.67',
          status: TransactionStatus.safe,
        ),
        const SizedBox(height: 8),
        // Suspicious Transaction
        _buildTransactionItem(
          merchant: 'Tech-Support-247.com',
          date: 'May 4, 2025',
          amount: '\$199.99',
          status: TransactionStatus.suspicious,
        ),
        const SizedBox(height: 8),
        // Blocked Transaction
        _buildTransactionItem(
          merchant: 'FreeGiftCard-Win.net',
          date: 'May 3, 2025',
          amount: '\$89.50',
          status: TransactionStatus.blocked,
        ),
      ],
    );
  }
  
  Widget _buildTransactionItem({
    required String merchant,
    required String date,
    required String amount,
    required TransactionStatus status,
  }) {
    Color indicatorColor;
    String statusText;
    Color statusColor;
    
    switch (status) {
      case TransactionStatus.safe:
        indicatorColor = Colors.green;
        statusText = 'Safe';
        statusColor = Colors.green;
        break;
      case TransactionStatus.suspicious:
        indicatorColor = Colors.amber;
        statusText = 'Suspicious';
        statusColor = Colors.amber;
        break;
      case TransactionStatus.blocked:
        indicatorColor = Colors.red;
        statusText = 'Blocked';
        statusColor = Colors.red;
        break;
    }
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          // Status indicator circle
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: indicatorColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          // Transaction details
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
                Text(
                  '$date • $amount',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          // Status text
          Text(
            statusText,
            style: TextStyle(
              color: statusColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildScanSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E58B4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Scan Website or Message',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              // URL input field
              Expanded(
                child: Container(
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: _urlController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter URL or paste text...',
                      hintStyle: TextStyle(color: Colors.white54),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Scan button
              ElevatedButton(
                onPressed: () {
                  // Implement scan functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(80, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Scan'),
              ),
              // QR code icon
              Container(
                margin: const EdgeInsets.only(left: 8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.qr_code_scanner,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

enum TransactionStatus {
  safe,
  suspicious,
  blocked,
} 
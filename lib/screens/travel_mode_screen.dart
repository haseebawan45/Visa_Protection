import 'package:flutter/material.dart';

class TravelModeScreen extends StatefulWidget {
  const TravelModeScreen({super.key});

  @override
  State<TravelModeScreen> createState() => _TravelModeScreenState();
}

class _TravelModeScreenState extends State<TravelModeScreen> {
  bool _travelModeEnabled = true;
  String _location = 'Paris, France';
  String _dateRange = 'May 10-25, 2025';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E58B4),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Travel Mode', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card Details
            _buildCardDetails(),
            
            const SizedBox(height: 16),
            
            // Travel Mode Status
            _buildTravelModeStatus(),
            
            const SizedBox(height: 24),
            
            // Travel Features Section
            _buildSectionHeader('Travel Features'),
            
            const SizedBox(height: 12),
            
            // Feature: Find ATMs Nearby
            _buildFeatureItem(
              icon: Icons.atm,
              title: 'Find ATMs Nearby',
              subtitle: 'Locate fee-free ATMs on the map',
              onTap: () {
                // Navigate to ATM finder
              },
            ),
            
            const SizedBox(height: 12),
            
            // Feature: Currency Converter
            _buildFeatureItem(
              icon: Icons.currency_exchange,
              title: 'Currency Converter',
              subtitle: 'Check exchange rates and convert currency',
              onTap: () {
                // Navigate to currency converter
              },
            ),
            
            const SizedBox(height: 12),
            
            // Feature: Emergency Assistance
            _buildFeatureItem(
              icon: Icons.emergency,
              title: 'Emergency Assistance',
              subtitle: '24/7 travel and card support',
              onTap: () {
                // Navigate to emergency assistance
              },
            ),
            
            const SizedBox(height: 24),
            
            // Active Benefits Section
            _buildSectionHeader('Active Benefits'),
            
            const SizedBox(height: 12),
            
            // Benefits List
            _buildBenefitItem('Foreign transaction fees waived'),
            _buildBenefitItem('Enhanced fraud protection active'),
            _buildBenefitItem('Currency conversion without fees'),
            _buildBenefitItem('International emergency card replacement'),
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
  
  Widget _buildTravelModeStatus() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: _travelModeEnabled ? Colors.green : Colors.grey[600],
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Travel Mode: ${_travelModeEnabled ? 'ON' : 'OFF'}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Switch(
                value: _travelModeEnabled,
                onChanged: (value) {
                  setState(() {
                    _travelModeEnabled = value;
                  });
                },
                activeColor: Colors.green,
              ),
            ],
          ),
          if (_travelModeEnabled) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                const SizedBox(width: 36),
                Text(
                  '$_location • $_dateRange',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
  
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
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
  
  Widget _buildFeatureItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: const Color(0xFF1E58B4),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildBenefitItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6, left: 8, right: 12),
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
} 
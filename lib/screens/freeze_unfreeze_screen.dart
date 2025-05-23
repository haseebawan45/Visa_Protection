import 'package:flutter/material.dart';

class FreezeUnfreezeScreen extends StatefulWidget {
  const FreezeUnfreezeScreen({super.key});

  @override
  State<FreezeUnfreezeScreen> createState() => _FreezeUnfreezeScreenState();
}

class _FreezeUnfreezeScreenState extends State<FreezeUnfreezeScreen> {
  bool _isCardFrozen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E58B4),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Freeze/Unfreeze Card', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Card details
            _buildCardDetails(),
            
            const SizedBox(height: 24),
            
            // Card status selector
            _buildCardStatus(),
            
            const SizedBox(height: 24),
            
            // Information about frozen status
            if (_isCardFrozen) _buildFrozenInfo(),
            
            const Spacer(),
            
            // Action buttons
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildCardDetails() {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: const Color(0xFF1E58B4),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Card Type and Expiration
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
                  fontSize: 16,
                ),
              ),
            ],
          ),
          
          // Card Number
          const Text(
            '•••• •••• •••• 3456',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          
          // Cardholder Name
          const Text(
            'JOHN A. SMITH',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardStatus() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Card Status:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isCardFrozen = false;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: !_isCardFrozen 
                          ? const Color(0xFF2B3642)  // Darker blue when active
                          : Colors.transparent,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),
                      border: Border.all(
                        color: !_isCardFrozen 
                            ? const Color(0xFF2B3642)
                            : Colors.grey[700]!,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Active',
                      style: TextStyle(
                        color: !_isCardFrozen ? Colors.white : Colors.grey[500],
                        fontSize: 16,
                        fontWeight: !_isCardFrozen 
                            ? FontWeight.w600 
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isCardFrozen = true;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: _isCardFrozen 
                          ? const Color(0xFF1E58B4)  // Blue when frozen
                          : Colors.transparent,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                      border: Border.all(
                        color: _isCardFrozen 
                            ? const Color(0xFF1E58B4)
                            : Colors.grey[700]!,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Frozen',
                      style: TextStyle(
                        color: _isCardFrozen ? Colors.white : Colors.grey[500],
                        fontSize: 16,
                        fontWeight: _isCardFrozen 
                            ? FontWeight.w600 
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFrozenInfo() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'While your card is frozen:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoItem('New purchases will be declined'),
          const SizedBox(height: 8),
          _buildInfoItem('Recurring payments will continue'),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '• ',
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 16,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () {
            // Apply changes and go back
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1E58B4),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Apply Changes',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 12),
        TextButton(
          onPressed: () {
            // Cancel and go back
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xFF2B3642),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Cancel',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
} 
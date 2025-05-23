import 'package:flutter/material.dart';

class SwitchHubScreen extends StatefulWidget {
  const SwitchHubScreen({super.key});

  @override
  State<SwitchHubScreen> createState() => _SwitchHubScreenState();
}

class _SwitchHubScreenState extends State<SwitchHubScreen> {
  // Master toggle for all subscriptions
  bool _masterToggle = true;
  
  // Entertainment subscriptions
  final List<SubscriptionItem> _entertainmentSubscriptions = [
    SubscriptionItem(
      name: 'Netflix',
      icon: 'N',
      iconColor: Colors.red,
      planDetails: 'Premium Plan • Monthly',
      price: '\$19.99/mo',
      isActive: true,
    ),
    SubscriptionItem(
      name: 'Disney+',
      icon: 'D+',
      iconColor: Colors.blue,
      planDetails: 'Standard Plan • Monthly',
      price: '\$8.99/mo',
      isActive: true,
    ),
    SubscriptionItem(
      name: 'Spotify',
      icon: '',
      iconColor: Colors.green,
      planDetails: 'Premium Plan • Monthly',
      price: '\$10.99/mo',
      isActive: true,
      useCustomIcon: true,
    ),
  ];
  
  // Productivity subscriptions
  final List<SubscriptionItem> _productivitySubscriptions = [
    SubscriptionItem(
      name: 'Hostinger',
      icon: 'H',
      iconColor: Colors.purple,
      planDetails: 'Premium Hosting • Yearly',
      price: '\$8.99/mo',
      isActive: true,
    ),
    SubscriptionItem(
      name: 'Adobe Creative Cloud',
      icon: 'A',
      iconColor: Colors.red,
      planDetails: 'All Apps • Monthly',
      price: '\$52.99/mo',
      isActive: true,
    ),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          children: [
            Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.swap_horiz,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'Switch Hub',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            'John Doe',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Master toggle row (hidden in UI, but accessible for future use)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'All Subscriptions',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 16),
                Switch(
                  value: _masterToggle,
                  onChanged: (value) {
                    setState(() {
                      _masterToggle = value;
                      // Update all subscriptions
                      for (var sub in _entertainmentSubscriptions) {
                        sub.isActive = value;
                      }
                      for (var sub in _productivitySubscriptions) {
                        sub.isActive = value;
                      }
                    });
                  },
                  activeColor: Colors.blue,
                  inactiveTrackColor: Colors.grey[800],
                ),
              ],
            ),
            
            // Entertainment Subscriptions
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Entertainment Subscriptions',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
            ..._buildSubscriptionItems(_entertainmentSubscriptions),
            
            // Productivity Subscriptions
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Productivity Subscriptions',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
            ..._buildSubscriptionItems(_productivitySubscriptions),
          ],
        ),
      ),
    );
  }
  
  List<Widget> _buildSubscriptionItems(List<SubscriptionItem> items) {
    return items.map((item) {
      return Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1C1C1E),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Service Icon
            if (item.useCustomIcon && item.name == 'Spotify')
              _buildSpotifyIcon()
            else
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: item.iconColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text(
                  item.icon,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            
            const SizedBox(width: 16),
            
            // Service Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.planDetails,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            
            // Price and Switch
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  item.price,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Switch(
                  value: item.isActive,
                  onChanged: (value) {
                    setState(() {
                      item.isActive = value;
                      _updateMasterToggle();
                    });
                  },
                  activeColor: Colors.blue,
                  inactiveTrackColor: Colors.grey[800],
                ),
              ],
            ),
          ],
        ),
      );
    }).toList();
  }
  
  Widget _buildSpotifyIcon() {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: const Icon(
        Icons.music_note,
        color: Colors.white,
        size: 24,
      ),
    );
  }
  
  void _updateMasterToggle() {
    // Check if all subscriptions are active
    bool allActive = true;
    
    for (var sub in _entertainmentSubscriptions) {
      if (!sub.isActive) {
        allActive = false;
        break;
      }
    }
    
    if (allActive) {
      for (var sub in _productivitySubscriptions) {
        if (!sub.isActive) {
          allActive = false;
          break;
        }
      }
    }
    
    setState(() {
      _masterToggle = allActive;
    });
  }
}

class SubscriptionItem {
  final String name;
  final String icon;
  final Color iconColor;
  final String planDetails;
  final String price;
  bool isActive;
  final bool useCustomIcon;
  
  SubscriptionItem({
    required this.name,
    required this.icon,
    required this.iconColor,
    required this.planDetails,
    required this.price,
    required this.isActive,
    this.useCustomIcon = false,
  });
} 
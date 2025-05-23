import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Account', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Section
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'John Doe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Premium Account',
                    style: TextStyle(
                      color: Colors.blue[300],
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),

            // Account Settings
            _buildSectionHeader('Account Settings'),
            _buildSettingTile(
              icon: Icons.person_outline,
              title: 'Personal Information',
              onTap: () {},
            ),
            _buildSettingTile(
              icon: Icons.notifications_outlined,
              title: 'Notification Preferences',
              onTap: () {},
            ),
            _buildSettingTile(
              icon: Icons.security_outlined,
              title: 'Security Settings',
              onTap: () {},
            ),

            const SizedBox(height: 24),
            
            // Payments & Billing
            _buildSectionHeader('Payments & Billing'),
            _buildSettingTile(
              icon: Icons.credit_card_outlined,
              title: 'Manage Payment Methods',
              onTap: () {},
            ),
            _buildSettingTile(
              icon: Icons.receipt_long_outlined,
              title: 'Billing History',
              onTap: () {},
            ),
            _buildSettingTile(
              icon: Icons.diamond_outlined,
              title: 'Premium Plan Settings',
              onTap: () {},
            ),

            const SizedBox(height: 24),
            
            // Support & About
            _buildSectionHeader('Support & About'),
            _buildSettingTile(
              icon: Icons.help_outline,
              title: 'Help Center',
              onTap: () {},
            ),
            _buildSettingTile(
              icon: Icons.support_agent_outlined,
              title: 'Contact Support',
              onTap: () {},
            ),
            _buildSettingTile(
              icon: Icons.info_outline,
              title: 'About',
              onTap: () {},
            ),
            
            const SizedBox(height: 24),
            
            // Sign Out Button
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red[700],
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Sign Out',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.grey,
        ),
        onTap: onTap,
      ),
    );
  }
} 
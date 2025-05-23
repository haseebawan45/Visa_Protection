import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GroupProtectionPlanScreen extends StatefulWidget {
  const GroupProtectionPlanScreen({super.key});

  @override
  State<GroupProtectionPlanScreen> createState() => _GroupProtectionPlanScreenState();
}

class _GroupProtectionPlanScreenState extends State<GroupProtectionPlanScreen> {
  final TextEditingController _coverageController = TextEditingController(text: '50000');
  String _selectedPlanType = 'Family Plan';
  final List<String> _planTypes = ['Family Plan', 'Individual Plan', 'Business Plan'];
  
  final List<Member> _members = [
    Member(name: 'John A. Smith', initial: 'J', color: Colors.blue),
    Member(name: 'Sarah Smith', initial: 'S', color: Colors.blue.shade300),
    Member(name: 'Michael Smith', initial: 'M', color: Colors.blue.shade700),
    Member(name: 'Emma Smith', initial: 'E', color: Colors.blue.shade500),
  ];

  @override
  void dispose() {
    _coverageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111827),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111827),
        elevation: 0,
        title: Row(
          children: [
            Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                color: Colors.blue.shade800,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.shield,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'Group Protection Plan',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              // Navigate to plan management
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Manage Plan'),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Open settings
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Current Plan Section
            _buildSectionHeader('Current Plan'),
            const SizedBox(height: 16),
            
            // Plan Type
            _buildLabelRow(
              'Plan Type',
              _buildPlanTypeDropdown(),
            ),
            
            // Monthly Fee
            _buildLabelRow(
              'Monthly Fee',
              const Text(
                '\$24.99',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            
            // Billing Cycle
            _buildLabelRow(
              'Billing Cycle',
              const Text(
                'Monthly',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            
            // Next Payment
            _buildLabelRow(
              'Next Payment',
              const Text(
                'May 15, 2025',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            
            // Status
            _buildLabelRow(
              'Status',
              const Text(
                'Active',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Coverage Details Section
            _buildSectionHeader('Coverage Details'),
            const SizedBox(height: 16),
            
            // Coverage Amount
            _buildCoverageAmountField(),
            
            const SizedBox(height: 16),
            
            // Members
            _buildMembersSection(),
            
            const SizedBox(height: 32),
            
            // Included Benefits Section
            _buildSectionHeader('Included Benefits'),
            const SizedBox(height: 16),
            
            // Benefits List
            _buildBenefitItem('Fraud Protection', 'Up to \$25,000 in fraud reimbursement'),
            _buildBenefitItem('Identity Theft Protection', '24/7 monitoring and alerts'),
            _buildBenefitItem('Credit Monitoring', 'Real-time alerts on all credit bureaus'),
            _buildBenefitItem('Dark Web Monitoring', 'Protection against data breaches'),
          ],
        ),
      ),
    );
  }
  
  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
  
  Widget _buildLabelRow(String label, Widget content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 16,
            ),
          ),
          content,
        ],
      ),
    );
  }
  
  Widget _buildPlanTypeDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        value: _selectedPlanType,
        onChanged: (newValue) {
          if (newValue != null) {
            setState(() {
              _selectedPlanType = newValue;
            });
          }
        },
        items: _planTypes.map((String type) {
          return DropdownMenuItem<String>(
            value: type,
            child: Text(
              type,
              style: const TextStyle(color: Colors.white),
            ),
          );
        }).toList(),
        dropdownColor: const Color(0xFF1F2937),
        style: const TextStyle(color: Colors.white),
        icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
        underline: Container(), // Remove underline
      ),
    );
  }
  
  Widget _buildCoverageAmountField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Coverage Amount',
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          decoration: BoxDecoration(
            color: const Color(0xFF1F2937),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              const Text(
                '\$',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _coverageController,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.edit,
                  color: Colors.amber,
                  size: 20,
                ),
                onPressed: () {
                  // Focus on the field
                  FocusScope.of(context).requestFocus(
                    FocusNode()
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
  
  Widget _buildMembersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Members (${_members.length})',
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ..._members.map((member) => _buildMemberChip(member)),
            _buildAddMemberButton(),
          ],
        ),
      ],
    );
  }
  
  Widget _buildMemberChip(Member member) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: member.color,
            child: Text(
              member.initial,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            member.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildAddMemberButton() {
    return GestureDetector(
      onTap: () {
        // Show dialog to add a new member
        _showAddMemberDialog();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF1F2937),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.blue,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.add,
              color: Colors.blue,
              size: 16,
            ),
            const SizedBox(width: 4),
            const Text(
              'Add Member',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildBenefitItem(String title, String description) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blue.shade800,
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 16,
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
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  void _showAddMemberDialog() {
    final nameController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1F2937),
        title: const Text(
          'Add New Member',
          style: TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Member Name',
                labelStyle: TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty) {
                setState(() {
                  final name = nameController.text;
                  final initial = name.isNotEmpty ? name[0].toUpperCase() : 'X';
                  final color = Colors.primaries[_members.length % Colors.primaries.length];
                  
                  _members.add(Member(
                    name: name,
                    initial: initial,
                    color: color,
                  ));
                });
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}

class Member {
  final String name;
  final String initial;
  final Color color;
  
  Member({
    required this.name,
    required this.initial,
    required this.color,
  });
} 
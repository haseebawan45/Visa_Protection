import 'package:flutter/material.dart';

class AIRefundAssistantScreen extends StatefulWidget {
  const AIRefundAssistantScreen({super.key});

  @override
  State<AIRefundAssistantScreen> createState() => _AIRefundAssistantScreenState();
}

class _AIRefundAssistantScreenState extends State<AIRefundAssistantScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];
  bool _showAttachmentPreview = false;
  
  @override
  void initState() {
    super.initState();
    // Add initial welcome message from assistant
    _messages.add(
      ChatMessage(
        text: 'Welcome to AI Refund Assistant!\nHow can I help you today?',
        isUser: false,
        timestamp: DateTime.now(),
      ),
    );
    
    // Simulate user and assistant conversation after a delay
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _messages.add(
          ChatMessage(
            text: 'I need to dispute a charge on my card',
            isUser: true,
            timestamp: DateTime.now().add(const Duration(seconds: 1)),
          ),
        );
      });
      
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _messages.add(
            ChatMessage(
              text: 'I can help with that. Please provide the date and amount of the transaction you want to dispute. You can also upload a photo of the receipt if you have it.',
              isUser: false,
              timestamp: DateTime.now().add(const Duration(seconds: 2)),
            ),
          );
        });
        
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            _messages.add(
              ChatMessage(
                text: 'It was on May 1st for \$89.99 at TechStore. Here\'s the receipt.',
                isUser: true,
                timestamp: DateTime.now().add(const Duration(seconds: 3)),
                hasAttachment: true,
                attachmentName: 'receipt_techstore.jpg',
              ),
            );
          });
          
          Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              _messages.add(
                ChatMessage(
                  text: 'Thanks for the receipt. I\'ve initiated a dispute for \$89.99 at TechStore. You\'ll receive updates within 24 hours.',
                  isUser: false,
                  timestamp: DateTime.now().add(const Duration(seconds: 4)),
                ),
              );
            });
          });
        });
      });
    });
  }
  
  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
  
  void _handleSendPressed() {
    if (_messageController.text.trim().isEmpty) return;
    
    setState(() {
      _messages.add(
        ChatMessage(
          text: _messageController.text,
          isUser: true,
          timestamp: DateTime.now(),
          hasAttachment: _showAttachmentPreview,
          attachmentName: _showAttachmentPreview ? 'receipt_techstore.jpg' : null,
        ),
      );
      _messageController.clear();
      _showAttachmentPreview = false;
    });
    
    // Simulate AI response after a short delay
    Future.delayed(const Duration(milliseconds: 800), () {
      setState(() {
        _messages.add(
          ChatMessage(
            text: 'I\'ll check on your previous dispute and provide an update shortly.',
            isUser: false,
            timestamp: DateTime.now(),
          ),
        );
      });
    });
  }
  
  void _handleAttachmentPressed() {
    setState(() {
      _showAttachmentPreview = !_showAttachmentPreview;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E58B4),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('AI Refund Assistant', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Card details banner
          _buildCardDetails(),
          
          // Chat messages
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: _messages.length,
              itemBuilder: (context, index) => _buildMessageItem(_messages[index]),
            ),
          ),
          
          // Attachment preview
          if (_showAttachmentPreview) _buildAttachmentPreview(),
          
          // Message input field
          _buildMessageComposer(),
        ],
      ),
    );
  }
  
  Widget _buildCardDetails() {
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF1E58B4),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
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
  
  Widget _buildMessageItem(ChatMessage message) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: message.isUser 
              ? const Color(0xFF007AFF) 
              : const Color(0xFF2C2C2E),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            if (message.hasAttachment) ...[
              const SizedBox(height: 8),
              _buildAttachment(message.attachmentName!),
            ],
          ],
        ),
      ),
    );
  }
  
  Widget _buildAttachment(String name) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.insert_photo,
            color: Colors.white70,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(
            name,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildAttachmentPreview() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      color: const Color(0xFF1C1C1E),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.insert_photo,
                  color: Colors.blue,
                  size: 20,
                ),
                const SizedBox(width: 8),
                const Text(
                  'receipt_techstore.jpg',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.grey),
            onPressed: () {
              setState(() {
                _showAttachmentPreview = false;
              });
            },
          ),
        ],
      ),
    );
  }
  
  Widget _buildMessageComposer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      color: const Color(0xFF1C1C1E),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.photo_camera, color: Colors.blue),
            onPressed: _handleAttachmentPressed,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF2C2C2E),
                borderRadius: BorderRadius.circular(24),
              ),
              child: TextField(
                controller: _messageController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Type your message...',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.blue),
            onPressed: _handleSendPressed,
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isUser;
  final DateTime timestamp;
  final bool hasAttachment;
  final String? attachmentName;
  
  ChatMessage({
    required this.text,
    required this.isUser,
    required this.timestamp,
    this.hasAttachment = false,
    this.attachmentName,
  });
} 
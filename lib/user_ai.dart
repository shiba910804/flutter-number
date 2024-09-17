import 'package:flutter/material.dart';
import 'ai_service.dart'; // 確保導入AI服務

class UserAIPage extends StatefulWidget {
  const UserAIPage({super.key});

  @override
  _UserAIPageState createState() => _UserAIPageState();
}

class _UserAIPageState extends State<UserAIPage> {
  final TextEditingController _controller = TextEditingController();
  final AIService _aiService = AIService();
  String _response = '';

  void _sendMessage() async {
    final input = _controller.text.trim();
    if (input.isNotEmpty) {
      setState(() {
        _response = '正在處理...';
      });

      // 調用AI服務以獲取回應
      String aiReply = await _aiService.getAIResponse(input);
      setState(() {
        _response = aiReply;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text('AI小助手'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('請輸入問題，AI小助手將回答您的問題:'),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: '例如：給我我孫子的菜單',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _sendMessage,
                    child: const Text('發送'),
                  ),
                  const SizedBox(height: 20),
                  if (_response.isNotEmpty)
                    Text(
                      'AI助手回覆: $_response',
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

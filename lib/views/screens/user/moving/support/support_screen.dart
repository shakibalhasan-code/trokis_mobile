import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trokis_mobile/core/helper/widgets_helper.dart';
import 'package:trokis_mobile/core/utils/themes/app_styles.dart';
import 'package:trokis_mobile/views/screens/user/moving/support/components/chat_item.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  List<Map<String, dynamic>> messages = [
    {
      'message': 'Hello! How can I assist you?',
      'isSender': false,
      'time': '10:15'
    },
    {'message': 'I need help with my move.', 'isSender': true, 'time': '10:15'},
    {
      'message': 'Sure, I can help with that.',
      'isSender': false,
      'time': '11:40'
    },
    {
      'message': 'Lorem ipsum dolor sit amet.',
      'isSender': true,
      'time': '11:40'
    },
    {'message': 'Lorem ipsum dolor ipsum.', 'isSender': false, 'time': '12:00'},
  ];

  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryBgColor,
      appBar: WidgetsHelper.showAppBar(title: 'Support'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return ChatItem(
                    isSender: messages[index]['isSender'],
                    message: messages[index]['message'],
                    time: messages[index]['time'],
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: TextFormField(
                controller: _messageController,
                decoration: InputDecoration(
                  filled: true,
                  hintText: 'Message',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.send, color: Colors.black),
                    onPressed: () {
                      if (_messageController.text.isNotEmpty) {
                        setState(() {
                          messages.add({
                            'message': _messageController.text,
                            'isSender': true,
                            'time': '12:30', // You can use current time here
                          });
                          _messageController.clear();
                        });
                      }
                    },
                  ),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.r),
                    borderSide: BorderSide(width: 1, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

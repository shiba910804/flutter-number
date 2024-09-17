// lib/welcome_page.dart

import 'package:flutter/material.dart';
import 'login_page.dart'; // 確保你創建並導入了登入頁面

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 背景图片
          Positioned.fill(
            child: Image.asset(
              'assets/images/sss.jpg',  // 确保路径正确
              fit: BoxFit.cover,
            ),
          ),
          // 透明层
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          // 内容
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              // 标题
              Text(
                '智慧排隊通',
                style: TextStyle(
                  fontFamily: 'Cursive', // 确保你有这个字体
                  fontSize: 36,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              // 描述文字
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  '掌握跳號資訊，不再浪費時間！',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              Spacer(),
              // 按钮
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // 导航到登录页面
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange, // 按钮背景颜色
                        foregroundColor: Colors.white, // 按钮文字颜色
                        minimumSize: Size(double.infinity, 50), // 按钮大小
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('登入'),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // 导航到创建账户页面（这里也导航到登录页面，你可以创建一个新的注册页面并导航到它）
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.orange),
                        ),
                      ),
                      child: Text('建立帳號'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_fernanda_chan/config/theme/app_theme.dart';
import 'package:yes_no_app_fernanda_chan/presentation/providers/chat_provider.dart';
import 'package:yes_no_app_fernanda_chan/presentation/screens/chat/chat_screen.dart'; 

void main() => runApp(const MyApp()); 

class MyApp extends StatelessWidget { 
  const MyApp({super.key}); 
  
  @override 
  Widget build (BuildContext context) { 
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(  
        title: 'Yes No App', 
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 1).theme(),
        home: const ChatScreen()
        ),
    ); // MaterialApp X 
   }
}
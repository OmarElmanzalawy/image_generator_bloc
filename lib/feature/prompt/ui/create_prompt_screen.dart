import 'package:flutter/material.dart';

class CreatePromptScreen extends StatefulWidget {
  const CreatePromptScreen({super.key});

  @override
  State<CreatePromptScreen> createState() => _CreatePromptScreenState();
}

class _CreatePromptScreenState extends State<CreatePromptScreen> {

  final TextEditingController _promptController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Generate Images🚀'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                color: Colors.deepPurple,
              ),
            ),

              Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.topLeft,
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Enter your prompt',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 8,),
                    TextField(
                      controller: _promptController,
                      cursorColor: Colors.deepPurple,
                      decoration: InputDecoration(
                        hintText: 'Generate a picture of a cat',
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12)),borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12)),borderSide: BorderSide(color: Colors.deepPurple)),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    SizedBox(
                      width: double.maxFinite,
                      height: 48,
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                          backgroundColor: WidgetStatePropertyAll(Colors.deepPurple),
                          
                          ),
                        onPressed: (){}, icon: Icon(Icons.generating_tokens),label: Text('Generate'),),
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
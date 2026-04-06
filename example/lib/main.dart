import 'package:flutter/material.dart';
import 'package:flutter_text_input/flutter_text_input.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ExamplePage());
  }
}

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscure = true;

  void submitForm() {
    if (formKey.currentState!.validate()) {
      /// Navigate to next page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SecondPage()),
      );
    } else {
      /// Show error snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields correctly")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form Example")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              /// EMAIL
              ReusableTextField(
                controller: emailController,
                labelText: "Email",
                prefixIcon: Icons.email,

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter email";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              /// PASSWORD
              ReusableTextField(
                controller: passwordController,
                labelText: "Password",
                prefixIcon: Icons.lock,
                obscureText: obscure,

                suffixIcon: Icon(
                  obscure ? Icons.visibility : Icons.visibility_off,
                ),

                onSuffixTap: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter password";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30),

              /// SUBMIT BUTTON
              ElevatedButton(
                onPressed: submitForm,
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Page")),
      body: const Center(child: Text("Welcome!")),
    );
  }
}

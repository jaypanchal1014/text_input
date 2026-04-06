# Reusable Text Input

A lightweight and customizable Flutter package that provides a reusable text input field with support for validation, icons, formatters, and password visibility toggle.

This package helps developers build consistent and reusable form inputs across Flutter applications.

---

## ✨ Features

* Reusable TextFormField widget
* Prefix and suffix icons support
* Password visibility toggle
* Input validation support
* Input formatters support
* Keyboard type customization
* Enable / disable field
* Custom border styling

---

## demo 


https://github.com/user-attachments/assets/552a957d-c93d-4cee-9b3e-ccea8603ec41






## 📦 Installation

Add the dependency to your **pubspec.yaml**

```yaml
dependencies:
  reusable_text_input:
    path: ../
```

Then run:

```
flutter pub get
```

---

## 🚀 Usage

Import the package:

```dart
import 'package:reusable_text_input/reusable_text_input.dart';
```

Example usage:

```dart
ReusableTextField(
  controller: emailController,
  labelText: "Email",
  hintText: "Enter your email",
  prefixIcon: Icons.email,
  keyboardType: TextInputType.emailAddress,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return "Enter email";
    }
    return null;
  },
)
```

---

## 🔐 Password Field Example

```dart
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
)
```

---

## 📱 Phone Number Input Example

```dart
ReusableTextField(
  controller: phoneController,
  labelText: "Phone Number",
  prefixIcon: Icons.phone,
  keyboardType: TextInputType.phone,
  inputFormatters: [
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(10),
  ],
)
```

---

## ⚙️ Parameters

| Parameter       | Description                          |
| --------------- | ------------------------------------ |
| controller      | Controls the text being edited       |
| hintText        | Placeholder text                     |
| labelText       | Floating label text                  |
| prefixIcon      | Icon displayed at the start          |
| suffixIcon      | Icon displayed at the end            |
| obscureText     | Hides text for password fields       |
| keyboardType    | Keyboard type (email, phone, number) |
| validator       | Form validation function             |
| inputFormatters | Restrict or format input             |
| enabled         | Enable or disable the field          |
| onSuffixTap     | Action when suffix icon is tapped    |

---

## 📸 Example UI

```
Email
[ 📧 Enter email ]

Password
[ 🔒 ******** 👁 ]

Phone
[ 📞 9876543210 ]
```

---

## 📄 License

This project is licensed under the MIT License.

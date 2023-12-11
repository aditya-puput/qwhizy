import 'package:flutter/material.dart';
import 'package:mdaq/common/theme/app_font_style.dart';
import 'package:mdaq/common/utils/transtition_fade.dart';
import 'package:mdaq/common/widgets/auth_text_field.dart';
import 'package:mdaq/common/helper.dart';
import 'package:mdaq/views/auth/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfController = TextEditingController();
  final TextEditingController _namaLengkapController = TextEditingController();
  final TextEditingController _tanggalLahirController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _passwordConfController.dispose();
    _namaLengkapController.dispose();
    _tanggalLahirController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFD4E1F2),
          gradient: darkMode
              ? const LinearGradient(
                  colors: [
                    Color(0xFF0F2C48),
                    Color(0xFF122447),
                    Color(0xFF040E31),
                    Color(0xFF071336)
                  ],
                  stops: [0.0, 0.25, 0.75, 1.0],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              : null,
        ),
        child: ListView(children: [Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text('Sign Up',
                style: AppFontStyle.authTitleText
                    .copyWith(color: darkMode ? Colors.white : Colors.black)),
            const SizedBox(height: 20),
            Text('Username',
                style: AppFontStyle.authLabelText
                    .copyWith(color: darkMode ? Colors.white : Colors.black)),
            AuthTextField(
              controller: _usernameController,
              hintText: "Username..",
              obscureText: false,
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 8),
            Text('Password',
                style: AppFontStyle.authLabelText
                    .copyWith(color: darkMode ? Colors.white : Colors.black)),
            AuthTextField(
              controller: _passwordController,
              hintText: "Password..",
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 8),
            Text('Re-type Password',
                style: AppFontStyle.authLabelText
                    .copyWith(color: darkMode ? Colors.white : Colors.black)),
            AuthTextField(
              controller: _passwordConfController,
              hintText: "Password..",
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, 
                        children: [
                          Text(
                            'Nama Lengkap',
                            style: AppFontStyle.authLabelText.copyWith(
                              color: darkMode ? Colors.white : Colors.black,
                            ),
                          ),
                          AuthTextField(
                            controller: _namaLengkapController,
                            hintText: "Nama..",
                            obscureText: true,
                            keyboardType: TextInputType.name,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, 
                        children: [
                          Text(
                            'Tanggal Lahir',
                            style: AppFontStyle.authLabelText.copyWith(
                              color: darkMode ? Colors.white : Colors.black,
                            ),
                          ),
                          AuthTextField(
                            controller: _tanggalLahirController,
                            hintText: "Tanggal..",
                            obscureText: true,
                            keyboardType: TextInputType.datetime,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
                  child: Container(
                    height: 42.0,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF3CEAC1), Color(0xFF00C0DA)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Center(
                      child: Text(
                        "Sign Up",
                        style: AppFontStyle.authLabelText
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sudah punya akun?",
                    style: AppFontStyle.authSmallText.copyWith(
                        color: darkMode ? Colors.white : Colors.black)),
                const SizedBox(
                  width: 2,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      TransitionFade(child: const Login()),
                    );
                  },
                  child: Text("Log in", style: AppFontStyle.authSmallBoldText),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),]),
      ),
    );
  }
}

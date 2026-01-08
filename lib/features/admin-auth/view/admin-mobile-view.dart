import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/config/textstyle.dart';
import 'package:sm_reward_app/core/global_widgets/custom_textfield.dart';
import 'package:sm_reward_app/core/global_widgets/global_button.dart';
import 'package:sm_reward_app/features/admin-auth/controller/admin-controller.dart';
import 'package:sm_reward_app/features/auth/controller/login_controller.dart';

class MobileLogin extends StatelessWidget {
  const MobileLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                _MobileTopLogo(),
                SizedBox(height: 24),
                _MobileLoginSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 🔹 TOP LOGO
class _MobileTopLogo extends StatelessWidget {
  const _MobileTopLogo();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "SM Reward",
          style: AppTextStyles.titleLarge(context).copyWith(
            color: const Color(0xFF20304A),
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 180,
          child: Image.asset(
            'assets/logo/app-logo.png',
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}

/// 🔹 LOGIN SECTION
class _MobileLoginSection extends StatelessWidget {
  const _MobileLoginSection();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminController());
    return _MobileLoginCard(controller: controller);
  }
}

/// 🔹 LOGIN CARD
class _MobileLoginCard extends StatefulWidget {
  final AdminController controller;

  const _MobileLoginCard({required this.controller});

  @override
  State<_MobileLoginCard> createState() => _MobileLoginCardState();
}

class _MobileLoginCardState extends State<_MobileLoginCard> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  bool _passwordVisible = false;

  Future<void> _handleLogin() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

   final username = widget.controller.username.text.trim();
final password = widget.controller.password.text.trim();


    /// ✅ HARD-CODED AUTH CHECK
    if (username != 'admin' || password != '123') {
      Get.snackbar(
        'Login Failed',
        'Invalid username or password',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        margin: const EdgeInsets.all(12),
      );
      return;
    }

    setState(() => _isLoading = true);

    await widget.controller.login(); // optional API / navigation

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 380),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.25),
            blurRadius: 30,
            spreadRadius: 4,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text('Login', style: AppTextStyles.titleMedium(context)),
            ),
            const SizedBox(height: 20),

            /// 🔹 USERNAME
            AppTextField(
              label: 'Username',
              hintText: 'Username',
              controller: widget.controller.username,
              textInputAction: TextInputAction.next,
              size: AppTextFieldSize.small,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Username is required';
                }
                if (value.trim() != 'admin') {
                  return 'Invalid username';
                }
                return null;
              },
            ),

            const SizedBox(height: 12),

            /// 🔹 PASSWORD
            AppTextField(
              label: 'Password',
              hintText: 'Password',
              controller: widget.controller.password,
              obscureText: !_passwordVisible,
              textInputAction: TextInputAction.done,
              size: AppTextFieldSize.small,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                }
                if (value.trim() != '123') {
                  return 'Invalid password';
                }
                return null;
              },
              suffixIcon: IconButton(
                icon: Icon(
                  _passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
            ),

            const SizedBox(height: 20),

            /// 🔹 LOGIN BUTTON
            Center(
              child: AppButton(
                label: 'Login',
                onPressed: _handleLogin,
                isLoading: _isLoading,
                size: AppButtonSize.medium,
                width: 160,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

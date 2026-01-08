import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/config/textstyle.dart';
import 'package:sm_reward_app/core/global_widgets/custom_textfield.dart';
import 'package:sm_reward_app/core/global_widgets/global_button.dart';
import 'package:sm_reward_app/core/navigation/side_navbar_desktop.dart';
import 'package:sm_reward_app/features/admin-auth/controller/admin-controller.dart';


class DesktopAdminLogin extends StatelessWidget {
  const DesktopAdminLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminController());

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: Center(
        child: Container(
          width: 900,
          height: 520,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            children: [
              /// LEFT IMAGE / BRAND
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(24),
                    ),
                    color: Color(0xFF20304A),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/logo/app-logo.png',
                        width: 160,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'SM Reward Admin',
                        style: AppTextStyles.titleLarge(context).copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// RIGHT LOGIN FORM
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 48,
                    vertical: 40,
                  ),
                  child: _DesktopLoginForm(controller: controller),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 🔹 LOGIN FORM
class _DesktopLoginForm extends StatefulWidget {
  final AdminController controller;
  const _DesktopLoginForm({required this.controller});

  @override
  State<_DesktopLoginForm> createState() => _DesktopLoginFormState();
}

class _DesktopLoginFormState extends State<_DesktopLoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _passwordVisible = false;

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    final username = widget.controller.username.text.trim();
    final password = widget.controller.password.text.trim();

    if (username != 'admin' || password != '123') {
      Get.snackbar(
        'Login Failed',
        'Invalid admin credentials',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    setState(() => _isLoading = true);

    await widget.controller.login();

    setState(() => _isLoading = false);

    /// ✅ DESKTOP DASHBOARD
    Get.offAll(() => const SideMenuLayout());
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Admin Login',
            style: AppTextStyles.titleMedium(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),

          /// USERNAME
          AppTextField(
            label: 'Username',
            hintText: 'admin',
            controller: widget.controller.username,
            size: AppTextFieldSize.medium,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Username required';
              }
              return null;
            },
          ),

          const SizedBox(height: 16),

          /// PASSWORD
          AppTextField(
            label: 'Password',
            hintText: '••••••',
            controller: widget.controller.password,
            obscureText: !_passwordVisible,
            size: AppTextFieldSize.medium,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password required';
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

          const SizedBox(height: 28),

          /// LOGIN BUTTON
          Center(
            child: AppButton(
              label: 'Login',
              onPressed: _handleLogin,
              isLoading: _isLoading,
              width: 180,
            ),
          ),
        ],
      ),
    );
  }
}

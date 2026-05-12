import 'package:app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:app/shared/custom_text_field.dart';
import 'package:app/shared/primary_button.dart';
import 'package:app/config/theme/app_theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          // Background Decorative Elements
          Positioned(
            top: -size.width * 0.2,
            right: -size.width * 0.2,
            child: Container(
              width: size.width * 0.6,
              height: size.width * 0.6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.primaryColor.withOpacity(0.05),
              ),
            ),
          ),
          
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  
                  // Premium Animation Container
                  Container(
                    height: size.height * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Lottie.asset(
                      'lib/assets/animations/login_animation.json', 
                      fit: BoxFit.contain,
                    ),
                  ),
                  
                  const SizedBox(height: 30),

                  // Title with enhanced typography
                  Text(
                    l10n.appName, 
                    style: theme.textTheme.displayMedium,
                  ),
                  const SizedBox(height: 12),
                  
                  // Subtitle with better style
                  Text(
                    l10n.subtitle, 
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontStyle: FontStyle.italic,
                      color: Colors.black45,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  const SizedBox(height: 45),

                  // Inputs Section
                  _buildInputLabel('Email'),
                  const SizedBox(height: 8),
                  CustomTextField(
                    hintText: l10n.emailHint,
                    prefixIcon: Icons.alternate_email_rounded,
                  ),
                  
                  const SizedBox(height: 20),
                  
                  _buildInputLabel('Password'),
                  const SizedBox(height: 8),
                  CustomTextField(
                    hintText: l10n.passwordHint,
                    prefixIcon: Icons.lock_open_rounded,
                    isPassword: true,
                    suffixIcon: Icon(
                      Icons.visibility_off_rounded, 
                      color: Colors.grey.withOpacity(0.6),
                      size: 22,
                    ),
                  ),
                  
                  const SizedBox(height: 35),

                  // Primary Action Button
                  PrimaryButton(
                    text: l10n.loginButton,
                    onPressed: () => context.go('/welcome'),
                  ),
                  
                  const SizedBox(height: 24),

                  // Register Link with better interaction feel
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: AppTheme.accentColor,
                    ),
                    child: Text(
                      l10n.noAccountText,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 30),

                  // Divider
                  Row(
                    children: [
                      const Expanded(child: Divider(thickness: 1, endIndent: 20)),
                      Text(l10n.orDivider, style: const TextStyle(color: Colors.black26, fontWeight: FontWeight.bold)),
                      const Expanded(child: Divider(thickness: 1, indent: 20)),
                    ],
                  ),
                  
                  const SizedBox(height: 30),

                  // Social Logins with improved design
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialButton(Icons.g_mobiledata_rounded, Colors.red.shade400),
                      const SizedBox(width: 20),
                      _socialButton(Icons.facebook_rounded, Colors.blue.shade700),
                      const SizedBox(width: 20),
                      _socialButton(Icons.apple_rounded, Colors.black),
                      const SizedBox(width: 20),
                      _socialButton(Icons.terminal_rounded, Colors.grey.shade800), // GitHub surrogate
                    ],
                  ),
                  
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputLabel(String label) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 14,
          color: AppTheme.secondaryColor,
        ),
      ),
    );
  }

  Widget _socialButton(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Icon(icon, size: 28, color: color),
    );
  }
}
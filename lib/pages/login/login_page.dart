import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundementals_homework/core/settings/settings_provider.dart';
import 'package:fundementals_homework/pages/patient_container/widgets/rive_login.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

part 'login_page.g.dart';

@riverpod
class AuthLogin extends _$AuthLogin {
  @override
  Future<bool> build() async {
    // Initial state: not logged in
    return false;
  }

  /// Call this to attempt login: shows loading, then data(true) or error
  Future<void> login(String email, String password) async {
    const correctEmail = "ahmed@example.com";
    const correctPassword = "password";

    final bool isCorrect = email == correctEmail && password == correctPassword;

    // Indicate loading state
    state = const AsyncValue.loading();

    if (isCorrect) {
      ref.read(riveLoginProvider.notifier).setValue(1);
    } else {
      ref.read(riveLoginProvider.notifier).setValue(2);
    }
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 3));

    if (isCorrect) {
      ref.read(riveLoginProvider.notifier).setValue(0);
      ref.read(settingsNotifierProvider.notifier).setIsLoggedIn(true);
      state = const AsyncValue.data(true);
    } else {
      ref.read(riveLoginProvider.notifier).setValue(0);

      // Failure → update to error
      state = AsyncValue.error(
        "Email or password is incorrect.",
        StackTrace.current,
      );
    }
  }
}

class LoginPage extends ConsumerWidget {
  final FormKey _emailKey;
  final FormKey _passwordKey;
  final String? error;
  final bool isLoading;

  const LoginPage({
    super.key,
    required FormKey emailKey,
    required FormKey passwordKey,
    this.error,
    this.isLoading = false,
  }) : _emailKey = emailKey,
       _passwordKey = passwordKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      loadingProgressIndeterminate: isLoading,
      footers: [
        const Text("For Successful Login Enter The Following:").small,
        const Text("Email: ahmed@example.com").small.muted,
        const Text("Password: password").small.muted,
      ],
      headers: [
        AppBar(
          title: const Text("HeartFlow Hospital App"),
          subtitle: Text("Appointment System"),
        ),
      ],
      child: Form(
        onSubmit: (context, values) {
          ref
              .read(authLoginProvider.notifier)
              .login(values[_emailKey], values[_passwordKey]);
        },
        child: Column(
          spacing: 12,
          children: [
            const Gap(24),
            if (error != null) ...[
              Alert.destructive(
                title: const Text("Invalid Credentials"),
                content: Text(error!),
              ),
            ],
            FormField(
              key: _emailKey,
              label: const Text("Email Address").h4,
              validator: EmailValidator(),
              child: const TextField(style: TextStyle(fontSize: 24)),
            ),
            FormField(
              key: _passwordKey,
              label: const Text("Password").h4,
              validator: NotEmptyValidator(),
              child: const TextField(
                style: TextStyle(fontSize: 24),
                obscureText: true,
              ),
            ),
            const Gap(24),
            FormErrorBuilder(
              builder:
                  (context, errors, child) => PrimaryButton(
                    enabled: !isLoading,
                    onPressed: () {
                      if (errors.isEmpty) context.submitForm();
                    },
                    child: const Text("Login").h4,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

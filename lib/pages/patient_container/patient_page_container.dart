// patient_page.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundementals_homework/core/settings/settings_provider.dart';
import 'package:fundementals_homework/pages/login/login_page.dart';
import 'package:fundementals_homework/pages/patient_container/widgets/rive_dashboard.dart';
import 'package:fundementals_homework/pages/patient_container/widgets/rive_login.dart';
import 'package:fundementals_homework/pages/patient_container/widgets/rive_payment.dart';
import 'package:fundementals_homework/pages/patient_page.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class PatientPageContainer extends ConsumerStatefulWidget {
  const PatientPageContainer({super.key});

  @override
  ConsumerState<PatientPageContainer> createState() => _PatientPageState();
}

class _PatientPageState extends ConsumerState<PatientPageContainer> {
  // Form field keys
  final emailKey = FormKey(#email);
  final passwordKey = FormKey(#password);

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authLoginProvider);
    final settings = ref.watch(settingsNotifierProvider);

    return Scaffold(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          OutlinedContainer(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
            height: 740,
            width: 360,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child:
                  settings.isLoggedIn
                      ? PatientPage()
                      : authState.when(
                        data: (loggedIn) {
                          // If logged in → show next screen
                          if (loggedIn) {
                            return PatientPage();
                          }
                          // Otherwise, show the login form
                          return LoginPage(
                            emailKey: emailKey,
                            passwordKey: passwordKey,
                          );
                        },
                        loading: () {
                          return LoginPage(
                            emailKey: emailKey,
                            passwordKey: passwordKey,
                            isLoading: true,
                          );
                        },
                        error: (error, _) {
                          return LoginPage(
                            emailKey: emailKey,
                            passwordKey: passwordKey,
                            error: error.toString(),
                          );
                        },
                      ),
            ),
          ),
          if (settings.isUMLMode) ...[
            if (!settings.isPaymentPage) ...[
              if (!settings.isLoggedIn) ...{
                RiveLoginWidget(),
            } else ...{
                RiveDashboardWidget(),
              },
            ] else ...{
              RivePaymentWidget(),
            },
          ],
        ],
      ),
    );
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundementals_homework/widget/slot_selection.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

final times = [
  '12:00 AM - 1:00 AM',
  '1:00 AM - 2:00 AM',
  '2:00 AM - 3:00 AM',
  '3:00 AM - 4:00 AM',
  '4:00 AM - 5:00 AM',
  '5:00 AM - 6:00 AM',
  '6:00 AM - 7:00 AM',
  '7:00 AM - 8:00 AM',
  '8:00 AM - 9:00 AM',
  '9:00 AM - 10:00 AM',
  '10:00 AM - 11:00 AM',
  '11:00 AM - 12:00 PM',
  '12:00 PM - 1:00 PM',
  '1:00 PM - 2:00 PM',
  '2:00 PM - 3:00 PM',
  '3:00 PM - 4:00 PM',
  '4:00 PM - 5:00 PM',
  '5:00 PM - 6:00 PM',
  '6:00 PM - 7:00 PM',
  '7:00 PM - 8:00 PM',
];

class DoctorPage extends ConsumerWidget {
  const DoctorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedContainer(
      child: Scaffold(
        headers: [
          AppBar(
            title: Text("Doctor DashBoard"),
            trailing: [
              SizedBox(
                width: 250,
                child: TextField(
                  hintText: "Search Here...",
                  features: [InputFeature.leading(Icon(BootstrapIcons.search))],
                ),
              ),
              Basic(
                padding: EdgeInsets.all(12),
                content: Text("Dr. Khalid Kashmiri").bold,
                leading: Avatar(
                  initials: 'KK',
                  badge: AvatarBadge(color: Colors.green, size: 12),
                ),
              ),
            ],
          ),
        ],
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 1,
              child: Card(
                child: NavigationSidebar(
                  spacing: 12,
                  children: [
                    NavigationLabel(child: Text("HeartFlow")),
                    NavigationDivider(thickness: 2),
                    NavigationItem(
                      label: Text("Schedule"),
                      selected: true,
                      selectedStyle: ButtonStyle.primary(),
                      child: Icon(BootstrapIcons.calendar),
                    ),
                    NavigationItem(
                      label: Text("Patients"),
                      // selected: true,
                      // selectedStyle: ButtonStyle.primary(),
                      child: Icon(BootstrapIcons.people),
                    ),
                    NavigationItem(
                      label: Text("Reports"),
                      // selected: true,
                      // selectedStyle: ButtonStyle.primary(),
                      child: Icon(BootstrapIcons.book),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Column(children: [SlotSelection(slots: times)]),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class SectionExperience extends StatelessWidget {
  const SectionExperience({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Experience',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const Divider(),
        const SizedBox(height: 16),
        FixedTimeline.tileBuilder(
          theme: TimelineThemeData(
            color: Theme.of(context).primaryColor,
          ),
          builder: TimelineTileBuilder.connectedFromStyle(
            contentsAlign: ContentsAlign.basic,
            connectionDirection: ConnectionDirection.before,
            oppositeContentsBuilder: (context, index) {
              return index == 0
                  ? const LeftSection(
                      joinDate: 'March 2020 - Present',
                      role: 'ANDROID DEVELOPER',
                    )
                  : const LeftSection(
                      joinDate: 'September 2018 - February 2020',
                      role: 'SOFTWARE DEVELOPER',
                    );
            },
            contentsBuilder: (context, index) {
              return index == 0
                  ? const RightSection(
                      companyName: 'PT. Buana Varia Komputama',
                      address: 'South Jakarta, Indonesia',
                      jobDesc: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '# Developed and maintained multiple Android applications using Kotlin and Android SDK (Kimia Farma Mobile, Kimia Farma - Digital Order, Kimia Farma - Digital Reservation).',
                          ),
                          SizedBox(height: 8),
                          Text(
                            '# Utilized REST APIs and integrated third-party libraries to enhance app functionality and user experience.',
                          ),
                          SizedBox(height: 8),
                          Text(
                            '# Conducted code reviews and provided mentorship to other developers, enhancing team productivity and code quality.',
                          ),
                          SizedBox(height: 8),
                          Text(
                            '# Collaborated with UI/UX designers to create intuitive and visually appealing interfaces.',
                          ),
                        ],
                      ),
                    )
                  : const RightSection(
                      companyName: 'PI Teknologi',
                      address: 'West Jakarta, Indonesia',
                      jobDesc: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '# Developed and maintained multiple Android applications using Kotlin & Java with Android SDK (Ngeretail, Ngeretail Point, Ngeretail Delman).',
                          ),
                          SizedBox(height: 8),
                          Text(
                            '# Fix minor bugs in backend side that uses C# programming language.',
                          ),
                          SizedBox(height: 8),
                          Text(
                            '# Rewrite Nge-Web Admin portal using Angular framework which previously used C# programming language.',
                          ),
                        ],
                      ),
                    );
            },
            indicatorPositionBuilder: (context, index) => 0.05,
            connectorStyleBuilder: (context, index) => ConnectorStyle.solidLine,
            indicatorStyleBuilder: (context, index) => IndicatorStyle.outlined,
            itemCount: 2,
          ),
        ),
      ],
    );
  }
}

class LeftSection extends StatelessWidget {
  final String joinDate;
  final String role;

  const LeftSection({super.key, required this.joinDate, required this.role});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: Text(joinDate, textAlign: TextAlign.end),
          ),
          const SizedBox(height: 16),
          Flexible(
            child: Text(
              role,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}

class RightSection extends StatelessWidget {
  final String companyName;
  final String address;
  final Widget jobDesc;

  const RightSection({
    super.key,
    required this.companyName,
    required this.address,
    required this.jobDesc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            companyName,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.start,
          ),
          Text(
            address,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 16),
          jobDesc,
          const SizedBox(height: 36),
        ],
      ),
    );
  }
}

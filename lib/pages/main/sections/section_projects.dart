import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/portfolio.dart';
import '../../../data/singleton.dart';

class SectionProjects extends StatelessWidget {
  const SectionProjects({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Portfolio> portfolios = SingletonData.getPortfolio();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Projects',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const Divider(),
        const SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 10,
          ),
          child: GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 564,
              mainAxisExtent: 524,
            ),
            itemCount: portfolios.length,
            itemBuilder: (context, index) {
              final portfolio = portfolios[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: 0.3,
                      color: Theme.of(context).primaryColor.withOpacity(0.3),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          portfolio.projectImage,
                          height: 200,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          portfolio.projectName,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          portfolio.projectDescription,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        if (portfolio.projectUrl != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: InkWell(
                              child: const Image(
                                height: 28,
                                image: AssetImage(
                                  'assets/images/get_it_on_google_play.png',
                                ),
                              ),
                              onTap: () async {
                                final uri =
                                    Uri.parse(portfolio.projectUrl ?? '');
                                if (await canLaunchUrl(uri)) {
                                  launchUrl(uri);
                                }
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

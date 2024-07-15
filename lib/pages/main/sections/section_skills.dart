import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../data/singleton.dart';

class SectionSkills extends StatelessWidget {
  const SectionSkills({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = SingletonData.getSkillSets();
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'Skills',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const Divider(),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 156,
              childAspectRatio: 3 / 2.5,
            ),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: skills.length,
            itemBuilder: (context, index) {
              final skill = skills[index];
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: skill.imageBrand != null
                          ? Brand(skill.imageBrand, size: 48)
                          : Image.asset(
                              skill.imageAsset,
                              width: 48,
                              height: 48,
                            ),
                    ),
                    const SizedBox(height: 8),
                    Flexible(
                      child: Text(skill.name),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

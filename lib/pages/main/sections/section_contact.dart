import 'package:ab_solution_portfolio/pages/main/components/social_media.dart';
import 'package:emailjs/emailjs.dart' as emailjs;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SectionContact extends StatelessWidget {
  const SectionContact({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final subjectController = TextEditingController();
    final messageController = TextEditingController();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Contact',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const Divider(),
        const SizedBox(height: 12),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 10,
          ),
          child: const Text(
            'Feel free to Contact me by submitting the form below and I will get back to you as soon as possible',
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 10,
          ),
          child: Wrap(
            spacing: 36,
            children: [
              SizedBox(
                width: 400,
                child: Column(
                  children: [
                    _textFieldRounded(
                      controller: nameController,
                      label: 'Name*',
                    ),
                    const SizedBox(height: 16),
                    _textFieldRounded(
                      controller: emailController,
                      label: 'Email*',
                    ),
                    const SizedBox(height: 16),
                    _textFieldRounded(
                      controller: subjectController,
                      label: 'Subject',
                    ),
                    const SizedBox(height: 16),
                    _textFieldRounded(
                      controller: messageController,
                      label: 'Message*',
                      maxLines: 5,
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: ElevatedButton(
                        onPressed: () => _sendEmailMessage(
                          nameController.text,
                          emailController.text,
                          messageController.text,
                          subjectController.text,
                        ),
                        child: const Text('Send Message'),
                      ),
                    ),
                    const SizedBox(height: 36),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Abdullah',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    'Android Developer',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Email',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    'abdullah.absolution@gmail.com',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  SocialMedia(
                    iconTint: Theme.of(context).primaryColor,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _textFieldRounded({
    required TextEditingController controller,
    required String label,
    int maxLines = 1,
  }) {
    final outlinedInputBorder = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.blueGrey.withOpacity(0.3)),
    );
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: outlinedInputBorder,
        border: outlinedInputBorder,
        focusedBorder: outlinedInputBorder,
        labelText: label,
      ),
      maxLines: maxLines,
    );
  }

  Future<void> _sendEmailMessage(
    String name,
    String email,
    String textMessage,
    String subject,
  ) async {
    try {
      if (name.isNotEmpty && email.isNotEmpty && textMessage.isNotEmpty) {
        Map<String, dynamic> templateParams = {
          'from_name': name,
          'message': textMessage,
          'reply_to': email,
          'subject': subject
        };
        await emailjs.send(
          'service_wans1np',
          'template_x0sm2gp',
          templateParams,
          const emailjs.Options(
            publicKey: 'DTpcWPYqYARyfDYCN',
            privateKey: 'LRRrJJyzGkB-ryjFbsATW',
          ),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}

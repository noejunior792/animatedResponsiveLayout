import 'models.dart';

final User user_0 = User(
    name: const Name(first: 'Noé', last: 'Júnior'),
    avatarUrl: 'assets/avatar_1.png',
    lastActive: DateTime.now());
final User user_1 = User(
    name: const Name(first: 'Tim', last: 'Last'),
    avatarUrl: 'assets/avatar_2.png',
    lastActive: DateTime.now().subtract(const Duration(minutes: 10)));
final User user_2 = User(
    name: const Name(first: 'So', last: 'Duri'),
    avatarUrl: 'assets/avatar_3.png',
    lastActive: DateTime.now().subtract(const Duration(minutes: 20)));
final User user_3 = User(
    name: const Name(first: 'Lily', last: 'MacDonald'),
    avatarUrl: 'assets/avatar_4.png',
    lastActive: DateTime.now().subtract(const Duration(hours: 2)));
final User user_4 = User(
    name: const Name(first: 'Ziad', last: 'Aouad'),
    avatarUrl: 'assets/avatar_5.png',
    lastActive: DateTime.now().subtract(const Duration(hours: 6)));

final List<Email> emails = [
  Email(
    sender: user_1,
    recipients: [],
    subject: 'Project Timeline',
    content: 'Hey team, I noticed that we might be behind on our project timeline. Can we discuss how we can get back on track?',
  ),
  Email(
    sender: user_2,
    recipients: [],
    subject: 'Feature Implementation',
    content:
        "I've been thinking about the new feature we're planning to implement. I have a few ideas on how we can streamline the process. Let's have a meeting to discuss this in detail.",
  ),
  Email(
      sender: user_3,
      recipients: [],
      subject: 'UI Design Feedback',
      content:
          "Hi all, I've attached a screenshot of the latest UI design for our project. Please review and provide your feedback. Looking forward to your thoughts!",
      attachments: [const Attachment(url: 'assets/thumbnail_1.png')]),
  Email(
    sender: user_4,
    recipients: [],
    subject: 'Volunteer Developers',
    content:
        'We could use some extra hands for our project. Do you know anyone who might be interested in volunteering as a developer for a few weeks?',
  ),
];

final List<Email> replies = [
  Email(
    sender: user_2,
    recipients: [
      user_3,
      user_2,
    ],
    subject: 'Feature Implementation',
    content:
        "I agree, we need to streamline our process. Let's schedule a meeting to go over your ideas. I'm available tomorrow afternoon. Does that work for everyone?",
  ),
  Email(
    sender: user_0,
    recipients: [
      user_3,
      user_2,
    ],
    subject: 'Feature Implementation',
    content:
        "I'm excited to hear your ideas for the new feature. Tomorrow afternoon works for me as well. Let's make sure we have a clear agenda so we can make the most of our time.",
  ),
];

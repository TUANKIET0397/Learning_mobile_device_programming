class OnboardingData {
  final String title;
  final String description;
  final String image;

  OnboardingData({
    required this.title,
    required this.description,
    required this.image,
  });
}

final onboardingList = [
  OnboardingData(
    title: 'Easy Time Management',
    description:
        'With management based on priority and daily tasks, it will give you convenience in managing and determining the tasks that must be done first',
    image: 'assets/onboard1.png',
  ),
  OnboardingData(
    title: 'Increase Work Effectiveness',
    description:
        'Time management and the determination of more important tasks will give your job statistics better and always improve',
    image: 'assets/onboard2.png',
  ),
  OnboardingData(
    title: 'Reminder Notification',
    description:
        'This application provides reminders so you don’t forget to keep doing your assignments well according to the time you have set',
    image: 'assets/onboard3.png',
  ),
];

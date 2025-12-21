import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'pages/payment_app_page.dart';

void main() => runApp(const PaymentApp());

class PaymentApp extends StatelessWidget {
  const PaymentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment App',
      theme: AppTheme.lightTheme,
      home: const SafeArea(child: PaymentAppPage()),
      debugShowCheckedModeBanner: false,
    );
  }
}

// import 'package:flutter/material.dart';

// void main() => runApp(const PaymentApp());

// class PaymentApp extends StatelessWidget {
//   const PaymentApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Payment App',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: const Color.fromRGBO(188, 214, 236, 1),
//         ),
//         useMaterial3: true,
//       ),
//       home: const SafeArea(child: PaymentAppPage()),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class PaymentAppPage extends StatefulWidget {
//   const PaymentAppPage({super.key});

//   @override
//   State<PaymentAppPage> createState() => _PaymentAppPageState();
// }

// class _PaymentAppPageState extends State<PaymentAppPage> {
//   final List<String> image = [
//     "assets/default.png",
//     "assets/paypal.png",
//     "assets/googlePay.png",
//     "assets/applePay.png",
//   ];
//   String currentImage = 'assets/default.png';
//   String? selectedMethod;

//   @override
//   Widget build(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;

//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8),
//         child: Column(
//           children: [
//             // phần trên
//             Expanded(child: Center(child: Image.asset(currentImage))),

//             const Divider(),

//             // phần dưới
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.only(right: 16, left: 16),
//                 child: Column(
//                   children: [
//                     const SizedBox(
//                       height: 12,
//                     ), // thay Padding rỗng bằng SizedBox
//                     TextButton(
//                       onPressed: () {
//                         setState(() {
//                           selectedMethod = 'paypal';
//                           currentImage = 'assets/paypal.png';
//                         });
//                       },
//                       style: TextButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         elevation: 8,
//                         shadowColor: colorScheme.primary,
//                         backgroundColor: colorScheme.surface,
//                         foregroundColor: colorScheme.onSurface,
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               Icon(
//                                 selectedMethod == 'paypal'
//                                     ? Icons.radio_button_checked
//                                     : Icons.radio_button_off,
//                                 color: colorScheme.primary,
//                               ),
//                               const SizedBox(width: 8),
//                               const Text(
//                                 'Paypal',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(16),
//                             child: Image.asset(
//                               'assets/paypal.png',
//                               width: 89,
//                               height: 28,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     //google pay
//                     const SizedBox(
//                       height: 12,
//                     ), // thay Padding rỗng bằng SizedBox
//                     TextButton(
//                       onPressed: () {
//                         setState(() {
//                           selectedMethod = 'googlepay';
//                           currentImage = 'assets/googlePay.png';
//                         });
//                       },
//                       style: TextButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         elevation: 8,
//                         shadowColor: colorScheme.primary,
//                         backgroundColor: colorScheme.surface,
//                         foregroundColor: colorScheme.onSurface,
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               Icon(
//                                 selectedMethod == 'googlepay'
//                                     ? Icons.radio_button_checked
//                                     : Icons.radio_button_off,
//                                 color: colorScheme.primary,
//                               ),
//                               const SizedBox(width: 8),
//                               const Text(
//                                 'GooglePay',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(16),
//                             child: Image.asset(
//                               'assets/googlePay.png',
//                               width: 89,
//                               height: 28,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     //apple pay
//                     const SizedBox(
//                       height: 12,
//                     ), // thay Padding rỗng bằng SizedBox
//                     TextButton(
//                       onPressed: () {
//                         setState(() {
//                           selectedMethod = 'applepay';
//                           currentImage = 'assets/applePay.png';
//                         });
//                       },
//                       style: TextButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         elevation: 8,
//                         shadowColor: colorScheme.primary,
//                         backgroundColor: colorScheme.surface,
//                         foregroundColor: colorScheme.onSurface,
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               Icon(
//                                 selectedMethod == 'applepay'
//                                     ? Icons.radio_button_checked
//                                     : Icons.radio_button_off,
//                                 color: colorScheme.primary,
//                               ),
//                               const SizedBox(width: 8),
//                               const Text(
//                                 'ApplePay',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(16),
//                             child: Image.asset(
//                               'assets/applePay.png',
//                               width: 89,
//                               height: 28,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

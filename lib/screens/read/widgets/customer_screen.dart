// // lib/customer_view.dart
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../../providers/menu_provider.dart';
// import '../../../services/nfc_service.dart';
//
//
// class CustomerView extends StatelessWidget {
//   const CustomerView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final menuItems = Provider.of<MenuProvider>(context).menuItems;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Customer Menu View'),
//       ),
//       body: Column(
//         children: [
//           ElevatedButton(
//             onPressed: () async {
//               await NfcService.readNfc(context);
//             },
//             child: const Text('Read Menu from NFC Tag'),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: menuItems.length,
//               itemBuilder: (context, index) {
//                 final item = menuItems[index];
//                 return Card(
//                   child: ListTile(
//                     leading: item.imageUrl.isNotEmpty
//                         ? Image.network(item.imageUrl, width: 50, height: 50)
//                         : const Icon(Icons.fastfood),
//                     title: Text(item.name),
//                     subtitle:
//                         Text('${item.description}\nPrice: \$${item.price}'),
//                     trailing: item.isAvailable
//                         ? const Text('Available')
//                         : const Text('Not Available'),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:eapp/models/course.dart';
// import 'package:eapp/pages/payment_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class CartPage extends StatelessWidget {
//   const CartPage({super.key});

//   //remove ITEM from cart buttom
//   void removeItemFromCart(BuildContext context, Course course) {
//     // show a dia box to ask to remove from cart
//     showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//               content: Text("Remove this item from your cart?"),
//               actions: [
//                 //cancel button
//                 MaterialButton(
//                   onPressed: () => Navigator.pop(context),
//                   child: Text('Cancel'),
//                 ),

//                 //yes button
//                 MaterialButton(
//                   onPressed: () {
//                     Navigator.pop(context);

//                     //add to cart
//                     context.read<Shop>().removeFromCart(course);
//                   },
//                   child: Text("YES"),
//                 )
//               ],
//             ));
//   }

//   //user pressed pay button
//   void payButtonPressed(BuildContext context) {
//     showDialog(context: context, builder: (context) => PaymentScreen());
//   }

//   @override
//   Widget build(BuildContext context) {
//     //get access to cart
//     final cart = context.watch<Shop>().cart;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         foregroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text("Cart Page"),
//       ),
//       // backgroundColor: Theme.of(context).colorScheme.background,
//       body: Column(
//         children: [
//           //cart list
//           Expanded(
//             child: cart.isEmpty
//                 ? Center(
//                     child: Text("Your cart is empoty"),
//                   )
//                 : ListView.builder(
//                     itemCount: cart.length,
//                     itemBuilder: (context, index) {
//                       //get indi item in cart
//                       final item = cart[index];

//                       //return as a cart tile ui
//                       return ListTile(
//                         title: Text(item.name),
//                         subtitle: Text(item.price.toStringAsFixed(2)),
//                         trailing: IconButton(
//                           icon: Icon(Icons.remove),
//                           onPressed: () => removeItemFromCart(context, item),
//                         ),
//                       );
//                     },
//                   ),
//           ),

//           //pay buttton
//           Padding(
//             padding: EdgeInsets.all(50),
//             child: MaterialButton(
//               color: Colors.white70,
//               onPressed: () => payButtonPressed(context),
//               child: Text("Pay now"),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

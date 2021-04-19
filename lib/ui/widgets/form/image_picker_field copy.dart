// import 'dart:io';

// import 'package:flutter/material.dart';

// class ImagePickerField extends StatelessWidget {
//   final Function onSelectFile;
//   final Function onDelete;
//   final File imageFile;
//   final bool hide;
//   const ImagePickerField({
//     @required this.onSelectFile,
//     @required this.imageFile,
//     @required this.onDelete,
//     this.hide = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedCrossFade(
//       alignment: Alignment.bottomCenter,
//       duration: const Duration(milliseconds: 300),
//       crossFadeState:
//           hide ? CrossFadeState.showFirst : CrossFadeState.showSecond,
//       firstChild: const SizedBox.shrink(),
//       secondChild: GestureDetector(
//         onTap: imageFile == null ? onSelectFile : null,
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeIn,
//           height: imageFile != null ? 120 : 55,
//           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey.shade400),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: imageFile == null
//               ? Row(
//                   children: <Widget>[
//                     Icon(
//                       Icons.image,
//                       color: Colors.grey.shade600,
//                       size: 20,
//                     ),
//                     const SizedBox(width: 20),
//                     Text(
//                       'إضغط هنا لاختيار الصورة ..',
//                       style: TextStyle(color: Colors.grey.shade600),
//                     ),
//                     const Spacer(),
//                     Icon(
//                       Icons.arrow_forward_ios,
//                       color: Colors.grey.shade600,
//                       size: 20,
//                     ),
//                   ],
//                 )
//               : Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Image.file(
//                       imageFile,
//                       fit: BoxFit.contain,
//                       height: 100,
//                       width: 100,
//                     ),
//                     IconButton(
//                       icon: Icon(
//                         Icons.delete,
//                         color: Colors.grey.shade600,
//                       ),
//                       onPressed: onDelete,
//                     ),
//                   ],
//                 ),
//         ),
//       ),
//     );
//   }
// }

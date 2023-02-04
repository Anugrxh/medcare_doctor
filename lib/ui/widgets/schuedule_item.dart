import 'package:flutter/material.dart';

import 'custom_button.dart';

class SchueduleItem extends StatelessWidget {
  const SchueduleItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(15),
      color: const Color(0xFF79B9E0),
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name:',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'D.O.B:',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Sex:',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Last Visit:',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Token No.:',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomButton(
                        onTap: () {},
                        label: "Done",
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CustomButton(
                        label: "History",
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: ((context) => Dialog(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'HISTORY',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3,
                                          ),
                                          SizedBox(
                                            width: 500,
                                            child: Material(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              elevation: 6,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Date:'),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text('prescription:'),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    SizedBox(
                                                      width: 480,
                                                      child: Material(
                                                        color: Colors.white,
                                                        elevation: 1,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  "sbjdfbj 1-0-1"),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Text(
                                                                  "sbjdfbj 0-0-0"),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Text(
                                                                  "sbjdfbj 1-1-1"),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Text(
                                                                  "sbjdfbj 0-0-1"),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Text(
                                                                  "sbjdfbj0-1-1")
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          CustomButton(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            label: "Done",
                                            buttonColor: Colors.lightBlue,
                                          )
                                        ],
                                      ),
                                    ),
                                  )));
                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CustomButton(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                              ),
                              child: SizedBox(
                                width: 600,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 20,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Token Number : ',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text(
                                        'Name : ',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                          labelText:
                                              'Type Medicine Details Here...',
                                          border: InputBorder.none,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: CustomButton(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          label: 'Done',
                                          buttonColor: const Color(0xFF79B9E0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        label: "Done",
                        isIconButton: true,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
//               Row(
//                 children: const [
//                   Text(
//                     'Name:',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 children: const [
//                   Text(
//                     'Age:',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                 ],
//               ),
//              const SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 children: const [
//                   Text(
//                     'Sex',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                 ],
//               ),
//                const SizedBox(
//                 height: 10,
//               ),
//                Row(
//                 children: const [
//                   Text(
//                     'Last Visit',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                 ],
//               ),
//              const SizedBox(
//                 height: 10,
//               ),
//                Row(
//                 children: const [
//                   Text(
//                     'Token No.:',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                 ],
//               ),
//              const SizedBox(
//                 height: 10,
//               ),
//               Row(
                
//                 children: [
//                   const Expanded(
//                     child: Text(
//                       'User ID:',
//                       style: TextStyle(color: Colors.black),
//                     ),
//                   ),
//                   CustomButton(
//                     onTap: () {},
//                     label: 'Done',
//                   ),
//                   const SizedBox(
//                     width: 20,
//                   ),
//                   CustomButton(
//                     isIconButton: true,
//                     onTap: () {
//                       showDialog(
//                         context: context,
//                         builder: (context) => Dialog(
//                           backgroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(
//                               20,
//                             ),
//                           ),
//                           child: SizedBox(
//                             width: 600,
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 20,
//                                 vertical: 20,
//                               ),
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const Text(
//                                     'Token Number : ',
//                                     style: TextStyle(color: Colors.black),
//                                   ),
//                                   const SizedBox(
//                                     height: 20,
//                                   ),
//                                   const Text(
//                                     'Name : ',
//                                     style: TextStyle(color: Colors.black),
//                                   ),
//                                   const SizedBox(
//                                     height: 20,
//                                   ),
//                                   TextFormField(
//                                     decoration: const InputDecoration(
//                                       labelText:
//                                           'Type Medicine Details Here...',
//                                       border: InputBorder.none,
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     height: 20,
//                                   ),
//                                   Align(
//                                     alignment: Alignment.bottomRight,
//                                     child: CustomButton(
//                                       onTap: () {
//                                         Navigator.pop(context);
//                                       },
//                                       label: 'Done',
//                                       buttonColor: const Color(0xFF79B9E0),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
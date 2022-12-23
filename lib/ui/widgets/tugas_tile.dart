import 'package:e_school/main.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../shared/theme.dart';
import 'package:iconsax/iconsax.dart';
import 'package:dotted_border/dotted_border.dart';

class TugasTile extends StatefulWidget {
  final matpel;
  final backgroundColor;
  final icon;
  final subTitle;
  final deadline;
  final tgglDitugaskan;

  const TugasTile(
      {super.key,
      required this.matpel,
      required this.backgroundColor,
      required this.icon,
      required this.subTitle,
      this.deadline = 'Due, 04/12/2022, 23:59 PM',
      this.tgglDitugaskan = '23/11/2022'});

  @override
  State<TugasTile> createState() => _TugasTileState();
}

class _TugasTileState extends State<TugasTile> {
  void openFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: ((context) {
                return Container(
                  color: kTextWhite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          'Lihat Soal',
                          style: kBlackTextStyleNotoSans.copyWith(
                              fontSize: 20, fontWeight: bold),
                        ),
                      ),
                      //! Button Soal
                      Container(
                        margin: EdgeInsets.all(15),
                        width: double.infinity,
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '');
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: kBluePrimary,
                          ),
                          child: Text('Klik di sini',
                              style: kWhiteTextStyleRoboto.copyWith(
                                  fontSize: 20, fontWeight: bold)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          'Kirim Tugas',
                          style: kBlackTextStyleNotoSans.copyWith(
                              fontSize: 20, fontWeight: bold),
                        ),
                      ),
                      //! Submit Soal
                      GestureDetector(
                        onTap: () => openFiles(),
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 20.0),
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: Radius.circular(10),
                              dashPattern: [10, 4],
                              strokeCap: StrokeCap.round,
                              color: Colors.blue.shade400,
                              child: Container(
                                width: double.infinity,
                                height: 150,
                                decoration: BoxDecoration(
                                    color: Colors.blue.shade50.withOpacity(.3),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Iconsax.folder_open,
                                      color: Colors.blue,
                                      size: 40,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'Pilih file \n (PDF atau docx)',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey.shade400),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                      //! Button Submit
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 40, right: 40),
                        width: double.infinity,
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '');
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: kBluePrimary,
                          ),
                          child: Text('SUBMIT',
                              style: kWhiteTextStyleRoboto.copyWith(
                                  fontSize: 20, fontWeight: bold)),
                        ),
                      ),
                    ],
                  ),
                );
              }));
        },
        child: Container(
          margin: EdgeInsets.only(top: 25, left: 12, right: 12),
          height: 100,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: kTextWhite,
            boxShadow: kElevationToShadow[3],
          ),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: widget.backgroundColor,
                    image: DecorationImage(image: AssetImage(widget.icon))),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //?Title Atas
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            Text(
                              widget.matpel,
                              style: kBlackTextStyleNotoSans.copyWith(
                                  fontSize: 20, fontWeight: regular),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 3,
                    ),
                    //? Title tengah
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        widget.subTitle,
                        style: kBlackTextStyleRoboto.copyWith(
                            fontSize: 12, fontWeight: light),
                      ),
                    ),
                    //? Title DL
                    Container(
                      margin: EdgeInsets.only(top: 8, left: 10),
                      child: Column(
                        children: [
                          Text(widget.deadline,
                              style: kRedTextStyleRoboto.copyWith(
                                  fontSize: 12, fontWeight: light))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(children: [
                  Text(
                    widget.tgglDitugaskan,
                    style: kBlackTextStyleRoboto.copyWith(
                        fontSize: 12, fontWeight: light),
                  ),
                ]),
              )
            ],
          ),
        ));
  }
}

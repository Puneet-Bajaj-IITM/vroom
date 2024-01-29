import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../functions/functions.dart';
import '../../styles/styles.dart';
import '../../translations/translation.dart';
import '../../widgets/widgets.dart';
import 'login.dart';

class NamePage extends StatefulWidget {
  const NamePage({Key? key}) : super(key: key);

  @override
  State<NamePage> createState() => _NamePageState();
}

String name = ''; //name of user
String email = ''; // email of user
String _error = '';
dynamic proImageFile1;
bool isverifyemail = false;

class _NamePageState extends State<NamePage> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController controller = TextEditingController();
  TextEditingController emailtext = TextEditingController();

  @override
  void initState() {
    _error = '';
    firstname.text = '';
    lastname.text = '';
    emailtext.text = '';
    if (isloginemail == true) {
      emailtext.text = email;
    }
    super.initState();
  }

  showToast() {
    setState(() {
      showtoast = true;
    });
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        showtoast = false;
      });
    });
  }

  bool showtoast = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Material(
      color: page,
      child: Directionality(
        textDirection: (languageDirection == 'rtl')
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: media.height * 0.02),
                        MyText(
                          text: languages[choosenLanguage]['text_your_name'],
                          size: media.width * twenty,
                          fontweight: FontWeight.bold,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: media.width * 0.9,
                          child: MyText(
                            text: languages[choosenLanguage]['text_prob_name'],
                            size: media.width * twelve,
                            color: textColor.withOpacity(0.5),
                            fontweight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: media.width * 0.13,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: textColor),
                                ),
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: TextField(
                                  controller: firstname,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: languages[choosenLanguage]
                                          ['text_first_name'],
                                      hintStyle: TextStyle(
                                          color: textColor.withOpacity(0.3))),
                                  style: choosenLanguage == 'ar'
                                      ? GoogleFonts.cairo(
                                          fontSize: media.width * fourteen,
                                          fontWeight: FontWeight.normal,
                                          color: textColor,
                                          letterSpacing: 1)
                                      : GoogleFonts.poppins(
                                          fontSize: media.width * fourteen,
                                          fontWeight: FontWeight.normal,
                                          color: textColor,
                                          letterSpacing: 1),
                                  onChanged: (val) {
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: media.height * 0.02,
                            ),
                            Expanded(
                              child: Container(
                                height: media.width * 0.13,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: textColor),
                                ),
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: TextField(
                                  controller: lastname,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: languages[choosenLanguage]
                                          ['text_last_name'],
                                      hintStyle: TextStyle(
                                          color: textColor.withOpacity(0.3))),
                                  style: choosenLanguage == 'ar'
                                      ? GoogleFonts.cairo(
                                          fontSize: media.width * fourteen,
                                          fontWeight: FontWeight.normal,
                                          color: textColor,
                                          letterSpacing: 1)
                                      : GoogleFonts.poppins(
                                          fontSize: media.width * fourteen,
                                          fontWeight: FontWeight.normal,
                                          color: textColor,
                                          letterSpacing: 1),
                                  onChanged: (val) {
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: media.height * 0.02,
                        ),
                        Container(
                          height: media.width * 0.13,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: textColor),
                          ),
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: TextField(
                            controller: emailtext,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: languages[choosenLanguage]
                                    ['text_enter_email'],
                                hintStyle: TextStyle(
                                    color: textColor.withOpacity(0.3))),
                            readOnly: (isloginemail == true) ? true : false,
                            style: choosenLanguage == 'ar'
                                ? GoogleFonts.cairo(
                                    fontSize: media.width * fourteen,
                                    fontWeight: FontWeight.normal,
                                    color: textColor,
                                    letterSpacing: 1)
                                : GoogleFonts.poppins(
                                    fontSize: media.width * fourteen,
                                    fontWeight: FontWeight.normal,
                                    color: textColor,
                                    letterSpacing: 1),
                            onChanged: (val) {
                              setState(() {});
                            },
                          ),
                        ),
                        SizedBox(
                          height: media.width * 0.05,
                        ),
                        (isloginemail == true)
                            ? Container(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                height: 55,
                                width: media.width * 0.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: textColor),
                                ),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        if (countries.isNotEmpty) {
                                          //dialod box for select country for dial code
                                          await showDialog(
                                              context: context,
                                              builder: (context) {
                                                var searchVal = '';
                                                return AlertDialog(
                                                  backgroundColor: page,
                                                  insetPadding:
                                                      const EdgeInsets.all(10),
                                                  content: StatefulBuilder(
                                                      builder:
                                                          (context, setState) {
                                                    return Container(
                                                      width: media.width * 0.9,
                                                      color: page,
                                                      child: Directionality(
                                                        textDirection:
                                                            (languageDirection ==
                                                                    'rtl')
                                                                ? TextDirection
                                                                    .rtl
                                                                : TextDirection
                                                                    .ltr,
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 20,
                                                                      right:
                                                                          20),
                                                              height: 40,
                                                              width:
                                                                  media.width *
                                                                      0.9,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .grey,
                                                                      width:
                                                                          1.5)),
                                                              child: TextField(
                                                                decoration: InputDecoration(
                                                                    contentPadding: (languageDirection ==
                                                                            'rtl')
                                                                        ? EdgeInsets.only(
                                                                            bottom: media.width *
                                                                                0.035)
                                                                        : EdgeInsets.only(
                                                                            bottom: media.width *
                                                                                0.04),
                                                                    border:
                                                                        InputBorder
                                                                            .none,
                                                                    hintText:
                                                                        languages[choosenLanguage][
                                                                            'text_search'],
                                                                    hintStyle: GoogleFonts.poppins(
                                                                        fontSize: media.width *
                                                                            sixteen,
                                                                        color:
                                                                            hintColor)),
                                                                style: GoogleFonts.poppins(
                                                                    fontSize: media
                                                                            .width *
                                                                        sixteen,
                                                                    color:
                                                                        textColor),
                                                                onChanged:
                                                                    (val) {
                                                                  setState(() {
                                                                    searchVal =
                                                                        val;
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 20),
                                                            Expanded(
                                                              child:
                                                                  SingleChildScrollView(
                                                                child: Column(
                                                                  children: countries
                                                                      .asMap()
                                                                      .map((i, value) {
                                                                        return MapEntry(
                                                                            i,
                                                                            SizedBox(
                                                                              width: media.width * 0.9,
                                                                              child: (searchVal == '' && countries[i]['flag'] != null)
                                                                                  ? InkWell(
                                                                                      onTap: () {
                                                                                        setState(() {
                                                                                          phcode = i;
                                                                                        });
                                                                                        Navigator.pop(context);
                                                                                      },
                                                                                      child: Container(
                                                                                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                                                                                        color: page,
                                                                                        child: Row(
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Row(
                                                                                              children: [
                                                                                                Image.network(countries[i]['flag']),
                                                                                                SizedBox(
                                                                                                  width: media.width * 0.02,
                                                                                                ),
                                                                                                SizedBox(
                                                                                                  width: media.width * 0.4,
                                                                                                  child: MyText(
                                                                                                    text: countries[i]['name'],
                                                                                                    size: media.width * sixteen,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            MyText(text: countries[i]['dial_code'], size: media.width * sixteen)
                                                                                          ],
                                                                                        ),
                                                                                      ))
                                                                                  : (countries[i]['flag'] != null && countries[i]['name'].toLowerCase().contains(searchVal.toLowerCase()))
                                                                                      ? InkWell(
                                                                                          onTap: () {
                                                                                            setState(() {
                                                                                              phcode = i;
                                                                                            });
                                                                                            Navigator.pop(context);
                                                                                          },
                                                                                          child: Container(
                                                                                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                                                                                            color: page,
                                                                                            child: Row(
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Row(
                                                                                                  children: [
                                                                                                    Image.network(countries[i]['flag']),
                                                                                                    SizedBox(
                                                                                                      width: media.width * 0.02,
                                                                                                    ),
                                                                                                    SizedBox(
                                                                                                      width: media.width * 0.4,
                                                                                                      child: MyText(text: countries[i]['name'], size: media.width * sixteen),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                                MyText(text: countries[i]['dial_code'], size: media.width * sixteen)
                                                                                              ],
                                                                                            ),
                                                                                          ))
                                                                                      : Container(),
                                                                            ));
                                                                      })
                                                                      .values
                                                                      .toList(),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                );
                                              });
                                        } else {
                                          getCountryCode();
                                        }
                                        setState(() {});
                                      },
                                      //input field
                                      child: Container(
                                        height: 50,
                                        alignment: Alignment.center,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.network(
                                                countries[phcode]['flag']),
                                            SizedBox(
                                              width: media.width * 0.02,
                                            ),
                                            const SizedBox(
                                              width: 2,
                                            ),
                                            Icon(
                                              Icons.arrow_drop_down,
                                              size: 28,
                                              color: textColor,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Container(
                                      width: 1,
                                      height: 55,
                                      color: underline,
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.bottomCenter,
                                        height: 50,
                                        child: TextFormField(
                                          textAlign: TextAlign.start,
                                          controller: controller,
                                          onChanged: (val) {
                                            setState(() {
                                              phnumber = controller.text;
                                            });
                                            if (controller.text.length ==
                                                countries[phcode]
                                                    ['dial_max_length']) {
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            }
                                          },
                                          maxLength: countries[phcode]
                                              ['dial_max_length'],
                                          style: choosenLanguage == 'ar'
                                              ? GoogleFonts.cairo(
                                                  color: textColor,
                                                  fontSize:
                                                      media.width * sixteen,
                                                  letterSpacing: 1)
                                              : GoogleFonts.poppins(
                                                  color: textColor,
                                                  fontSize:
                                                      media.width * sixteen,
                                                  letterSpacing: 1),
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            counterText: '',
                                            prefixIcon: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 12),
                                              child: MyText(
                                                text: countries[phcode]
                                                        ['dial_code']
                                                    .toString(),
                                                size: media.width * sixteen,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            hintStyle: choosenLanguage == 'ar'
                                                ? GoogleFonts.cairo(
                                                    color: textColor
                                                        .withOpacity(0.7),
                                                    fontSize:
                                                        media.width * sixteen,
                                                  )
                                                : GoogleFonts.poppins(
                                                    color: textColor
                                                        .withOpacity(0.7),
                                                    fontSize:
                                                        media.width * sixteen,
                                                  ),
                                            border: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : Container(),
                        SizedBox(
                          height: media.height * 0.02,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (_error != '')
                  Column(
                    children: [
                      SizedBox(
                          width: media.width * 0.9,
                          child: MyText(
                            text: _error,
                            color: Colors.red,
                            size: media.width * fourteen,
                            textAlign: TextAlign.center,
                          )),
                      SizedBox(
                        height: media.width * 0.025,
                      )
                    ],
                  ),
                (isloginemail == false)
                    ? Column(
                        children: [
                          Button(
                              onTap: () async {
                                if (firstname.text.isNotEmpty &&
                                    emailtext.text.isNotEmpty) {
                                  loginLoading = true;
                                  valueNotifierLogin.incrementNotifier();
                                  String pattern =
                                      r"^[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?\.)+[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])*$";
                                  RegExp regex = RegExp(pattern);
                                  if (regex.hasMatch(emailtext.text)) {
                                    name = '${firstname.text} ${lastname.text}';
                                    email = emailtext.text;
                                    setState(() {
                                      _error = '';
                                    });
                                    FocusScope.of(context).unfocus();
                                    var result = await validateEmail();
                                    if (result == 'success') {
                                      isverifyemail = true;
                                      currentPage = 3;
                                    } else {
                                      setState(() {
                                        _error = result.toString();
                                      });
                                    }
                                  } else {
                                    setState(() {
                                      _error = languages[choosenLanguage]
                                          ['text_email_validation'];
                                    });
                                  }
                                }

                                loginLoading = false;
                                valueNotifierLogin.incrementNotifier();
                              },
                              color: (firstname.text.isNotEmpty &&
                                      emailtext.text.isNotEmpty)
                                  ? buttonColor
                                  : Colors.grey,
                              text: languages[choosenLanguage]['text_next'])
                        ],
                      )
                    : Container(
                        width: media.width * 1 - media.width * 0.08,
                        alignment: Alignment.center,
                        child: Button(
                          onTap: () async {
                            if (firstname.text.isNotEmpty &&
                                controller.text.length >=
                                    countries[phcode]['dial_min_length']) {
                              FocusManager.instance.primaryFocus?.unfocus();
                              name = '${firstname.text} ${lastname.text}';
                              email = emailtext.text;
                              loginLoading = true;
                              valueNotifierLogin.incrementNotifier();
                              var val = await otpCall();
                              if (val.value == true) {
                                phoneAuthCheck = true;
                                await phoneAuth(
                                    countries[phcode]['dial_code'] + phnumber);
                                value = 0;
                                currentPage = 3;
                              } else {
                                isloginemail = true;
                                isverifyemail = true;
                                phoneAuthCheck = false;
                                currentPage = 1;
                              }
                              loginLoading = false;
                              valueNotifierLogin.incrementNotifier();
                            }
                          },
                          color: (firstname.text.isNotEmpty &&
                                  controller.text.length >=
                                      countries[phcode]['dial_min_length'])
                              ? buttonColor
                              : Colors.grey,
                          text: languages[choosenLanguage]['text_next'],
                        ),
                      ),
                const SizedBox(
                  height: 25,
                )
              ],
            ),
            //display toast
            (showtoast == true)
                ? Positioned(
                    bottom: media.width * 0.1,
                    left: media.width * 0.06,
                    right: media.width * 0.06,
                    child: Container(
                      padding: EdgeInsets.all(media.width * 0.04),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2.0,
                                spreadRadius: 2.0,
                                color: Colors.black.withOpacity(0.2))
                          ],
                          color: verifyDeclined),
                      child: Text(
                        _error,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: media.width * fourteen,
                            fontWeight: FontWeight.w600,
                            color: textColor),
                      ),
                    ))
                : Container()
          ],
        ),
      ),
    );
  }
}

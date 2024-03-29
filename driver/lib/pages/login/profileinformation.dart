import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../../functions/functions.dart';
import '../../styles/styles.dart';
import '../../translation/translation.dart';
import '../../widgets/widgets.dart';
import '../loadingPage/loading.dart';
import 'carinformation.dart';
import 'login.dart';
import 'namepage.dart';
import 'requiredinformation.dart';

// ignore: must_be_immutable
class ProfileInformation extends StatefulWidget {
  dynamic from;
  ProfileInformation({Key? key, this.from}) : super(key: key);

  @override
  State<ProfileInformation> createState() => _ProfileInformationState();
}

class _ProfileInformationState extends State<ProfileInformation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  TextEditingController firstname = TextEditingController();
  TextEditingController emailText = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController pinText = TextEditingController();
  bool _isLoading = true;
  bool chooseWorkArea = false;
  String _error = '';
  String _otperror = '';
  bool getOtp = false;

  @override
  void initState() {
    countryCode();
    // getServiceLoc();
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  countryCode() async {
    if (widget.from == null) {
      firstname.text = name.toString().split(' ')[0];
      lastname.text = name.toString().split(' ')[1];
      mobile.text = phnumber;
      emailText.text = email;
    } else {
      firstname.text = userDetails['name'].toString().split(' ')[0];
      lastname.text = (userDetails['name'].toString().split(' ').length > 1)
          ? userDetails['name'].toString().split(' ')[1]
          : '';
      mobile.text = userDetails['mobile'];
      emailText.text = userDetails['email'];
    }
    _isLoading = false;
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Material(
      child: Directionality(
        textDirection: (languageDirection == 'rtl')
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: media.width * 0.05, right: media.width * 0.05),
              height: media.height * 1,
              width: media.width * 1,
              color: page,
              child: Column(
                children: [
                  SizedBox(
                    height:
                        media.width * 0.05 + MediaQuery.of(context).padding.top,
                  ),
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: media.width * 0.05),
                        width: media.width * 1,
                        alignment: Alignment.center,
                        child: MyText(
                            text: languages[choosenLanguage]['text_reqinfo'],
                            size: media.width * sixteen),
                      ),
                      Positioned(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.arrow_back_ios,
                                    color: textColor)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            width: media.width * 0.9,
                            child: MyText(
                              text: languages[choosenLanguage]
                                      ['text_profile_info']
                                  .toString()
                                  .toUpperCase(),
                              size: media.width * fourteen,
                              fontweight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: media.width * 0.05,
                          ),
                          SizedBox(
                            width: media.width * 0.9,
                            child: MyText(
                              text: languages[choosenLanguage]['text_name'],
                              size: media.width * sixteen,
                              fontweight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: media.width * 0.05,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                    height: media.width * 0.13,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: (isDarkTheme == true)
                                                ? textColor.withOpacity(0.4)
                                                : underline),
                                        color: (isDarkTheme == true)
                                            ? Colors.black
                                            : const Color(0xffF8F8F8)),
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: MyTextField(
                                      textController: firstname,
                                      hinttext: languages[choosenLanguage]
                                          ['text_first_name'],
                                      onTap: (val) {
                                        setState(() {});
                                      },
                                      readonly:
                                          (widget.from == null) ? true : false,
                                    )),
                              ),
                              SizedBox(
                                width: media.height * 0.02,
                              ),
                              Expanded(
                                child: Container(
                                    height: media.width * 0.13,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: (isDarkTheme == true)
                                                ? textColor.withOpacity(0.4)
                                                : underline),
                                        color: (isDarkTheme == true)
                                            ? Colors.black
                                            : const Color(0xffF8F8F8)),
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: MyTextField(
                                      textController: lastname,
                                      hinttext: languages[choosenLanguage]
                                          ['text_last_name'],
                                      onTap: (val) {
                                        setState(() {});
                                      },
                                      readonly:
                                          (widget.from == null) ? true : false,
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: media.height * 0.02,
                          ),
                          SizedBox(
                            width: media.width * 0.9,
                            child: MyText(
                              text: languages[choosenLanguage]['text_mob_num'],
                              size: media.width * sixteen,
                              fontweight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: media.height * 0.02,
                          ),
                          Container(
                            height: media.width * 0.13,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: (isDarkTheme == true)
                                        ? textColor.withOpacity(0.4)
                                        : underline),
                                color: (isDarkTheme == true)
                                    ? Colors.black
                                    : const Color(0xffF8F8F8)),
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: MyTextField(
                              textController: mobile,
                              hinttext: languages[choosenLanguage]
                                  ['text_enter_phone_number'],
                              // prefixtext: '+962',
                              onTap: (val) {
                                setState(() {});
                              },
                            ),
                          ),
                          SizedBox(
                            height: media.height * 0.02,
                          ),
                          SizedBox(
                            width: media.width * 0.9,
                            child: MyText(
                              text: languages[choosenLanguage]['text_email'],
                              size: media.width * sixteen,
                              fontweight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: media.height * 0.02,
                          ),
                          Container(
                              height: media.width * 0.13,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: (isDarkTheme == true)
                                          ? textColor.withOpacity(0.4)
                                          : underline),
                                  color: (isDarkTheme == true)
                                      ? Colors.black
                                      : const Color(0xffF8F8F8)),
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: MyTextField(
                                textController: emailText,
                                hinttext: languages[choosenLanguage]
                                    ['text_enter_email'],
                                onTap: (val) {
                                  setState(() {});
                                },
                              )),
                        ],
                      ),
                    ),
                  ),
                  if (_error != '')
                    Container(
                      width: media.width * 0.9,
                      padding: EdgeInsets.only(
                          top: media.width * 0.02, bottom: media.width * 0.02),
                      child: MyText(
                        text: _error,
                        size: media.width * twelve,
                        color: Colors.red,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  Button(
                      onTap: () async {
                        setState(() {
                          _error = '';
                        });
                        String pattern =
                            r"^[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?\.)+[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])*$";

                        RegExp regex = RegExp(pattern);
                        if (regex.hasMatch(emailText.text)) {
                          if (widget.from == null) {
                            if (myServiceId != '' && myServiceId != null) {
                              profileCompleted = true;
                              Navigator.pop(context, true);
                            }
                          } else {
                            setState(() {
                              _isLoading = true;
                            });
                            // ignore: prefer_typing_uninitialized_variables
                            var nav;
                            if (userDetails['mobile'] == mobile.text) {
                              // print('started');
                              nav = await updateProfile(
                                '${firstname.text} ${lastname.text}',
                                emailText.text,
                                // userDetails['mobile']
                              );
                              if (nav != 'success') {
                                _error = nav.toString();
                              } else {
                                // ignore: use_build_context_synchronously
                                Navigator.pop(context, true);
                              }
                            } else {
                              await phoneAuth(mobile.text);
                              setState(() {
                                getOtp = true;
                              });
                            }

                            setState(() {
                              _isLoading = false;
                            });
                          }
                        } else {
                          setState(() {
                            _error = languages[choosenLanguage]
                                ['text_email_validation'];
                          });
                        }
                      },
                      text: languages[choosenLanguage]['text_confirm']),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            if (getOtp == true)
              Positioned(
                  child: Container(
                height: media.height * 1,
                width: media.width * 1,
                color: Colors.transparent.withOpacity(0.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: media.width * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                getOtp = false;
                              });
                            },
                            child: Container(
                              height: media.width * 0.1,
                              width: media.width * 0.1,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: page),
                              child:
                                  Icon(Icons.cancel_outlined, color: textColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: media.width * 0.025,
                    ),
                    Container(
                      width: media.width * 0.9,
                      padding: EdgeInsets.all(media.width * 0.05),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12), color: page),
                      child: Column(
                        children: [
                          SizedBox(
                            width: media.width * 0.8,
                            child: MyText(
                              text:
                                  '${languages[choosenLanguage]['text_enter_otp']}${mobile.text}',
                              size: media.width * fourteen,
                              fontweight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: media.width * 0.025,
                          ),
                          SizedBox(
                            width: media.width * 0.8,
                            child: Pinput(
                              length: 6,
                              onChanged: (val) {
                                // print(val);
                              },
                              // onSubmitted: (String val) {},
                              controller: pinText,
                            ),
                          ),
                          if (_otperror != '')
                            SizedBox(
                              height: media.width * 0.05,
                            ),
                          Container(
                            width: media.width * 0.8,
                            padding:
                                EdgeInsets.only(bottom: media.width * 0.025),
                            child: MyText(
                              text: _otperror,
                              size: media.width * twelve,
                              color: Colors.red,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Button(
                              onTap: () async {
                                if (pinText.text.length == 6) {
                                  setState(() {
                                    _otperror = '';
                                    _isLoading = true;
                                  });
                                  try {
                                    PhoneAuthCredential credential =
                                        PhoneAuthProvider.credential(
                                            verificationId: verId,
                                            smsCode: pinText.text);

                                    // Sign the user in (or link) with the credential
                                    await FirebaseAuth.instance
                                        .signInWithCredential(credential);
                                    await updateProfile(
                                      '${firstname.text} ${lastname.text}',
                                      emailText.text,
                                      // mobile.text
                                    );
                                    // navigate(verify);
                                  } on FirebaseAuthException catch (error) {
                                    if (error.code ==
                                        'invalid-verification-code') {
                                      setState(() {
                                        pinText.clear();
                                        _otperror = languages[choosenLanguage]
                                            ['text_otp_error'];
                                      });
                                    }
                                  }
                                  setState(() {
                                    pinText.clear();
                                    getOtp = false;
                                    _isLoading = false;
                                  });
                                } else {
                                  phoneAuth(mobile.text);
                                }
                              },
                              text: (pinText.text.length == 6)
                                  ? languages[choosenLanguage]['text_confirm']
                                  : languages[choosenLanguage]
                                      ['text_resend_code']),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).viewInsets.bottom,
                    )
                  ],
                ),
              )),
            if (_isLoading == true) const Positioned(child: Loading())
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tesst/account_created.dart';
import 'package:tesst/models/api.dart';
import 'package:tesst/tools/sizes.dart';
import 'package:tesst/ui_utils/utils.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _phoneNo;
  String? _username;
  String? _referral;
  String? _password;
  String? _confirmPassword;
  StepsApi steps = StepsApi();

  final _basicInfoKey = GlobalKey<FormState>();
  final _usernameKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  int _currentStep = 0;
  Set<int> _completedSteps = {};
  final List<String> _steps = ["Basic Info", "Username", "Password"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('assets/logo.png',height: 7.pW,),
        actions: [
          TextButton(
              onPressed: (){},
              child: Text('Sign in',
                style: TextStyle(
                    color: Colors.lightBlue
                ),
              )
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text('Let’s get you started',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            1.gap,
            Center(
              child: SizedBox(
                width: 70.pW,
                child: Text('Enter your details and create a password to set up your account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ),
            ),
            1.5.gap,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(_steps.length, (index) {
                return _containerInfo(
                    _steps[index],
                    index,
                  onTap: () {
                    bool canProceed = true;

                    if (_currentStep == 0) {
                      canProceed = _basicInfoKey.currentState?.validate() ?? false;
                    } else if (_currentStep == 1) {
                      canProceed = _usernameKey.currentState?.validate() ?? false;
                    } else if (_currentStep == 2) {
                      canProceed = _passwordKey.currentState?.validate() ?? false;
                    }

                    if (canProceed) {
                      setState(() {
                        _completedSteps.add(_currentStep);
                        _currentStep = index;
                      });
                    }
                  },
                );
              }),
            ),
            2.gap,
            Expanded(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(0.1, 0),
                        end: Offset(0, 0),
                      ).animate(animation),
                      child: child,
                    ),
                  );
                },
                child: _buildStepForm(),
              ),
            ),

           SizedBox(
              height: 11.5.pW,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(_currentStep == 2?Color(0xFF1F3669):Color(0xFF1F3669).withOpacity(0.3)),
                      shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9)
                          )
                      )
                  ),
                  onPressed:()async{
                    if(_password != null){
                      if (_passwordKey.currentState!.validate()) {
                        if(_password == _confirmPassword){
                          try {
                            final stepOneRes = await steps.registerStepOne(
                              lastName: _lastName!,
                              firstName: _firstName!,
                              phoneNumber: _phoneNo!,
                              email: _email!,
                            );
                            print('access tokennnn ${stepOneRes['data']['access_token']}');
                            if (stepOneRes['status'] == 'true') {
                              final stepTwoRes = await steps.registerStepTwo(
                                username: _username!,
                                password: _password!,
                                confirmPassword: _confirmPassword!,
                                referral: _referral!,
                                accessToken: stepOneRes['data']['access_token']
                              );

                              if (stepTwoRes['status'] == 'true') {
                               Navigator.push(context, MaterialPageRoute(builder: (context){
                                 return AccountCreated();
                               }));
                              } else {
                                UiUtils.showSnackBar(context, stepTwoRes['data']['error']['username'][0]);
                              }
                            } else {
                              UiUtils.showSnackBar(context, stepOneRes['data']['error']['email'][0]);
                            }
                          } catch (e) {
                            // Handle exceptions
                            print("Error: $e");
                          }
                        }else{
                          UiUtils.showSnackBar(context, 'Password does not match');
                        }
                      }
                    }
                  },
                  child: Center(
                    child: Text('Continue',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  )
              )
            ),
            4.gap,

          ],
        ),
      ),
    );
  }
  Widget _containerInfo(String label, int stepIndex, {VoidCallback? onTap}) {
    bool isActive = _currentStep == stepIndex;
    bool isCompleted = _completedSteps.contains(stepIndex);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: (isActive || isCompleted) ? Color(0xFF1F3669) : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: (isActive || isCompleted) ? Color(0xFF1F3669) : Colors.grey.shade400,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                color: (isActive || isCompleted) ? Colors.white : Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (isCompleted)
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Icon(Icons.check, color: Colors.white, size: 16),
              ),
          ],
        ),
      ),
    );
  }
  Widget _buildStepForm() {
    switch (_currentStep) {
      case 0:
        return _basicInfoForm();
      case 1:
        return _usernameForm();
      case 2:
        return _passwordForm();
      default:
        return Container();
    }
  }

  Widget _basicInfoForm() {
    return Form(
      key: _basicInfoKey,
      child: Column(
        key: ValueKey(0),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _text('First Name'),
          _infoTextField(
            onChanged: (v) => _firstName = v,
            validator: (v) => v == null || v.isEmpty ? 'First name is required' : null,
          ),
          0.1.gap,
          _text('Last Name'),
          _infoTextField(
            onChanged: (v) => _lastName = v,
            validator: (v) => v == null || v.isEmpty ? 'Last name is required' : null,
          ),
          0.1.gap,
          _text('Email'),
          _infoTextField(
            onChanged: (v) => _email = v,
            validator: (v) => v == null || v.isEmpty ? 'Email is required' : null,
          ),
          0.1.gap,
          _text('Phone Number'),
          _infoTextField(
            onChanged: (v) => _phoneNo = v,
            validator: (v) => v == null || v.isEmpty ? 'Phone number is required' : null,
          ),
        ],
      ),
    );
  }


  Widget _usernameForm() {
    return Form(
      key: _usernameKey,
      child: Column(
        key: ValueKey(1),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _text('Username'),
          _infoTextField(
            onChanged: (v) => _username = v,
            validator: (v) => v == null || v.isEmpty ? 'Username is required' : null,
          ),
          0.1.gap,
          _text('Referral code'),
          _infoTextField(
            onChanged: (v) => _referral = v,
            validator: (v) => v == null || v.isEmpty ? 'Referral code is required' : null,
          ),
        ],
      ),
    );
  }

  Widget _passwordForm() {
    return Form(
      key: _passwordKey,
      child: Column(
        key: ValueKey(2),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _text('Password'),
          _infoTextField(
            onChanged: (v) => _password = v,
            validator: (v) => v == null || v.isEmpty ? 'Password is required' : null,
          ),
          0.1.gap,
          _text('Confirm Password'),
          _infoTextField(
            onChanged: (v) => _confirmPassword = v,
            validator: (v) => v == null || v.isEmpty ? 'Please confirm password' : null,
            onTapOutside: (v){
              if(_password != _confirmPassword){
                UiUtils.showSnackBar(context, 'Password does not match');
              }
            }
          ),
        ],
      ),
    );
  }

  Widget _infoTextField({
    String? hint,
    Function(String)? onChanged,
    String? Function(String?)? validator,
    TapRegionCallback? onTapOutside
  }) {
    return SizedBox(
      height: 15.5.pW,
      child: TextFormField(
        onTapOutside: onTapOutside,
        onChanged: onChanged,
        validator: validator,
        style: TextStyle(fontSize: 12.5),
        decoration: InputDecoration(
          errorStyle: TextStyle(fontSize: 12.5),
          helperText: '',
          hintText: hint ?? '',
          hintStyle: TextStyle(
            fontSize: 12,
            height: 1.5,
            fontWeight: FontWeight.normal,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
        ),
      ),
    );
  }
  Widget _text(String data){
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(data,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600
      ),
      ),
    );
  }
}

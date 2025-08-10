import 'package:flutter/material.dart';
import 'package:tesst/tools/sizes.dart';

class AccountCreated extends StatelessWidget {
  const AccountCreated({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Center(
          child: Column(
            children: [
              12.gap,
              CircleAvatar(
                radius: 6.pW,
                backgroundColor: Color(0xFF009EEA),
                child: Center(
                  child: Icon(Icons.check, color: Colors.white,),
                ),
              ),
              1.gap,
              Text('Account Created',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19
              ),
              ),
              1.gap,
              SizedBox(
                width: 65.pW,
                child: Text('Congratulations! Your Niklaar account has successfully been created.',
                textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w700
                  ),

                ),
              ),
              Expanded(child: Container()),
              SizedBox(
                height: 11.5.pW,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll( Color(0xFF1F3669)),
                        shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9)
                            )
                        )
                    ),
                    onPressed: () {},
                    child: Center(
                      child: Text('Continue',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    )
                ),
              ),
              4.gap,
            ],
          ),
        ),
      ),
    );
  }
}

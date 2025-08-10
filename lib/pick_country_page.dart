import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:tesst/signup.dart';
import 'package:tesst/tools/sizes.dart';

class PickCountryPage extends StatefulWidget {
  const PickCountryPage({super.key});

  @override
  State<PickCountryPage> createState() => _PickCountryPageState();
}

class _PickCountryPageState extends State<PickCountryPage> {
  String? _country;
  List<dynamic> _jsonCountryResult = [];
  List<CountryData>? _countryDataList;
  bool _showButton = true;
  bool _enable = false;
  bool _moveIcon = false;
 TextEditingController _typeAheadController = TextEditingController();

  _loadCountryJson() async {
    String data = await DefaultAssetBundle.of(context).loadString(
        "assets/models/countries.json"); //for calling local json
    setState(() {
      _jsonCountryResult = jsonDecode(data);
      _countryDataList = _jsonCountryResult.map<CountryData>((item) {
        String emojiSymbol = item['emoji']??'';
        return CountryData(emojiSymbol, item['name'], item['iso2'], item['currency_symbol']);
      }).toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadCountryJson();
    _typeAheadController.addListener(() {
      // If text length is less than the full country string, hide the button
      if (_typeAheadController.text.trim().length < (_country?.length ?? 0)) {
        setState(() {
          _showButton = false;
          _moveIcon = false;
        });
      }

      // Or if the field is empty
      if (_typeAheadController.text.trim().isEmpty) {
        setState(() {
          _showButton = false;
          _moveIcon = false;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
              child: Text('Select your country',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              ),
            ),
            1.5.gap,
            SizedBox(
              height: 15.5.pW,
              child: TypeAheadField(
                builder: (context, controller, focusNode) {
                  return TextField(
                    controller: controller,

                    focusNode: focusNode,
                    //autofocus: true,
                    style: TextStyle(
                        fontSize: 12.5
                    ),
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                          fontSize: 12.5
                      ),
                      prefixIcon:_moveIcon == false?
                      Icon(Icons.search,color: Colors.lightBlue,):null,
                      suffixIcon:_moveIcon?
                      Icon(Icons.search,color: Colors.lightBlue,):null,
                      helperText: '',
                      hintText: 'Select Country',
                      hintStyle: TextStyle(
                          fontSize: 12,
                          height: 1.5,
                          fontWeight: FontWeight.normal
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9),
                          borderSide:  BorderSide(
                              color: Colors.grey.shade300
                      ),
                    ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                        borderSide:  BorderSide(
                            color: Colors.grey.shade400
                        ),
                      ),
                  ));
                },
                decorationBuilder: (context, child) {
                  return Material(
                    type: MaterialType.transparency,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    //elevation: 4,
                    borderRadius: BorderRadius.circular(8),
                    child: child,
                  );
                },
                controller: _typeAheadController,
                suggestionsCallback: (pattern) {
                  return _countryDataList
                      ?.where((country) =>
                      country.name.toLowerCase().contains(pattern.toLowerCase()))
                      .toList();
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    title: Row(
                      children: [
                        Text(suggestion.emoji,
                          style: TextStyle(
                              fontSize: 30
                          ),
                        ),
                        1.5.gap,
                        Text(suggestion.name,
                          style: TextStyle(
                              fontSize: 18
                          ),
                        ),
                      ],
                    ),
                  );
                },
                onSelected: (suggestion) {
                  // Handle the selected suggestion
                  setState(() {
                    _country = '${suggestion.emoji}${suggestion.name}';
                    _showButton = true;
                    _enable = true;
                    _moveIcon = true;
                    _typeAheadController.text = _country!;
                  });
                },
              ),
            ),
            Expanded(child: Container()),
            _showButton?SizedBox(
              height: 11.5.pW,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(_enable? Color(0xFF1F3669):Color(0xFF1F3669).withOpacity(0.3)),
                      shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9)
                          )
                      )
                  ),
                  onPressed:_enable?  (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return SignupPage();
                    }));
                  }:null,
                  child: Center(
                    child: Text('Continue',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  )
              ),
            ):SizedBox(),
            4.gap,
          ],
        ),
      ),
    );
  }
}

class CountryData {
  final String emoji;
  final String name;
  final String iso2;
  final String currencySymbol;

  CountryData(this.emoji, this.name, this.iso2, this.currencySymbol);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CountryData &&
        other.emoji == emoji &&
        other.name == name &&
        other.iso2 == iso2 &&
        other.currencySymbol == currencySymbol;
  }

  @override
  int get hashCode => emoji.hashCode ^ name.hashCode ^ iso2.hashCode ^ currencySymbol.hashCode;
}




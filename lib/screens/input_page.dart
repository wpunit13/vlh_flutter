import 'package:flutter/material.dart';
import '../data/constants.dart';
import 'aortic_regurgitation.dart';
import 'rheumamtic_ms.dart';
import 'mitral_regurgitation.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Valvular Heart Disease'),
      ),
      body: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
//  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
//  final GlobalKey<FormFieldState> _specifyTextFieldKey =
  //GlobalKey<FormFieldState>();
  bool inputNoMildMR = false;
  bool inputOtherSurgery = false;
  bool inputOtherSurgeryMR = false;
  bool inputOtherSurgeryRMS = false;
  List<bool> inputMR;
  bool _enabled = false;
  @override
  Widget build(BuildContext context) {
    var _onPressedAr;
    var _onPressedMr;
    var _onPressedRMS;
    if (_enabled) {
      _onPressedAr = () {
        if (_formKey.currentState.validate()) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AorticRegurgitation(
                        inputOtherSurgery:
                            (inputOtherSurgeryRMS || inputOtherSurgeryMR),
                      )));
          //builder: (context) => RheumamticMs()));
        }
        ;
      };
      _onPressedMr = () async {
        if (_formKey.currentState.validate()) {
          inputMR = await Navigator.push(
              context,
              MaterialPageRoute(
                  //builder: (context) => AorticRegurgitation()));
                  builder: (context) => MitralRegurgitation()));
          print(inputNoMildMR);
          inputNoMildMR = inputMR[0];
          inputOtherSurgeryMR = inputMR[1];
          inputNoMildMR ??= false;
        }
      };
      _onPressedRMS = () async {
        if (_formKey.currentState.validate()) {
          inputOtherSurgeryRMS = await Navigator.push(
              context,
              MaterialPageRoute(
                  //builder: (context) => AorticRegurgitation()));
                  builder: (context) => RheumamticMs(
                        inputNoMildMR: inputNoMildMR,
                      )));
        }
      };
    }

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              style: kFormFieldTextStyle,
              strutStyle: StrutStyle(height: 1.0),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(16.0),
                labelText: 'Enter Name of patient',
                labelStyle: kMultiSelectText,
                hintStyle: kMultiSelectText,
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some value';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            SwitchListTile(
              title: Text(
                'Enable',
                textAlign: TextAlign.end,
              ),
              value: _enabled,
              onChanged: (bool value) {
//                setState(() {
//                  _enabled = value;
//                });
                if (value) {
                  Alert(
                    context: context,
                    type: AlertType.warning,
                    title: "Enable",
                    desc:
                        "This app is not replacement for expert advice. Are you sure, you want to proceed?",
                    buttons: [
                      DialogButton(
                        child: Text(
                          "Okay",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          setState(() {
                            _enabled = value;
                          });
                          Navigator.pop(context);
                        },
                        width: 120,
                      ),
                      DialogButton(
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        width: 120,
                      )
                    ],
                  ).show();
                } else
                  setState(() {
                    _enabled = value;
                  });
              },
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 10,
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: _onPressedAr,
                    child: Text('AR'),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 10,
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: _onPressedRMS,
                    child: Text('RMS'),
                  ),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 10,
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: _onPressedMr,
                    child: Text('MR'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

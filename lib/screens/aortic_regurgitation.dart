import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import '../class/aortic_regurgitation_class.dart';
import '../data/constants.dart';
import 'list_screen.dart';

class AorticRegurgitation extends StatefulWidget {
  final bool inputOtherSurgery;
  AorticRegurgitation({this.inputOtherSurgery});
  @override
  AorticRegurgitationState createState() {
    return AorticRegurgitationState();
  }
}

class AorticRegurgitationState extends State<AorticRegurgitation> {
  var data;
  bool autoValidate = true;
  AR newAr = AR();
  // bool readOnly = false;
  bool showSegmentedControl = true;
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
//  final GlobalKey<FormFieldState> _specifyTextFieldKey =
//      GlobalKey<FormFieldState>();

  ValueChanged _onChanged = (val) => print(val);
  var genderOptions = ['Male', 'Female', 'Other'];
  var boolVal = ['Yes', 'No'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Aortic Regurgitation'),
        ),
        body: MyArWidgetParent(
          fbKey: _fbKey,
          newAr: newAr,
          inputOtherSurgery: widget.inputOtherSurgery,
        ));
  }
}

class MyArWidgetParent extends StatelessWidget {
  const MyArWidgetParent(
      {Key key,
      @required GlobalKey<FormBuilderState> fbKey,
      @required this.newAr,
      @required this.inputOtherSurgery})
      : _fbKey = fbKey,
        super(key: key);

  final GlobalKey<FormBuilderState> _fbKey;
  final AR newAr;
  final bool inputOtherSurgery;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FormBuilder(
                key: _fbKey,
                autovalidate: true,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10.0,
                    ),
                    FormBuilderDateTimePicker(
                      style: kFormFieldTextStyle,
                      textAlign: TextAlign.end,
                      attribute: "date",
                      inputType: InputType.date,
                      format: DateFormat("yyyy-MM-dd"),
                      decoration: InputDecoration(
                          labelText: "Appointment Time",
                          labelStyle: kMultiSelectText),
                    ),
                    SizedBox(
                      height: kSizedBoxHeight,
                    ),
                    FormBuilderDropdown(
                      attribute: "holodiastolicAorticFlowReversal",
                      style: kFormFieldTextStyle,
                      decoration: InputDecoration(
                          labelText: "Holodiastolic Aortic Flow Reversal",
                          labelStyle: kMultiSelectText),
                      validators: [FormBuilderValidators.required()],
                      items: ['Yes', 'No', 'Other']
                          .map((boolVal) => DropdownMenuItem(
                              value: boolVal, child: Text("$boolVal")))
                          .toList(),
                    ),
                    SizedBox(
                      height: kSizedBoxHeight,
                    ),
                    FormBuilderDropdown(
                      attribute: "otherCardiacSurgery",
                      style: kFormFieldTextStyle,
                      decoration: InputDecoration(
                          labelText: "Other cardiac surgery",
                          labelStyle: kMultiSelectText),
                      initialValue: inputOtherSurgery ?? 'No',
                      validators: [FormBuilderValidators.required()],
                      items: ['Yes', 'No']
                          .map((boolVal) => DropdownMenuItem(
                              value: boolVal, child: Text("$boolVal")))
                          .toList(),
                    ),
                    SizedBox(
                      height: kSizedBoxHeight,
                    ),
                    FormBuilderDropdown(
                      attribute: "symptomatic",

                      style: kFormFieldTextStyle,
                      decoration: InputDecoration(
                          labelText: "Symptomatic",
                          labelStyle: kMultiSelectText),
                      // initialValue: 'Male',
                      //hint: Text('Is patient symptomatic?'),
                      validators: [FormBuilderValidators.required()],
                      items: ['Yes', 'No']
                          .map((boolVal) => DropdownMenuItem(
                              value: boolVal, child: Text("$boolVal")))
                          .toList(),
                    ),
                    SizedBox(
                      height: kSizedBoxHeight,
                    ),
                    FormBuilderTextField(
                      attribute: "venaContrata",
                      style: kFormFieldTextStyle,
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                          suffixText: 'mm',
                          suffixStyle: kFormFieldSuffTextStyle,
                          labelText: "Vena Contrata (mm)",
                          labelStyle: kMultiSelectText),
                      validators: [
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.min(0),
                        FormBuilderValidators.required(),
                      ],
                    ),
                    SizedBox(
                      height: kSizedBoxHeight,
                    ),
                    FormBuilderTextField(
                      attribute: "rVol",
                      style: kFormFieldTextStyle,
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                          suffixText: 'mL/Beat',
                          suffixStyle: kFormFieldSuffTextStyle,
                          labelText: "Regurgitation volume (mL/Beat)",
                          labelStyle: kMultiSelectText),
                      validators: [
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.min(0),
                      ],
                    ),
                    SizedBox(
                      height: kSizedBoxHeight,
                    ),
                    FormBuilderTextField(
                      attribute: "rf",
                      style: kFormFieldTextStyle,
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                          labelText: "Regurgitation fraction (%)",
                          suffixText: '%',
                          suffixStyle: kFormFieldSuffTextStyle,
                          labelStyle: kMultiSelectText),
                      validators: [
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.min(0),
                        FormBuilderValidators.max(100),
                      ],
                    ),
                    SizedBox(
                      height: kSizedBoxHeight,
                    ),
                    FormBuilderTextField(
                      attribute: "ero",
                      style: kFormFieldTextStyle,
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                          labelText: "ERO", labelStyle: kMultiSelectText),
                      validators: [
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.min(0),
                      ],
                    ),
                    SizedBox(
                      height: kSizedBoxHeight,
                    ),
                    FormBuilderTextField(
                      attribute: "lvef",
                      style: kFormFieldTextStyle,
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                          suffixText: '%',
                          suffixStyle: kFormFieldSuffTextStyle,
                          labelText: "LVEF (%)",
                          labelStyle: kMultiSelectText),
                      validators: [
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.min(0),
                        FormBuilderValidators.max(100),
                      ],
                    ),
                    SizedBox(
                      height: kSizedBoxHeight,
                    ),
                    FormBuilderTextField(
                      attribute: "lvedd",
                      style: kFormFieldTextStyle,
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                          suffixText: 'mm',
                          suffixStyle: kFormFieldSuffTextStyle,
                          labelText: "LVEDD (mm)",
                          labelStyle: kMultiSelectText),
                      validators: [
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.min(0),
                        FormBuilderValidators.max(100),
                      ],
                    ),
                    SizedBox(
                      height: kSizedBoxHeight,
                    ),
                    FormBuilderTextField(
                      attribute: "lvesd",
                      style: kFormFieldTextStyle,
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                          labelText: "LVESD (mm)",
                          suffixStyle: kFormFieldSuffTextStyle,
                          suffixText: 'mm',
                          labelStyle: kMultiSelectText),
                      validators: [
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.min(0),
                        FormBuilderValidators.max(100),
                      ],
                    ),
                    SizedBox(
                      height: kSizedBoxHeight,
                    ),
                    FormBuilderDropdown(
                      attribute: "lowSurgicalRisk",
                      style: kFormFieldTextStyle,
                      decoration: InputDecoration(
                          labelText: "Low surgical risk",
                          labelStyle: kMultiSelectText),
                      // initialValue: 'Male',
                      //hint: Text('Surgical risk'),
                      validators: [FormBuilderValidators.required()],
                      items: ['Low', 'High']
                          .map((boolVal) => DropdownMenuItem(
                              value: boolVal, child: Text("$boolVal")))
                          .toList(),
                    ),
                    SizedBox(
                      height: kSizedBoxHeight,
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  MaterialButton(
                    child: Text("Submit"),
                    onPressed: () {
                      if (_fbKey.currentState.saveAndValidate()) {
                        print(_fbKey.currentState.value);
                        newAr.lvesd =
                            double.parse(_fbKey.currentState.value['lvesd']);
                        newAr.lvedd =
                            double.parse(_fbKey.currentState.value['lvedd']);
                        newAr.lvef =
                            double.parse(_fbKey.currentState.value['lvef']);

                        if (_fbKey.currentState.value['ero'].isEmpty ||
                            _fbKey.currentState.value['ero'] == '') {
                          newAr.ero = 0;
                        } else {
                          newAr.ero =
                              double.parse(_fbKey.currentState.value['ero']);
                        }

                        if (_fbKey.currentState.value['rVol'].isEmpty ||
                            _fbKey.currentState.value['rVol'] == '') {
                          newAr.rVol = 0;
                        } else {
                          newAr.rVol =
                              double.parse(_fbKey.currentState.value['rVol']);
                        }

                        if (_fbKey.currentState.value['rf'].isEmpty ||
                            _fbKey.currentState.value['rf'] == '') {
                          newAr.rf = 0;
                        } else {
                          newAr.rf =
                              double.parse(_fbKey.currentState.value['rf']);
                        }

                        newAr.venaContrata = double.parse(
                            _fbKey.currentState.value['venaContrata']);

                        newAr.holodiastolicAorticFlowReversal = (_fbKey
                                    .currentState
                                    .value['holodiastolicAorticFlowReversal'] ==
                                'Yes')
                            ? true
                            : false;
                        newAr.symptomatic =
                            (_fbKey.currentState.value['symptomatic'] == 'Yes')
                                ? true
                                : false;
                        newAr.otherCardiacSurgery =
                            (_fbKey.currentState.value['otherCardiacSurgery'] ==
                                    'Yes')
                                ? true
                                : false;
                        newAr.lowSurgicalRisk =
                            (_fbKey.currentState.value['lowSurgicalRisk;'] ==
                                    'Low')
                                ? true
                                : false;
                        print(newAr.managementSuggestion());
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(newAr.managementSuggestion()),
                        ));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TileApp(
                                      inputList: newAr.converter(),
                                    )));
                      }
                    },
                  ),
                  MaterialButton(
                    child: Text("Reset"),
                    onPressed: () {
                      _fbKey.currentState.reset();
                    },
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

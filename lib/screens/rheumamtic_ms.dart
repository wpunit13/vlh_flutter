import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import '../class/rheumatic_ms_class.dart';
import '../data/constants.dart';
import '../screens/list_screen.dart';

class RheumamticMs extends StatefulWidget {
  final bool inputNoMildMR;

  RheumamticMs({this.inputNoMildMR});

  @override
  RheumamticMsState createState() {
    return RheumamticMsState();
  }
}

class RheumamticMsState extends State<RheumamticMs> {
  var data;
  bool autoValidate = true;

  RMS newRMS = RMS();
  bool readOnly = false;
  bool showSegmentedControl = true;
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final GlobalKey<FormFieldState> _specifyTextFieldKey =
      GlobalKey<FormFieldState>();

  ValueChanged _onChanged = (val) => print(val);
  var genderOptions = ['Male', 'Female', 'Other'];
  var boolVal = ['Yes', 'No'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Rheumatic MS'),
        ),
        body: MyRMSWidgetParent(
          fbKey: _fbKey,
          newRMS: newRMS,
          inputNoMildMR: widget.inputNoMildMR,
        ));
  }
}

class MyRMSWidgetParent extends StatelessWidget {
  const MyRMSWidgetParent(
      {Key key,
      @required GlobalKey<FormBuilderState> fbKey,
      @required this.newRMS,
      @required this.inputNoMildMR})
      : _fbKey = fbKey,
        super(key: key);

  final GlobalKey<FormBuilderState> _fbKey;
  final RMS newRMS;
  final bool inputNoMildMR;

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
                      enabled: false,
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
                      attribute: "lAClot",
                      style: kFormFieldTextStyle,
                      decoration: InputDecoration(
                          labelText: "Left Artrial Clot",
                          labelStyle: kMultiSelectText),
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
                      attribute: "favValveMorphology",
                      style: kFormFieldTextStyle,
                      decoration: InputDecoration(
                          labelText: "Favorable valve morphology",
                          labelStyle: kMultiSelectText),
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
                      attribute: "noOrMildMr",
                      style: kFormFieldTextStyle,
                      decoration: InputDecoration(
                          labelText: "Severe MR", labelStyle: kMultiSelectText),
                      initialValue: (inputNoMildMR) ? 'Yes' : 'No',
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
                    FormBuilderDropdown(
                      attribute: "symptomsNYHAClassIIIV",

                      style: kFormFieldTextStyle,
                      decoration: InputDecoration(
                          labelText: "NYHA Class III-IV symptoms",
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
                    FormBuilderDropdown(
                      attribute: "newOnsetAF",

                      style: kFormFieldTextStyle,
                      decoration: InputDecoration(
                          labelText: "New onset AF",
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
                      attribute: "mva",
                      style: kFormFieldTextStyle,
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                          suffixText: 'cm²',
                          suffixStyle: kFormFieldSuffTextStyle,
                          labelText: "Mitral Valve Area (cm²)",
                          labelStyle: kMultiSelectText),
                      validators: [
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.min(0),
                        (val) {
                          if (_fbKey.currentState.fields['tHalf'].currentState
                                  .value.isEmpty &&
                              (val == null || val.isEmpty)) {
                            return 'Cannot be empty if Pressure half time value is empty';
                          }
                          return null;
                        }
                      ],
                    ),
                    SizedBox(
                      height: kSizedBoxHeight,
                    ),
                    FormBuilderTextField(
                      attribute: "tHalf",
                      style: kFormFieldTextStyle,
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                          suffixText: 'mSec',
                          suffixStyle: kFormFieldSuffTextStyle,
                          labelText: "Pressure half-time (mSec)",
                          labelStyle: kMultiSelectText),
                      validators: [
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.min(0),
                        (val) {
                          if (_fbKey.currentState.fields['mva'].currentState
                                  .value.isEmpty &&
                              (val == null || val.isEmpty)) {
                            return 'Cannot be empty if Mitral valve area is empty';
                          }
                          return null;
                        }
                      ],
                    ),
                    SizedBox(
                      height: kSizedBoxHeight,
                    ),
                    FormBuilderTextField(
                      attribute: "pCWP",
                      style: kFormFieldTextStyle,
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                          labelText:
                              "Pulmonary capillary wedge pressure (mm Hg)",
                          suffixText: 'mm Hg',
                          suffixStyle: kFormFieldSuffTextStyle,
                          labelStyle: kMultiSelectText),
                      validators: [
                        FormBuilderValidators.numeric(),
                      ],
                    ),
                    SizedBox(
                      height: kSizedBoxHeight,
                    ),
                    FormBuilderDropdown(
                      attribute: "highSurgicalRisk",
                      style: kFormFieldTextStyle,
                      decoration: InputDecoration(
                          labelText: "High surgical risk",
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
                        newRMS.mva =
                            double.tryParse(_fbKey.currentState.value['mva']);

                        newRMS.symptomatic =
                            (_fbKey.currentState.value['symptomatic'] == 'Yes')
                                ? true
                                : false;
                        newRMS.tHalf =
                            double.tryParse(_fbKey.currentState.value['tHalf']);
                        newRMS.lAClot =
                            (_fbKey.currentState.value['lAClot'] == 'Yes')
                                ? true
                                : false;
                        newRMS.favValveMorphology =
                            (_fbKey.currentState.value['favValveMorphology'] ==
                                    'Yes')
                                ? true
                                : false;
                        newRMS.noOrMildMr =
                            (_fbKey.currentState.value['noOrMildMr'] == 'Yes')
                                ? false
                                : true;
                        newRMS.symptomsNYHAClassIIIV = (_fbKey.currentState
                                    .value['symptomsNYHAClassIIIV'] ==
                                'Yes')
                            ? true
                            : false;

                        newRMS.highSurgicalRisk =
                            (_fbKey.currentState.value['highSurgicalRisk'] ==
                                    'Yes')
                                ? true
                                : false;

                        newRMS.newOnsetAF =
                            (_fbKey.currentState.value['newOnsetAF'] == 'Yes')
                                ? true
                                : false;

                        newRMS.pCWP =
                            double.parse(_fbKey.currentState.value['pCWP']);

                        print(newRMS.managementSuggestion());
                        print('111');
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(newRMS.managementSuggestion()),
                        ));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TileApp(
                                      inputList: newRMS.converter(),
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
                  MaterialButton(
                    child: Text("Go Back"),
                    onPressed: () {
                      if (_fbKey.currentState.saveAndValidate()) {
                        Navigator.pop(context, newRMS.getRMSSurgeryValue());
                      }
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

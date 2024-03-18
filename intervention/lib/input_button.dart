import 'package:ecovia/RecipeScreen/animated_gradient_box.dart';
import 'package:ecovia/constants.dart';
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class InputButton extends StatelessWidget {
  const InputButton({Key? key, this.name}) : super(key: key);
  final String? name;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                height: size.height * 0.06,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(143, 169, 44, 1).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 10.0,
                      ),
                      child: Icon(
                        FontAwesomeIcons.lock,
                        size: 25.0,
                        //color: Color.fromRGBO(48, 84, 70, 1),
                        color: Colors.white,
                      ),
                    ),
                    hintText: name,
                    hintStyle: const TextStyle(
                      fontSize: 20.0,
                      color: Color.fromRGBO(143, 169, 44, 1),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Color.fromRGBO(48, 84, 70, 1),
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.done,
                ), 
              );  
  }
}

class ChangingTextButton extends StatefulWidget {
  const ChangingTextButton({ Key? key, required this.buttonText, required this.changingButtonText, required this.onTap}) : super(key: key);

  final String buttonText, changingButtonText;
  final dynamic onTap;

  @override
  State<ChangingTextButton> createState() => _ChangingTextButtonState();
}

class _ChangingTextButtonState extends State<ChangingTextButton> {
  @override
  Widget build(BuildContext context) {
    return AnimatedGradientBox(
      boxShadowList: animatedGradientBoxShadow,
                // height: MediaQuery.of(context).size.height * 0.06,
                // width: MediaQuery.of(context).size.width * 0.8,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(16),
                //   color: Color.fromRGBO(48, 84, 70, 1),
                // ),
                child: TextButton(
                  onPressed: widget.onTap,
                  child: Text(
                    widget.buttonText,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),  
                ),
              );
  }
}

class RegisterButton extends StatefulWidget {
  const RegisterButton({ Key? key }) : super(key: key);

  @override
  State<RegisterButton> createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  var buttonText = 'Registrieren';
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color.fromRGBO(48, 84, 70, 1),
                        ),
                        child: TextButton(
                          onPressed: () {
                            if(_formkey.currentState!.validate()){
                              setState((){
                                buttonText = 'Erfolgreich';
                              });
                            } else {
                              buttonText = "Registrierung gescheitert";
                              } 
                          },
                          child: Text(
                            buttonText,
                            style: const TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),  
                        ),
                      );
  }
}
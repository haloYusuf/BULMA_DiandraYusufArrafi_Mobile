import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_akhir_seleksi_itc/models/login_data.dart';
import 'package:project_akhir_seleksi_itc/routes/route_name.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3ddc97),
      body: SafeArea(
        child: ListView(
          children: [
            Card(
              elevation: 12,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6))
              ),
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 1 / 20,
                left: MediaQuery.of(context).size.width * 1 / 12,
                right: MediaQuery.of(context).size.width * 1 / 12,
                bottom: 30,
              ),
              child: Container(
                margin: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/login/logo.png',
                      width: 120,
                      height: 120,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'BULMA',
                      style: TextStyle(
                        color: Color(0xFF495057),
                        fontSize: 18,
                        fontFamily: 'REM',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'BUKAN SISTEM INFORMASI AKADEMIK',
                      style: TextStyle(
                        color: Color(0xFF495057),
                        fontSize: 12,
                        fontFamily: 'REM',
                      ),
                    ),
                    const _LoginFormView(),
                  ],
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}

class _LoginFormView extends StatefulWidget {
  const _LoginFormView({super.key});

  @override
  State<_LoginFormView> createState() => _LoginFormViewState();
}

class _LoginFormViewState extends State<_LoginFormView> {

  bool _isShow = false;
  bool _validateNim = false;
  bool _validatePassword = false;

  final TextEditingController _nimController =  TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'NIM',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            onChanged: (value){},
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            maxLength: 9,
            controller: _nimController,
            decoration: InputDecoration(
              errorText: _validateNim ? 'NIM harus diisi!' : null,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(7)),
              )
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Password',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            onChanged: (value){},
            textInputAction: TextInputAction.done,
            controller: _passController,
            obscureText: !_isShow,
            decoration: InputDecoration(
              errorText: _validatePassword ? 'Password harus diisi!' : null,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
              suffixIcon: InkWell(
                child: Icon(
                  _isShow ? Icons.visibility_off : Icons.visibility,
                  color: const Color(0xFF495057),
                ),
                onTap: (){
                  setState(() {
                    _isShow = !_isShow;
                  });
                },
              )
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: (){
              setState(() {
                _validateNim = _nimController.text.isEmpty;
                _validatePassword = _passController.text.isEmpty;
                if(!_validateNim && !_validatePassword){
                  LoginData.isLogin = true;
                  LoginData.nim = _nimController.text;
                  LoginData.pass = _passController.text;
                  Navigator.pushReplacementNamed(
                    context,
                    RouteNames.home,
                  );
                }
              });
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
            ),
            child: const Text(
              'Log In',
            ),
          ),
        ],
      ),
    );
  }
}

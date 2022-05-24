import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class signinPage extends StatefulWidget {
  @override
  _signinPageState createState() => _signinPageState();
}

class _signinPageState extends State<signinPage> with TickerProviderStateMixin {
  late TabController _tabController;
  late bool visible;
  late bool changecolor;
 late Size screensize;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
    visible = false;
    changecolor=false;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    screensize=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(top:60.41/800 *screensize.height,
              child: Image.asset("assets/Frame 1.png")),
          Column(
            children: [
               SizedBox(
                height: 87.41/800 *screensize.height,
              ),
              Center(child: Image.asset("assets/Frame 2.png")),
              SizedBox(
                height: 25/800 *screensize.height,
              ),
              Center(
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.transparent,
                  onTap: (index)
                  {
                    if(_tabController.indexIsChanging)
                    {
                      setState(() {
                        changecolor=!changecolor;
                      });
                    }
                  },
                  tabs: [
                    Tab(
                        child: Container(
                      height: 41/800 *screensize.height,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: changecolor
                            ? Color(0xFFF6FBFF)
                            : Color(0xFF4EA831),
                      ),
                      child: Center(child: const Text("Live")),
                    )),
                    Tab(
                        child: Container(
                      height: 41/800 *screensize.height,
                          width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: changecolor?
                          Color(0xFF4EA831): Color(0xFFF6FBFF)
                      ),
                      child: const Center(child: Text("Paper Trading")),
                    ))
                  ],
                  labelColor: const Color(0xFFF6FBFF),
                  unselectedLabelColor: const Color(0xFF4EA831),
                  padding: const EdgeInsets.only(left: 16,right: 20),

                  labelPadding: EdgeInsets.zero,
                ),
              ),
              SizedBox(
                height: 15/800 *screensize.height,
              ),
              Expanded(
                  child: TabBarView(
                children: [
                  TabBarBody(context,"Ready to start trading with real money?",Color(0xFF4EA831), "Forgot your username/password?"),
                TabBarBody(context,"Practise with paper trading", Color(0xFF333333), "Forgot your password?"),
                ],
                controller: _tabController,
              ))
            ],
          ),
        ],
      ),
    );
  }

  Padding TabBarBody(BuildContext context,String Title,Color color,String Forget) {
    return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Title,
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          color: color
                        ),
                      ),
                      SizedBox(height: 40/800 *screensize.height,)
                      ,
                      const Text(
                        "Log in",
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          fontStyle: FontStyle.normal,
                          color: Color(0xFF4EA831),
                        ),
                      ),
                      SizedBox(height: 28/800 *screensize.height,),
                      Row(
                        children: [
                          const Text(
                            "Don’t have an account? ",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              fontStyle: FontStyle.normal,
                              color: Color(0xFF000000),
                            ),
                          ),
                          InkWell(
                            onTap: (){},
                            child: const Text(
                              "Sign Up.",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontStyle: FontStyle.normal,
                                color: Color(0xFF4EA831),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 53/800 *screensize.height,)
                            ,
                      Center(
                        child: Container(
                          padding: EdgeInsets.only(left: 12.0,bottom: 15.0),
                          height: 46/800 *screensize.height,
                          width: 335/371  *screensize.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xFFF6F6F6)
                          ),
                          child: const TextField(
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Username or Email",
                              hintStyle: TextStyle(
                                color: Color(0xFF969696),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontStyle: FontStyle.normal,
                              )
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24/800 *screensize.height,),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.only(left: 12.0,bottom: 15.0),
                          height: 46/800 *screensize.height,
                          width: 335/371  *screensize.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xFFF6F6F6)
                          ),
                          child: TextField(
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: const TextStyle(
                                  color: Color(0xFF969696),
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  fontStyle: FontStyle.normal,
                                ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  visible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ), onPressed: () {
                                  setState(() {
                                    visible=!visible;
                                  });
                              },
                            ),

                          ),
                            obscureText: !visible,
                          )
                        ),
                      ),
                      SizedBox(height:24/800 *screensize.height),
                      InkWell(
                        onTap: (){},
                        child: Text(
                          Forget,
                          style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontStyle: FontStyle.normal,
                            color: Color(0xFF4EA831),
                          ),
                        ),
                      )
                      ,
                      SizedBox(height: 40/800 *screensize.height,),
                      Center(
                        child: Container(
                          height: 46/800 *screensize.height,
                          width: 133/371  *screensize.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)
                              ,color: Color(0xFF4EA831),
                          ),
                          child: TextButton(onPressed: (){}, child: const Text(
                            "Login",style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            fontStyle: FontStyle.normal,
                            color: Color(0xFFFFFFFF),
                          ),
                          )
                          ,),
                        ),
                      )
                    ],
                  ),
                );
  }
}

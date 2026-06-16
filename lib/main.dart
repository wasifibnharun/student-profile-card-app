import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(StudentProfileCardApp());
}

class StudentProfileCardApp extends StatelessWidget {
  const StudentProfileCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        title: 'Student Profile Card',
        debugShowCheckedModeBanner: false,
        home: StudentProfileScreen(),
      ),
    );
  }
}

class StudentProfileScreen extends StatefulWidget {
  const StudentProfileScreen({super.key});

  @override
  State<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {

  bool _isLoading = true;

  void showDetails() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(Icons.school, color: Color(0xFF4050B5),),
          title: Text('Student Details', style: TextStyle(fontSize: 18.sp),),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.person,color: Color(0xFF4050B5),),
              title: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: 'Name:', style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold, color: Colors.black)),
                    TextSpan(text: ' Mike Rack', style: TextStyle(color: Colors.black, fontSize: 14.sp)),
                  ]
                )
              ),
            ),
            ListTile(
              leading: Icon(Icons.badge,color: Color(0xFF4050B5),),
              title: RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(text: 'ID:', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.black)),
                        TextSpan(text: ' STU-2025-0042', style: TextStyle(fontSize: 14.sp, color: Colors.black)),
                      ]
                  )
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.building_2_fill,color: Color(0xFF4050B5),),
              title: RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(text: 'Dept:', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.black)),
                        TextSpan(text: ' Computer Science and Engineering', style: TextStyle(fontSize: 14.sp, color: Colors.black)),
                      ]
                  )
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Close'),
          )
        ],
      )
    );
  }

  void markedPresent() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Mike Rack marked as Present ✅'))
    );
  }

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Container(
          height: 350.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Badge(
                label: Text('New'),
                backgroundColor: Colors.red,
                child: CircleAvatar(
                  backgroundColor: Color(0xFFC5CAE9),
                  foregroundColor: Color(0xFF4050B5),
                  radius: 40.r,
                  child: Icon(Icons.person, size: 40,),
                ),
              ),
              SizedBox(height: 20,),
              Text(
                'Mike Rack',
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4050B5)
                ),
              ),
              SizedBox(height: 10,),
              Text(
                'ID: STU-2025-0042',
                style: TextStyle(
                    color: Color(0xFF4050B5)
                ),
              ),
              SizedBox(height: 10,),
              Text(
                'Computer Science & Engineering',
                style: TextStyle(
                    color: Color(0xFF4050B5)
                ),
              ),
              SizedBox(height: 30,),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () => showDetails(),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4050B5),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)
                      )
                  ),
                  icon: Icon(Icons.info_outline),
                  label: Text('View Details', style: TextStyle(fontSize: 16.sp),),
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton.icon(
                  onPressed: () => markedPresent(),
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          color: Colors.green,
                          width: 2
                      ),
                      foregroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)
                      )
                  ),
                  icon: Icon(Icons.check_circle_outline),
                  label: Text('Mark Present', style: TextStyle(fontSize: 16.sp),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3), () {
        setState(() {
          _isLoading = false;
        });
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F0FF),
      appBar: AppBar(
        title: Text('Student Profile'),
        centerTitle: true,
        backgroundColor: Color(0xFF4050B5),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: _isLoading ? _buildShimmer() : _buildProfileCard(),
      ),
    );
  }
}

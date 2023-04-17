import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';



   TextTheme small= ThemeData.light().textTheme.copyWith(
     titleSmall: GoogleFonts.montserrat(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                 color: Colors.white
                      ),
   );

   TextTheme liftIDTheme= ThemeData.light().textTheme.copyWith(
     titleSmall: GoogleFonts.montserrat(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                 color: Colors.white
                      ),
   );
   
   TextTheme smalltitle= ThemeData.light().textTheme.copyWith(
     titleSmall: GoogleFonts.montserrat(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                 color: Colors.black
                      ),
   );

    TextTheme hint= ThemeData.light().textTheme.copyWith(
     titleSmall: GoogleFonts.montserrat(
                                  fontSize: 14.sp,
                                  
                                  color: Colors.black
                      ),
   );

     TextTheme medium= ThemeData.light().textTheme.copyWith(
        titleMedium: GoogleFonts.montserrat(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                      ),
   );

   TextTheme customTheme=ThemeData.light().textTheme.copyWith(
            headline1: GoogleFonts.lobster(color: Colors.black, fontSize: 22.sp)
   );

   BoxDecoration redDecoration=BoxDecoration(
                            
                            color: Colors.red.shade600,
                            borderRadius: BorderRadius.all(
                             Radius.circular(10.r),
                               )
                            );
  
     BoxDecoration greenDecoration=BoxDecoration(
                            
                            color: Colors.green.shade600,
                            borderRadius: BorderRadius.all(
                             Radius.circular(10.r),
                               )
                            );
  BoxDecoration yellowDecoration=BoxDecoration(
                            
                            color: Colors.yellow.shade900,
                            borderRadius: BorderRadius.all(
                             Radius.circular(10.r),
                               )
                            );


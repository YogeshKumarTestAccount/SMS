function slider(id) {
   
    if (id == 1) {//Dashboard
        $("#Dashboard").addClass('active');
    }
    
    //Admin module start.............
    else if (id == 2) {//Admin user management registration
        $("#Admin").addClass('active');
        $("#usermanagement").addClass('active');
        $("#newreg").addClass('active');
    }
    
    else if (id == 3) {//Admin staff/student master record
        $("#Admin").addClass('active');
        $("#usermanagement").addClass('active');
        $("#studentStaff").addClass('active');
    }
    
    else if (id == 4) {//Admin user crendentials
        $("#Admin").addClass('active');
        $("#usermanagement").addClass('active');
        $("#credentials").addClass('active');
    }
    
    else if (id == 5) {//Admin attendance info
        $("#Admin").addClass('active');
        $("#attendanceLeave").addClass('active');
        $("#attendanceInfo").addClass('active');
    }
    
    else if (id == 6) {//Admin leave request
        $("#Admin").addClass('active');
        $("#attendanceLeave").addClass('active');
        $("#leaveRequest").addClass('active');
    }
    
    else if (id == 7) {//Admin timetable
        $("#Admin").addClass('active');
        $("#adminTimetable").addClass('active');
    }
    
    else if (id == 8) {//Admin library
        $("#Admin").addClass('active');
        $("#adminLibrary").addClass('active');
    }
    
    else if (id == 9) {//Admin feemanagement
        $("#Admin").addClass('active');
        $("#adminFeeMgt").addClass('active');
    }
    
    else if (id == 10) {//Admin studentPerformance
        $("#Admin").addClass('active');
        $("#adminStuPerf").addClass('active');
    }
    
    else if (id == 11) {//Admin invites
        $("#Admin").addClass('active');
        $("#adminInvites").addClass('active');
    }
    
    else if (id == 12) {//Admin schoolConnect
        $("#Admin").addClass('active');
        $("#adminSchoolConnect").addClass('active');
    }
    
    else if (id == 13) {//Admin school and branch
        $("#Admin").addClass('active');
        $("#adminSchoolBranch").addClass('active');
    }
    
    else if (id == 14) {//Admin syllabus
        $("#Admin").addClass('active');
        $("#adminSyllabus").addClass('active');
    }
    //admin module end.................
    
    
    //teacher module start ----------------------
    else if (id == 101) {//Teacher profile
        $("#Teacher").addClass('active');
        $("#teacherProfile").addClass('active');
    }
    else if (id == 102) {//Teacher homework
        $("#Teacher").addClass('active');
        $("#teacherHomework").addClass('active');
    }
    else if (id == 103) {//Teacher question answer
        $("#Teacher").addClass('active');
        $("#teacherQuesAns").addClass('active');
    }
    else if (id == 104) {//Teacher notification
        $("#Teacher").addClass('active');
        $("#teacherNotification").addClass('active');
    }
    else if (id == 105) {//Teacher matrksheet
        $("#Teacher").addClass('active');
        $("#teachMarksheet").addClass('active');
    }
    else if (id == 106) {//Teacher timetable
        $("#Teacher").addClass('active');
        $("#teachTimetable").addClass('active');
    }
    else if (id == 107) {//Teacher invite
        $("#Teacher").addClass('active');
        $("#teachInvites").addClass('active');
    }
    else if (id == 108) {//Teacher project
        $("#Teacher").addClass('active');
        $("#teachProject").addClass('active');
    }
    else if (id == 109) {//Teacher leave request 
        $("#Teacher").addClass('active');
        $("#teachLeave").addClass('active');
        $("#teachLeaveReq").addClass('active');
    }
    else if (id == 110) {//Teacher leave inbox
        $("#Teacher").addClass('active');
        $("#teachLeave").addClass('active');
        $("#teachLeaveInbox").addClass('active');
    }
    else if (id == 111) {//Teacher student leave
        $("#Teacher").addClass('active');
        $("#teachLeave").addClass('active');
        $("#teachStudentLeave").addClass('active');
    }
    
    
    //teacher module end------------------------
    
    
    
    //parent module start---------
    
    else if (id == 201) {//parent student profile
        $("#Parent").addClass('active');
        $("#parStuProfile").addClass('active');
    }
    else if (id == 202) {//parent attendance
        $("#Parent").addClass('active');
        $("#parAttendance").addClass('active');
    }
    else if (id == 203) {//parent timetable
        $("#Parent").addClass('active');
        $("#parTimetable").addClass('active');
    }
    else if (id == 204) {//parent marks
        $("#Parent").addClass('active');
        $("#parMarks").addClass('active');
    }
    else if (id == 205) {//parent hmwrk
        $("#Parent").addClass('active');
        $("#parHmwrk").addClass('active');
    }
    else if (id == 206) {//parent notification
        $("#Parent").addClass('active');
        $("#parNotification").addClass('active');
    }
    else if (id == 207) {//parent fee
        $("#Parent").addClass('active');
        $("#parFee").addClass('active');
    }
    else if (id == 208) {//parent gps
        $("#Parent").addClass('active');
        $("#parGPS").addClass('active');
    }
    else if (id == 209) {//parent lib
        $("#Parent").addClass('active');
        $("#parLib").addClass('active');
    }
    else if (id == 210) {//parent leave req 
        $("#Parent").addClass('active');
        $("#parLeave").addClass('active');
        $("#parLeaveRequest").addClass('active');
    }
    else if (id == 211) {//parent leave inbox
        $("#Parent").addClass('active');
        $("#parLeave").addClass('active');
        $("#parLeaveInbox").addClass('active');
    }
    //parent module end------------------
    
    //student module start---------
    else if (id == 301) {// student profile
        $("#Student").addClass('active');
        $("#stuProfile").addClass('active');
    }
    else if (id == 302) {// student profile
        $("#Student").addClass('active');
        $("#stuAttendance").addClass('active');
    }
    else if (id == 303) {// student profile
        $("#Student").addClass('active');
        $("#stuTask").addClass('active');
    }
    else if (id == 304) {// student profile
        $("#Student").addClass('active');
        $("#stuNotification").addClass('active');
    }
    else if (id == 305) {// student profile
        $("#Student").addClass('active');
        $("#stuQuesAns").addClass('active');
    }
    else if (id == 306) {// student profile
        $("#Student").addClass('active');
        $("#stuMarks").addClass('active');
    }
    else if (id == 307) {// student profile
        $("#Student").addClass('active');
        $("#stuTimetable").addClass('active');
    }
    //student module end---------
    
}




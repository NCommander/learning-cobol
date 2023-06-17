       >>SOURCE FORMAT IS FIXED
       identification division.
       program-id. read-students.
       
       environment division.
       input-output section.
       file-control.
           select optional student assign "students.db"
                  organization is indexed
                  access is random
                  record key is student-id.

       data division.
      
       file section.
       fd student.
       01 student-file.
           05 student-id pic x(5).
           05 student-name pic a(25).
           05 student-dob.
               10 student-day pic x(2).
               10 student-month pic x(2).
               10 student-year pic x(2).
 
       working-storage section.
       01 ws-student.
           05 ws-student-id pic x(5).
           05 ws-student-name pic a(25).
       01 ws-eof pic a(1).
       01 response-buffer pic a(1).

 
       screen section.
       01 data-entry-screen.
           05 id-section.
               10  value "DATA ENTRY SCREEN"      blank screen
                                              LINE 01 COL 30.
               10  value "ID #: "             LINE 05 COL 05.
               10  value "Name: "             LINE 06 COL 05.
               10  ID-ON-SCR-IN               LINE 05 COL 15
                       PIC x(5)                FROM ws-student-id.
               10  NAME-ON-SCR-IN               LINE 06 COL 15
                       PIC x(30)                FROM ws-student-name.
               10 value "(C)reate, (R)ead, (U)pdate, (D)elete?" LINE 08
                   COL 01.

       procedure division.
       OPEN i-o student.
       
       move "10000" to ws-student-id.
       move "NCommander" to ws-student-name.
       write student-file from ws-student
           INVALID KEY DISPLAY 'Invalid Key'
           NOT INVALID KEY DISPLAY 'Record Inserted'
       end-write.

       move "10001" to ws-student-id.
       move "Test" to ws-student-name.
       write student-file from ws-student
           INVALID KEY DISPLAY 'Invalid Key'
           NOT INVALID KEY DISPLAY 'Record Inserted'
       end-write.

       move 'N' to ws-eof.

       CLOSE student.
       OPEN INPUT student.

       perform until ws-eof = 'Y'
           read student next into ws-student
              at end move 'Y' to ws-eof
           end-read

           display data-entry-screen
           accept response-buffer
       end-perform.
      * DISPLAY "Enter Student ID to write".
      * ACCEPT ws-student-id.

      * DISPLAY "Enter student name".
      * ACCEPT ws-student-name.

      * WRITE student-file FROM ws-student
      *     INVALID KEY DISPLAY "Unable to write key" ws-student-id.

       CLOSE student.

       stop run.

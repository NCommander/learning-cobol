       >>SOURCE FORMAT IS FIXED
      *> Let's try working with files

       identification division.
       program-id. file-test.

       environment division.
       input-output section.
       file-control.
           select optional out-file assign "outfile.txt"
                  organization line sequential.

       data division.
       file section.
       fd out-file.
           01 Customer-Record.
               05 Customer-ID pic x(10).
               05 Customer-Name.
                   10 Customer-First pic x(30).
                   10 Customer-Last pic x(30).

       procedure division.
       open output out-file.

       display "Enter Customer ID"
       accept Customer-ID.

       write Customer-Record.
       close out-file.
       stop run.

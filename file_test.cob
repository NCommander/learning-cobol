       >>SOURCE FORMAT IS FIXED
      *> Let's try working with files

       identification division.
       program-id. sum.

       environment division.
       input-output section.
       file-control.
           select optional out-file assign "outfile.txt"
                  organization line sequential.

       data division.
       file section.
       fd out-file.
       01 out-line PIC X(256).

       procedure division.
       open output out-file.

       DISPLAY "Enter line".
       accept out-line.
       write out-line.

       close out-file.
       stop run.

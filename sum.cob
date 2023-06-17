       >>SOURCE FORMAT IS FIXED
      *> This is an example program working with sums and variables
      *> directly based on the example given GnuCOBOL manual

       identification division.
       program-id. sum.
       
       data division.
       working-storage section.
       01 n binary-long.
       01 i binary-long.
       01 sum-of-values binary-long value 0.


       procedure division.
       display "Enter a positive integer".
       accept n. *> this reads in a variable
       perform varying i from 1 until i > n
           display "Here"
           add i to sum-of-values
       end-perform

       display sum-of-values.
       stop run.

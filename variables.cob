       >>SOURCE FORMAT IS FIXED
       
       identification division.
       program-id. variable-test.

       data division.
       working-storage section.
       01 Test-Variable pic 9(2).

       01 Customer-Record.
           05 Customer-ID pic x(10).
           05 Customer-Name.
               10 Customer-First pic x(30).
               10 Customer-Last pic x(30).

       procedure division.

       move 10 to Test-Variable.
       display "Initial variable set:".
       display Test-Variable.
       add 90 to Test-Variable.
       display Test-Variable.
       
       stop run.

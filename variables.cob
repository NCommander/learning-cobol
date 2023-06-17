       >>SOURCE FORMAT IS FIXED
       
       identification division.
       program-id. variable-test.

       data division.
       working-storage section.
       01 Test-Variable pic 9(2).

       procedure division.
       move 10 to Test-Variable.
       display "Initial variable set:".
       display Test-Variable.
       add 90 to Test-Variable.
       display Test-Variable.
       
       stop run.

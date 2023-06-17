     1        >>SOURCE FORMAT IS FIXED
     2        IDENTIFICATION DIVISION.
     3        FUNCTION-ID. DAY-FROM-DATE.
     4       *>****************************************************************
     5       *> This GNU COBOL user-defined function converts a Gregorian or **
     6       *> Julian date into a numeric day of the week.                  **
     7       *>****************************************************************
     8       *> Arguments:                                                   **
     9       *>                                                              **
    10       *> Calendar-Date    A PIC 9 data item or numeric literal which  **
    11       *>                  will be treated as a calendar date as fol-  **
    12       *>                  lows:                                       **
    13       *>                                                              **
    14       *>                  7-digit value: Interpreted as a Julian date **
    15       *>                                 in the form yyyyddd          **
    16       *>                  8-digit value: Interpreted as a Gregorian   **
    17       *>                                 date in the form yyyymmdd    **
    18       *>                                                              **
    19       *> The result returned will be one of the following:            **
    20       *>                                                              **
    21       *> 0:  The supplied date is invalid                             **
    22       *> 1:  The supplied date is a Sunday                            **
    23       *> 2:  The supplied date is a Monday                            **
    24       *> .                                                            **
    25       *> .                                                            **
    26       *> .                                                            **
    27       *> 7:  The supplied date is a Saturday                          **
    28       *>****************************************************************
    29        ENVIRONMENT DIVISION.
    30        CONFIGURATION SECTION.
    31        REPOSITORY.
    32            FUNCTION ALL INTRINSIC.
    33        DATA DIVISION.
    34        WORKING-STORAGE SECTION.
    35        01  WS-Input-Date-DT.
    36            05 WS-ID-YYYY-NUM                     PIC 9(4).
    37            05 WS-ID-MM-NUM                       PIC 9(2).
    38            05 WS-ID-DD-NUM                       PIC 9(2).
    39        01  WS-Y-NUM                              BINARY-LONG.
    40        01  WS-M-NUM                              BINARY-LONG.
    41        01  WS-Temp-NUM                           BINARY-LONG.
      * So linkage section is like extern?
    42        LINKAGE SECTION.
    43        01  L-Input-Date-DT                       PIC 9 ANY LENGTH.
    44        01  L-Output-Day-NUM                      USAGE BINARY-LONG
    45                                                  SIGNED.
    46        PROCEDURE DIVISION USING L-Input-Date-DT
    47                       RETURNING L-Output-Day-NUM.
    48        000-Main SECTION.
    49            CALL "C$PARAMSIZE" USING 1

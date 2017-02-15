
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let rec buildhelper num depth expr =
    match num with
    | 0 -> if (rand (0, 1)) = 0 then buildX () else buildY ()
    | 1 ->
        if (rand (0, 1)) = 0
        then buildSine (buildhelper 0 (depth - 1))
        else buildCosine (buildhelper 0 (depth - 1))
    | 2 ->
        if (rand (0, 1)) = 0
        then
          buildAverage
            ((buildhelper (num - 1) (depth - 1) expr),
              (buildhelper (num - 1) (depth - 1) expr))
        else
          buildTimes
            ((buildhelper (num - 1) (depth - 1) expr),
              (buildhelper (num - 1) (depth - 1) expr))
    | 3 -> buildhelper (num - 1) depth expr
    | 4 ->
        buildThresh
          ((buildhelper (num - 2) (depth - 1) expr),
            (buildhelper (num - 2) (depth - 1) expr),
            (buildhelper (num - 2) (depth - 1) expr),
            (buildhelper (num - 2) (depth - 1) expr)) in
  buildhelper rand (1, 4) depth "";;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let rec buildhelper num depth expr =
    match num with
    | 0 -> if (rand (0, 1)) = 0 then buildX () else buildY ()
    | 1 ->
        if (rand (0, 1)) = 0
        then buildSine (buildhelper 0 0 expr)
        else buildCosine (buildhelper 0 0 expr)
    | 2 ->
        if (rand (0, 1)) = 0
        then
          buildAverage
            ((buildhelper (depth - 1) (depth - 1) expr),
              (buildhelper (depth - 1) (depth - 1) expr))
        else
          buildTimes
            ((buildhelper (depth - 1) (depth - 1) expr),
              (buildhelper (depth - 1) (depth - 1) expr))
    | 3 ->
        if (rand (0, 1)) = 0
        then
          buildAverage
            ((buildhelper (depth - 1) (depth - 1) expr),
              (buildhelper (depth - 1) (depth - 1) expr))
        else
          buildTimes
            ((buildhelper (depth - 1) (depth - 1) expr),
              (buildhelper (depth - 1) (depth - 1) expr))
    | 4 ->
        buildThresh
          ((buildhelper (depth - 1) (depth - 1) expr),
            (buildhelper (depth - 1) (depth - 1) expr),
            (buildhelper (depth - 1) (depth - 1) expr),
            (buildhelper (depth - 1) (depth - 1) expr))
    | _ ->
        buildThresh
          ((buildhelper (depth - 1) (depth - 1) expr),
            (buildhelper (depth - 1) (depth - 1) expr),
            (buildhelper (depth - 1) (depth - 1) expr),
            (buildhelper (depth - 1) (depth - 1) expr)) in
  buildhelper (rand (1, 4)) depth "";;

*)

(* changed spans
(27,4)-(49,53)
(31,23)-(31,50)
(31,38)-(31,49)
(31,39)-(31,44)
(31,47)-(31,48)
(32,13)-(32,52)
(32,25)-(32,52)
(32,40)-(32,51)
(32,41)-(32,46)
(32,49)-(32,50)
(34,8)-(42,55)
(37,27)-(37,30)
(38,28)-(38,31)
(41,27)-(41,30)
(42,28)-(42,31)
(43,11)-(43,43)
(43,24)-(43,27)
(43,33)-(43,38)
(43,39)-(43,43)
(45,8)-(45,19)
(45,8)-(49,53)
(46,10)-(49,53)
(46,25)-(46,28)
(46,31)-(46,32)
(46,34)-(46,45)
(47,12)-(47,52)
(47,26)-(47,29)
(47,32)-(47,33)
(47,35)-(47,46)
(48,26)-(48,29)
(48,32)-(48,33)
(48,35)-(48,46)
(49,12)-(49,52)
(49,26)-(49,29)
(49,32)-(49,33)
(49,35)-(49,46)
(49,47)-(49,51)
(50,2)-(50,13)
(50,2)-(50,34)
(50,14)-(50,18)
(50,19)-(50,25)
(50,20)-(50,21)
(50,23)-(50,24)
(50,26)-(50,31)
(50,32)-(50,34)
*)

(* type error slice
(15,3)-(15,26)
(15,14)-(15,24)
(15,18)-(15,24)
(15,23)-(15,24)
(26,2)-(50,34)
(26,22)-(49,53)
(26,26)-(49,53)
(26,32)-(49,53)
(28,14)-(28,27)
(28,15)-(28,19)
(31,13)-(31,22)
(31,13)-(31,50)
(31,23)-(31,50)
(31,24)-(31,35)
(31,36)-(31,37)
(37,13)-(37,53)
(37,14)-(37,25)
(38,14)-(38,54)
(38,15)-(38,26)
(41,13)-(41,53)
(41,14)-(41,25)
(42,14)-(42,54)
(42,15)-(42,26)
(43,11)-(43,22)
(43,11)-(43,43)
(46,11)-(46,51)
(46,12)-(46,23)
(47,12)-(47,52)
(47,13)-(47,24)
(48,12)-(48,52)
(48,13)-(48,24)
(49,12)-(49,52)
(49,13)-(49,24)
(50,2)-(50,13)
(50,2)-(50,34)
(50,14)-(50,18)
*)

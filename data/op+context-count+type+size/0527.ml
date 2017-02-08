
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
(27,5)-(49,52)
(31,25)-(31,49)
(31,40)-(31,45)
(31,40)-(31,49)
(31,48)-(31,49)
(32,14)-(32,51)
(32,27)-(32,51)
(32,42)-(32,47)
(32,42)-(32,51)
(32,50)-(32,51)
(34,9)-(42,54)
(37,28)-(37,31)
(38,29)-(38,32)
(41,28)-(41,31)
(42,29)-(42,32)
(43,12)-(43,44)
(43,25)-(43,28)
(43,34)-(43,39)
(43,40)-(43,44)
(45,9)-(45,20)
(45,9)-(49,52)
(46,13)-(49,52)
(46,26)-(46,29)
(46,32)-(46,33)
(46,36)-(46,45)
(47,14)-(47,52)
(47,27)-(47,30)
(47,33)-(47,34)
(47,37)-(47,46)
(48,27)-(48,30)
(48,33)-(48,34)
(48,37)-(48,46)
(49,14)-(49,52)
(49,27)-(49,30)
(49,33)-(49,34)
(49,37)-(49,46)
(49,48)-(49,52)
(50,3)-(50,14)
(50,3)-(50,35)
(50,15)-(50,19)
(50,21)-(50,22)
(50,21)-(50,25)
(50,24)-(50,25)
(50,27)-(50,32)
(50,33)-(50,35)
*)

(* type error slice
(15,4)-(15,27)
(15,15)-(15,25)
(15,19)-(15,25)
(15,24)-(15,25)
(26,3)-(50,35)
(26,23)-(49,52)
(26,27)-(49,52)
(26,33)-(49,52)
(28,16)-(28,20)
(28,16)-(28,26)
(31,14)-(31,23)
(31,14)-(31,49)
(31,25)-(31,36)
(31,25)-(31,49)
(31,37)-(31,38)
(37,15)-(37,26)
(37,15)-(37,53)
(38,16)-(38,27)
(38,16)-(38,54)
(41,15)-(41,26)
(41,15)-(41,53)
(42,16)-(42,27)
(42,16)-(42,54)
(43,12)-(43,23)
(43,12)-(43,44)
(46,13)-(46,24)
(46,13)-(46,51)
(47,14)-(47,25)
(47,14)-(47,52)
(48,14)-(48,25)
(48,14)-(48,52)
(49,14)-(49,25)
(49,14)-(49,52)
(50,3)-(50,14)
(50,3)-(50,35)
(50,15)-(50,19)
*)

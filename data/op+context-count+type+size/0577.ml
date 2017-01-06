
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


(* changed spans
(32,14)-(32,25)
(32,39)-(32,40)
(33,7)-(33,8)
(37,28)-(37,31)
(38,29)-(38,32)
(41,28)-(41,31)
(42,29)-(42,32)
(43,7)-(43,8)
(43,25)-(43,28)
(44,7)-(44,8)
(46,26)-(46,29)
(46,32)-(46,33)
(47,27)-(47,30)
(47,33)-(47,34)
(48,27)-(48,30)
(48,33)-(48,34)
(49,27)-(49,30)
(49,33)-(49,34)
*)

(* type error slice
(31,25)-(31,49)
(37,15)-(37,53)
*)

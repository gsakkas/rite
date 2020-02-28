
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
        buildTimes
          ((buildhelper (depth - 1) (depth - 1) expr),
            (buildhelper (depth - 1) (depth - 1) expr),
            (buildhelper (depth - 1) (depth - 1) expr),
            (buildhelper (depth - 1) (depth - 1) expr))
    | _ ->
        buildTimes
          ((buildhelper (depth - 1) (depth - 1) expr),
            (buildhelper (depth - 1) (depth - 1) expr),
            (buildhelper (depth - 1) (depth - 1) expr),
            (buildhelper (depth - 1) (depth - 1) expr)) in
  buildhelper (rand (1, 4)) depth "";;


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
(52,9)-(56,56)
buildThresh (buildhelper (depth - 1)
                         (depth - 1)
                         expr , buildhelper (depth - 1)
                                            (depth - 1)
                                            expr , buildhelper (depth - 1)
                                                               (depth - 1)
                                                               expr , buildhelper (depth - 1)
                                                                                  (depth - 1)
                                                                                  expr)
AppG [TupleG [EmptyG,EmptyG,EmptyG,EmptyG]]

(58,9)-(62,56)
buildThresh (buildhelper (depth - 1)
                         (depth - 1)
                         expr , buildhelper (depth - 1)
                                            (depth - 1)
                                            expr , buildhelper (depth - 1)
                                                               (depth - 1)
                                                               expr , buildhelper (depth - 1)
                                                                                  (depth - 1)
                                                                                  expr)
AppG [TupleG [EmptyG,EmptyG,EmptyG,EmptyG]]

*)

(* type error slice
(17,4)-(17,42)
(17,17)-(17,40)
(52,9)-(52,19)
(52,9)-(56,56)
(53,11)-(56,56)
(58,9)-(58,19)
(58,9)-(62,56)
(59,11)-(62,56)
*)


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
(27,5)-(49,54)
match num with
| 0 -> if rand (0 , 1) = 0
       then buildX ()
       else buildY ()
| 1 -> if rand (0 , 1) = 0
       then buildSine (buildhelper 0
                                   0 expr)
       else buildCosine (buildhelper 0
                                     0 expr)
| 2 -> if rand (0 , 1) = 0
       then buildAverage (buildhelper (depth - 1)
                                      (depth - 1)
                                      expr , buildhelper (depth - 1)
                                                         (depth - 1)
                                                         expr)
       else buildTimes (buildhelper (depth - 1)
                                    (depth - 1)
                                    expr , buildhelper (depth - 1)
                                                       (depth - 1)
                                                       expr)
| 3 -> if rand (0 , 1) = 0
       then buildAverage (buildhelper (depth - 1)
                                      (depth - 1)
                                      expr , buildhelper (depth - 1)
                                                         (depth - 1)
                                                         expr)
       else buildTimes (buildhelper (depth - 1)
                                    (depth - 1)
                                    expr , buildhelper (depth - 1)
                                                       (depth - 1)
                                                       expr)
| 4 -> buildThresh (buildhelper (depth - 1)
                                (depth - 1)
                                expr , buildhelper (depth - 1)
                                                   (depth - 1)
                                                   expr , buildhelper (depth - 1)
                                                                      (depth - 1)
                                                                      expr , buildhelper (depth - 1)
                                                                                         (depth - 1)
                                                                                         expr)
| _ -> buildThresh (buildhelper (depth - 1)
                                (depth - 1)
                                expr , buildhelper (depth - 1)
                                                   (depth - 1)
                                                   expr , buildhelper (depth - 1)
                                                                      (depth - 1)
                                                                      expr , buildhelper (depth - 1)
                                                                                         (depth - 1)
                                                                                         expr)
CaseG VarG (fromList [(LitPatG,Nothing,AppG (fromList [EmptyG])),(LitPatG,Nothing,IteG EmptyG EmptyG EmptyG),(WildPatG,Nothing,AppG (fromList [EmptyG]))])

(50,3)-(50,35)
buildhelper (rand (1 , 4))
            depth ""
AppG (fromList [VarG,AppG (fromList [EmptyG]),LitG])

*)

(* type error slice
(15,4)-(15,27)
(15,15)-(15,25)
(15,19)-(15,25)
(15,24)-(15,25)
(26,3)-(50,35)
(26,23)-(49,54)
(26,27)-(49,54)
(26,33)-(49,54)
(28,15)-(28,28)
(28,16)-(28,20)
(31,14)-(31,23)
(31,14)-(31,51)
(31,24)-(31,51)
(31,25)-(31,36)
(31,37)-(31,38)
(37,14)-(37,54)
(37,15)-(37,26)
(38,15)-(38,55)
(38,16)-(38,27)
(41,14)-(41,54)
(41,15)-(41,26)
(42,15)-(42,55)
(42,16)-(42,27)
(43,12)-(43,23)
(43,12)-(43,44)
(46,12)-(46,52)
(46,13)-(46,24)
(47,13)-(47,53)
(47,14)-(47,25)
(48,13)-(48,53)
(48,14)-(48,25)
(49,13)-(49,53)
(49,14)-(49,25)
(50,3)-(50,14)
(50,3)-(50,35)
(50,15)-(50,19)
*)

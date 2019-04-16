
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let rec buildhelper num depth expr =
    match num with
    | 0 -> if (rand (0, 1)) = 0 then buildX () else buildY ()
    | 1 ->
        if (rand (0, 1)) = 0
        then buildCosine (buildhelper 0 (depth - 1) expr)
        else expr ^ ("Cosine(" ^ ((buildhelper 0 (depth - 1) expr) ^ ")"))
    | 2 ->
        if (rand (0, 1)) = 0
        then
          expr ^
            ("((" ^
               ((buildhelper (num - 1) (depth - 1) expr) ^
                  ("+" ^ ((buildhelper (num - 1) (depth - 1) expr) ^ ")/2)"))))
        else
          expr ^
            ((buildhelper (num - 1) (depth - 1) expr) ^
               ("*" ^ (buildhelper (num - 1) (depth - 1) expr)))
    | 3 -> expr ^ (buildhelper (num - 1) depth expr)
    | 4 ->
        expr ^
          ("(" ^
             ((buildhelper (num - 2) (depth - 1) expr) ^
                ("<" ^
                   ((buildhelper (num - 2) (depth - 1) expr) ^
                      ("?" ^
                         ((buildhelper (num - 2) (depth - 1) expr) ^
                            (":" ^
                               ((buildhelper (num - 2) (depth - 1) expr) ^
                                  ")")))))))) in
  let num = rand (1, 4) in buildhelper num depth "";;


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
(19,5)-(47,46)
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

(48,3)-(48,52)
buildhelper (rand (1 , 4))
            depth ""
AppG (fromList [VarG,AppG (fromList [EmptyG]),LitG])

*)

(* type error slice
(11,4)-(11,31)
(11,17)-(11,29)
(11,21)-(11,29)
(11,28)-(11,29)
(15,4)-(15,23)
(15,12)-(15,21)
(15,17)-(15,21)
(19,5)-(47,46)
(20,12)-(20,62)
(20,53)-(20,59)
(20,53)-(20,62)
(22,9)-(24,75)
(23,14)-(23,25)
(23,14)-(23,58)
(23,26)-(23,58)
(23,27)-(23,38)
(24,14)-(24,75)
(24,19)-(24,20)
(24,34)-(24,74)
(24,35)-(24,67)
(24,36)-(24,47)
(24,68)-(24,69)
(26,9)-(35,65)
(30,16)-(31,79)
(30,17)-(30,57)
(30,18)-(30,29)
(30,58)-(30,59)
(31,26)-(31,77)
(31,27)-(31,67)
(31,28)-(31,39)
(31,68)-(31,69)
(33,11)-(35,65)
(33,16)-(33,17)
(34,13)-(35,65)
(34,14)-(34,54)
(34,15)-(34,26)
(34,55)-(34,56)
(35,16)-(35,64)
(35,21)-(35,22)
(35,23)-(35,63)
(35,24)-(35,35)
(36,12)-(36,53)
(36,17)-(36,18)
(36,19)-(36,53)
(36,20)-(36,31)
(38,9)-(47,46)
(38,14)-(38,15)
(40,14)-(47,45)
(40,15)-(40,55)
(40,16)-(40,27)
(40,56)-(40,57)
(42,20)-(47,43)
(42,21)-(42,61)
(42,22)-(42,33)
(42,62)-(42,63)
(44,26)-(47,41)
(44,27)-(44,67)
(44,28)-(44,39)
(44,68)-(44,69)
(46,32)-(47,39)
(46,33)-(46,73)
(46,34)-(46,45)
(46,74)-(46,75)
*)

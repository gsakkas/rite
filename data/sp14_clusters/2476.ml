
let rec build (rand,depth) =
  let rec buildhelper num depth expr =
    match num with
    | 0 -> if (rand (0, 1)) = 0 then expr ^ "VarX" else expr ^ "VarY"
    | 1 ->
        if (rand (0, 1)) = 0
        then expr ^ ("Sine(" ^ ((buildhelper 0 (depth - 1) expr) ^ ")"))
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
(2,15)-(33,34)
e1
VarG

(2,15)-(33,34)
e2
VarG

(2,15)-(33,34)
e
VarG

(2,15)-(33,34)
e
VarG

(2,15)-(33,34)
a
VarG

(2,15)-(33,34)
b
VarG

(2,15)-(33,34)
a_less
VarG

(2,15)-(33,34)
b_less
VarG

(2,15)-(33,34)
e1
VarG

(2,15)-(33,34)
e2
VarG

(2,15)-(33,34)
fun (e1 , e2) ->
  Average (e1 , e2)
LamG (ConAppG (Just (TupleG [VarG,VarG])) Nothing)

(2,15)-(33,34)
fun e -> Cosine e
LamG (ConAppG (Just VarG) Nothing)

(2,15)-(33,34)
fun e -> Sine e
LamG (ConAppG (Just VarG) Nothing)

(2,15)-(33,34)
fun (a , b , a_less , b_less) ->
  Thresh (a , b , a_less , b_less)
LamG (ConAppG (Just (TupleG [VarG,VarG,VarG,VarG])) Nothing)

(2,15)-(33,34)
fun (e1 , e2) ->
  Times (e1 , e2)
LamG (ConAppG (Just (TupleG [VarG,VarG])) Nothing)

(2,15)-(33,34)
fun () -> VarX
LamG (ConAppG Nothing Nothing)

(2,15)-(33,34)
fun () -> VarY
LamG (ConAppG Nothing Nothing)

(2,15)-(33,34)
Average (e1 , e2)
ConAppG (Just (TupleG [VarG,VarG])) Nothing

(2,15)-(33,34)
Cosine e
ConAppG (Just VarG) Nothing

(2,15)-(33,34)
Sine e
ConAppG (Just VarG) Nothing

(2,15)-(33,34)
Thresh (a , b , a_less , b_less)
ConAppG (Just (TupleG [VarG,VarG,VarG,VarG])) Nothing

(2,15)-(33,34)
Times (e1 , e2)
ConAppG (Just (TupleG [VarG,VarG])) Nothing

(2,15)-(33,34)
VarX
ConAppG Nothing Nothing

(2,15)-(33,34)
VarY
ConAppG Nothing Nothing

(4,4)-(32,45)
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
CaseG VarG [(Nothing,IteG EmptyG EmptyG EmptyG),(Nothing,IteG EmptyG EmptyG EmptyG),(Nothing,IteG EmptyG EmptyG EmptyG),(Nothing,IteG EmptyG EmptyG EmptyG),(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG])]

(5,37)-(5,41)
buildX
VarG

(5,37)-(5,41)
buildY
VarG

(5,37)-(5,41)
rand
VarG

(5,37)-(5,41)
buildSine
VarG

(5,37)-(5,41)
buildhelper
VarG

(5,37)-(5,41)
buildY ()
AppG [ConAppG Nothing (Just (TApp "unit" []))]

(5,37)-(5,41)
rand (0 , 1)
AppG [TupleG [EmptyG,EmptyG]]

(5,37)-(5,41)
buildSine (buildhelper 0 0
                       expr)
AppG [AppG [EmptyG,EmptyG,EmptyG]]

(5,37)-(5,41)
buildhelper 0 0 expr
AppG [LitG,LitG,VarG]

(5,37)-(5,41)
rand (0 , 1) = 0
BopG (AppG [EmptyG]) LitG

(5,37)-(5,41)
0
LitG

(5,37)-(5,41)
1
LitG

(5,37)-(5,41)
0
LitG

(5,37)-(5,41)
0
LitG

(5,37)-(5,41)
0
LitG

(5,37)-(5,41)
if rand (0 , 1) = 0
then buildSine (buildhelper 0
                            0 expr)
else buildCosine (buildhelper 0
                              0 expr)
IteG (BopG EmptyG EmptyG) (AppG [EmptyG]) (AppG [EmptyG])

(5,37)-(5,41)
(0 , 1)
TupleG [LitG,LitG]

(5,37)-(5,41)
()
ConAppG Nothing (Just (TApp "unit" []))

(5,37)-(5,41)
()
ConAppG Nothing (Just (TApp "unit" []))

(5,42)-(5,43)
buildX ()
AppG [ConAppG Nothing (Just (TApp "unit" []))]

(5,56)-(5,60)
buildCosine
VarG

(5,56)-(5,60)
buildhelper
VarG

(5,56)-(5,60)
buildhelper 0 0 expr
AppG [LitG,LitG,VarG]

(5,56)-(5,60)
0
LitG

(5,56)-(5,60)
0
LitG

(5,61)-(5,62)
buildCosine (buildhelper 0 0
                         expr)
AppG [AppG [EmptyG,EmptyG,EmptyG]]

(8,13)-(8,17)
buildAverage
VarG

(8,13)-(8,17)
buildhelper
VarG

(8,13)-(8,17)
depth
VarG

(8,13)-(8,17)
depth
VarG

(8,13)-(8,17)
buildhelper (depth - 1)
            (depth - 1) expr
AppG [BopG EmptyG EmptyG,BopG EmptyG EmptyG,VarG]

(8,13)-(8,17)
depth - 1
BopG VarG LitG

(8,13)-(8,17)
depth - 1
BopG VarG LitG

(8,13)-(8,17)
1
LitG

(8,13)-(8,17)
1
LitG

(8,13)-(8,17)
(buildhelper (depth - 1)
             (depth - 1)
             expr , buildhelper (depth - 1)
                                (depth - 1) expr)
TupleG [AppG [EmptyG,EmptyG,EmptyG],AppG [EmptyG,EmptyG,EmptyG]]

(8,18)-(8,19)
buildAverage (buildhelper (depth - 1)
                          (depth - 1)
                          expr , buildhelper (depth - 1)
                                             (depth - 1)
                                             expr)
AppG [TupleG [EmptyG,EmptyG]]

(8,59)-(8,63)
depth
VarG

(8,59)-(8,63)
depth - 1
BopG VarG LitG

(8,59)-(8,63)
1
LitG

(9,13)-(9,17)
buildTimes
VarG

(9,13)-(9,17)
buildhelper
VarG

(9,13)-(9,17)
depth
VarG

(9,13)-(9,17)
depth
VarG

(9,13)-(9,17)
buildhelper (depth - 1)
            (depth - 1) expr
AppG [BopG EmptyG EmptyG,BopG EmptyG EmptyG,VarG]

(9,13)-(9,17)
depth - 1
BopG VarG LitG

(9,13)-(9,17)
depth - 1
BopG VarG LitG

(9,13)-(9,17)
1
LitG

(9,13)-(9,17)
1
LitG

(9,13)-(9,17)
(buildhelper (depth - 1)
             (depth - 1)
             expr , buildhelper (depth - 1)
                                (depth - 1) expr)
TupleG [AppG [EmptyG,EmptyG,EmptyG],AppG [EmptyG,EmptyG,EmptyG]]

(9,18)-(9,19)
buildTimes (buildhelper (depth - 1)
                        (depth - 1)
                        expr , buildhelper (depth - 1)
                                           (depth - 1) expr)
AppG [TupleG [EmptyG,EmptyG]]

(9,61)-(9,65)
depth
VarG

(9,61)-(9,65)
depth - 1
BopG VarG LitG

(9,61)-(9,65)
1
LitG

(15,16)-(15,56)
buildAverage
VarG

(15,16)-(15,56)
(buildhelper (depth - 1)
             (depth - 1)
             expr , buildhelper (depth - 1)
                                (depth - 1) expr)
TupleG [AppG [EmptyG,EmptyG,EmptyG],AppG [EmptyG,EmptyG,EmptyG]]

(15,30)-(15,33)
depth
VarG

(15,57)-(15,58)
buildAverage (buildhelper (depth - 1)
                          (depth - 1)
                          expr , buildhelper (depth - 1)
                                             (depth - 1)
                                             expr)
AppG [TupleG [EmptyG,EmptyG]]

(16,40)-(16,43)
depth
VarG

(18,10)-(18,14)
buildTimes
VarG

(18,10)-(18,14)
buildhelper
VarG

(18,10)-(18,14)
depth
VarG

(18,10)-(18,14)
depth
VarG

(18,10)-(18,14)
buildhelper (depth - 1)
            (depth - 1) expr
AppG [BopG EmptyG EmptyG,BopG EmptyG EmptyG,VarG]

(18,10)-(18,14)
depth - 1
BopG VarG LitG

(18,10)-(18,14)
depth - 1
BopG VarG LitG

(18,10)-(18,14)
1
LitG

(18,10)-(18,14)
1
LitG

(18,10)-(18,14)
(buildhelper (depth - 1)
             (depth - 1)
             expr , buildhelper (depth - 1)
                                (depth - 1) expr)
TupleG [AppG [EmptyG,EmptyG,EmptyG],AppG [EmptyG,EmptyG,EmptyG]]

(18,15)-(18,16)
buildTimes (buildhelper (depth - 1)
                        (depth - 1)
                        expr , buildhelper (depth - 1)
                                           (depth - 1) expr)
AppG [TupleG [EmptyG,EmptyG]]

(19,27)-(19,30)
depth
VarG

(20,16)-(20,19)
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

(20,22)-(20,62)
buildThresh
VarG

(20,22)-(20,62)
(buildhelper (depth - 1)
             (depth - 1)
             expr , buildhelper (depth - 1)
                                (depth - 1)
                                expr , buildhelper (depth - 1)
                                                   (depth - 1)
                                                   expr , buildhelper (depth - 1)
                                                                      (depth - 1)
                                                                      expr)
TupleG [AppG [EmptyG,EmptyG,EmptyG],AppG [EmptyG,EmptyG,EmptyG],AppG [EmptyG,EmptyG,EmptyG],AppG [EmptyG,EmptyG,EmptyG]]

(20,36)-(20,39)
depth
VarG

(21,11)-(21,15)
buildhelper
VarG

(21,11)-(21,15)
depth
VarG

(21,11)-(21,15)
depth
VarG

(21,11)-(21,15)
depth - 1
BopG VarG LitG

(21,11)-(21,15)
depth - 1
BopG VarG LitG

(21,11)-(21,15)
1
LitG

(21,11)-(21,15)
1
LitG

(21,16)-(21,17)
buildhelper (depth - 1)
            (depth - 1) expr
AppG [BopG EmptyG EmptyG,BopG EmptyG EmptyG,VarG]

(21,32)-(21,35)
depth
VarG

(21,41)-(21,46)
depth - 1
BopG VarG LitG

(21,47)-(21,51)
1
LitG

(23,8)-(23,12)
buildhelper
VarG

(23,8)-(23,12)
depth
VarG

(23,8)-(23,12)
depth
VarG

(23,8)-(23,12)
depth - 1
BopG VarG LitG

(23,8)-(23,12)
depth - 1
BopG VarG LitG

(23,8)-(23,12)
1
LitG

(23,8)-(23,12)
1
LitG

(23,13)-(23,14)
buildhelper (depth - 1)
            (depth - 1) expr
AppG [BopG EmptyG EmptyG,BopG EmptyG EmptyG,VarG]

(25,14)-(25,54)
buildThresh
VarG

(25,14)-(25,54)
(buildhelper (depth - 1)
             (depth - 1)
             expr , buildhelper (depth - 1)
                                (depth - 1)
                                expr , buildhelper (depth - 1)
                                                   (depth - 1)
                                                   expr , buildhelper (depth - 1)
                                                                      (depth - 1)
                                                                      expr)
TupleG [AppG [EmptyG,EmptyG,EmptyG],AppG [EmptyG,EmptyG,EmptyG],AppG [EmptyG,EmptyG,EmptyG],AppG [EmptyG,EmptyG,EmptyG]]

(25,34)-(25,35)
depth
VarG

(25,37)-(25,48)
1
LitG

(25,55)-(25,56)
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

(27,40)-(27,41)
depth
VarG

(27,43)-(27,54)
1
LitG

(29,46)-(29,47)
depth
VarG

(29,49)-(29,60)
1
LitG

(31,52)-(31,53)
depth
VarG

(31,55)-(31,66)
1
LitG

(33,2)-(33,34)
buildhelper (rand (1 , 4))
            depth ""
AppG [AppG [EmptyG],VarG,LitG]

(33,14)-(33,18)
rand (1 , 4)
AppG [TupleG [EmptyG,EmptyG]]

*)

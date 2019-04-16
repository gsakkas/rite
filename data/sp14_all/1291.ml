
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
  if depth = 0
  then (if (rand (0, 2)) < 1 then buildX () else buildY ())
  else
    (let x = rand (0, 5) in
     if x = 0
     then buildSine (build (rand, (depth - 1)))
     else
       if x = 1
       then buildCosine (build (rand, (depth - 1)))
       else
         if x = 2
         then
           buildAverage
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
         else
           if x = 3
           then
             buildTimes
               ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
           else
             if x = 4
             then
               buildThresh
                 ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
                   (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;


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
  if depth = 0
  then (if (rand (0, 2)) < 1 then buildX () else buildY ())
  else
    (let x = rand (0, 5) in
     match x with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 3 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 4 ->
         buildThresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(30,6)-(50,77)
match x with
| 0 -> buildSine (build (rand , depth - 1))
| 1 -> buildCosine (build (rand , depth - 1))
| 2 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
| 3 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
| 4 -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
CaseG VarG (fromList [(LitPatG,Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(17,4)-(17,70)
(17,18)-(17,68)
(17,39)-(17,68)
(19,4)-(19,42)
(19,17)-(19,40)
(19,26)-(19,40)
(23,4)-(23,23)
(23,12)-(23,21)
(23,17)-(23,21)
(26,3)-(50,78)
(27,8)-(27,60)
(27,50)-(27,56)
(27,50)-(27,59)
(29,5)-(50,78)
(30,6)-(50,77)
(33,8)-(50,77)
(36,10)-(50,77)
(41,12)-(50,77)
(43,14)-(43,24)
(43,14)-(44,74)
(46,14)-(50,77)
(48,16)-(48,27)
(48,16)-(50,77)
(50,77)-(50,77)
*)

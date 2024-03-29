
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
  if depth > 0
  then
    let rnd = rand 0 100 in
    (if (rnd mod 5) = 0
     then buildSine (build (rand, (depth - 1)))
     else
       if (rnd mod 5) = 1
       then buildCosine (build (rand, (depth - 1)))
       else
         if (rnd mod 5) = 2
         then buildAverage ((buildX ()), (buildY ()))
         else
           if (rnd mod 5) = 3
           then buildTimes ((buildX ()), (buildY ()))
           else
             buildThresh
               ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
                 (build (rand, (depth - 1))), (build (rand, (depth - 1)))))
  else
    (let rnd = rand 0 100 in
     if (rand mod 2) = 0
     then buildAverage ((buildX ()), (buildY ()))
     else buildTimes ((buildX ()), (buildY ())));;


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
  if depth > 0
  then
    let rnd = rand (0, 100) in
    (if (rnd mod 5) = 0
     then buildSine (build (rand, (depth - 1)))
     else
       if (rnd mod 5) = 1
       then buildCosine (build (rand, (depth - 1)))
       else
         if (rnd mod 5) = 2
         then buildAverage ((buildX ()), (buildY ()))
         else
           if (rnd mod 5) = 3
           then buildTimes ((buildX ()), (buildY ()))
           else
             buildThresh
               ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
                 (build (rand, (depth - 1))), (build (rand, (depth - 1)))))
  else
    (let rnd = rand (0, 100) in
     if (rnd mod 2) = 0
     then buildAverage ((buildX ()), (buildY ()))
     else buildTimes ((buildX ()), (buildY ())));;

*)

(* changed spans
(28,15)-(28,25)
rand (0 , 100)
AppG [TupleG [EmptyG,EmptyG]]

(45,16)-(45,26)
rand (0 , 100)
AppG [TupleG [EmptyG,EmptyG]]

(46,10)-(46,14)
rnd
VarG

*)

(* type error slice
(28,15)-(28,19)
(28,15)-(28,25)
(46,9)-(46,21)
(46,10)-(46,14)
*)

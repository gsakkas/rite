
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
  let res = rand (0, 4) in
  match depth with
  | 0 -> if (res mod 2) = 0 then buildX () else buildY ()
  | _ ->
      let nd = depth - 1 in
      (match res with
       | 0 -> buildAverage ((build (rand, nd)), (build (rand, nd)))
       | 1 ->
           buildThresh
             ((build (rand, nd)), (build (rand, nd)), (build (rand, nd)),
               (build (rand, nd)))
       | 2 -> buildTimes ((build (rand, nd)), (build (rand, nd)))
       | 3 -> buildSine (build (rand, nd))
       | 4 -> buildCosine ((build rand), nd));;


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
  let res = rand (0, 4) in
  match depth with
  | 0 -> if (res mod 2) = 0 then buildX () else buildY ()
  | _ ->
      let nd = depth - 1 in
      (match res with
       | 0 -> buildAverage ((build (rand, nd)), (build (rand, nd)))
       | 1 ->
           buildThresh
             ((build (rand, nd)), (build (rand, nd)), (build (rand, nd)),
               (build (rand, nd)))
       | 2 -> buildTimes ((build (rand, nd)), (build (rand, nd)))
       | 3 -> buildSine (build (rand, nd))
       | 4 -> buildCosine (build (rand, nd)));;

*)

(* changed spans
(39,27)-(39,45)
build (rand , nd)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(13,4)-(13,31)
(13,17)-(13,29)
(13,21)-(13,29)
(13,28)-(13,29)
(32,29)-(32,47)
(32,30)-(32,35)
(32,36)-(32,46)
(32,37)-(32,41)
(39,15)-(39,26)
(39,15)-(39,45)
(39,27)-(39,45)
(39,28)-(39,40)
(39,29)-(39,34)
(39,35)-(39,39)
*)

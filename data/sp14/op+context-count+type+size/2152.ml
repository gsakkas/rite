
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
(39,26)-(39,44)
(39,34)-(39,38)
*)

(* type error slice
(13,3)-(13,30)
(13,16)-(13,28)
(13,20)-(13,28)
(13,27)-(13,28)
(32,28)-(32,46)
(32,29)-(32,34)
(32,35)-(32,45)
(32,36)-(32,40)
(39,14)-(39,25)
(39,14)-(39,44)
(39,26)-(39,44)
(39,27)-(39,39)
(39,28)-(39,33)
(39,34)-(39,38)
*)

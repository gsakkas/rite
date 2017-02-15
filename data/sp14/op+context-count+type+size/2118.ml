
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
  match rand depth with
  | (r,depth) ->
      (match r (0, 6) with
       | 0 -> buildX ()
       | 1 -> buildY ()
       | 2 -> buildSine (build (r, (depth - 1)))
       | 3 -> buildCosine (build (r, (depth - 1)))
       | 4 ->
           buildAverage ((build (r, (depth - 1))), (build (r, (depth - 1))))
       | 5 -> buildTimes ((build (r, (depth - 1))), (build (r, (depth - 1))))
       | 6 ->
           buildThresh
             ((build (r, (depth - 1))), (build (r, (depth - 1))),
               (build (r, (depth - 1))), (build (r, (depth - 1)))));;


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
  match (rand, depth) with
  | (r,0) -> if (r (0, 1)) = 0 then buildX () else buildY ()
  | (r,depth) ->
      let r = rand (0, 7) in
      (match r with
       | 0 -> buildX ()
       | 1 -> buildY ()
       | 2 -> buildSine (build (rand, (depth - 1)))
       | 3 -> buildCosine (build (rand, (depth - 1)))
       | 4 ->
           buildAverage
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 5 ->
           buildTimes
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | _ ->
           buildThresh
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;

*)

(* changed spans
(26,2)-(39,67)
(26,8)-(26,12)
(26,8)-(26,18)
(28,6)-(39,67)
(28,13)-(28,21)
(28,19)-(28,20)
(29,14)-(29,23)
(31,14)-(31,23)
(31,14)-(31,48)
(31,32)-(31,33)
(32,34)-(32,35)
(34,33)-(34,34)
(34,59)-(34,60)
(35,34)-(35,35)
(35,60)-(35,61)
(38,22)-(38,23)
(38,48)-(38,49)
(39,16)-(39,21)
(39,22)-(39,38)
(39,23)-(39,24)
(39,26)-(39,37)
(39,27)-(39,32)
(39,35)-(39,36)
(39,42)-(39,47)
(39,48)-(39,64)
(39,49)-(39,50)
(39,52)-(39,63)
(39,53)-(39,58)
(39,61)-(39,62)
*)

(* type error slice
(25,3)-(39,69)
(25,15)-(39,67)
(26,8)-(26,12)
(26,8)-(26,18)
(26,13)-(26,18)
(28,13)-(28,14)
(28,13)-(28,21)
(28,15)-(28,21)
(31,24)-(31,48)
(31,25)-(31,30)
(31,31)-(31,47)
(31,32)-(31,33)
(31,35)-(31,46)
*)

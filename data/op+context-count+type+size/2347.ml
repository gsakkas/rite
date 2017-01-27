
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
(26,3)-(39,63)
(26,9)-(26,13)
(26,9)-(26,19)
(28,8)-(39,63)
(28,14)-(28,21)
(28,20)-(28,21)
(29,15)-(29,24)
(31,15)-(31,24)
(31,15)-(31,46)
(31,33)-(31,34)
(32,35)-(32,36)
(34,34)-(34,35)
(34,60)-(34,61)
(35,35)-(35,36)
(35,61)-(35,62)
(38,23)-(38,24)
(38,49)-(38,50)
(39,17)-(39,22)
(39,24)-(39,25)
(39,24)-(39,37)
(39,28)-(39,33)
(39,28)-(39,37)
(39,36)-(39,37)
(39,43)-(39,48)
(39,50)-(39,51)
(39,50)-(39,63)
(39,54)-(39,59)
(39,54)-(39,63)
(39,62)-(39,63)
*)

(* type error slice
(21,4)-(21,23)
(21,12)-(21,21)
(21,17)-(21,21)
(25,4)-(39,70)
(25,16)-(39,63)
(26,3)-(39,63)
(26,9)-(26,13)
(26,9)-(26,19)
(26,14)-(26,19)
(28,8)-(39,63)
(28,14)-(28,15)
(28,14)-(28,21)
(28,17)-(28,18)
(28,17)-(28,21)
(28,20)-(28,21)
(29,15)-(29,21)
(29,15)-(29,24)
(29,22)-(29,24)
(31,26)-(31,31)
(31,26)-(31,46)
(31,33)-(31,34)
(31,33)-(31,46)
(31,37)-(31,46)
*)

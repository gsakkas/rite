
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec build (rand,depth) =
  if depth = 0
  then let num (a,b) = rand in match num with | 0 -> VarX | _ -> VarY
  else
    (let num (a,b) = rand in
     match num with
     | 0 -> Sine (build (rand, (depth - 1)))
     | _ -> Cosine (build (rand, (depth - 1))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec build (rand,depth) =
  if depth = 0
  then let num = rand (0, 2) in match num with | 0 -> VarX | _ -> VarY
  else
    (let num = rand (0, 5) in
     match num with
     | 0 -> Sine (build (rand, (depth - 1)))
     | _ -> Cosine (build (rand, (depth - 1))));;

*)

(* changed spans
(13,17)-(13,28)
rand (0 , 2)
AppG (fromList [TupleG (fromList [EmptyG])])

(15,15)-(15,26)
rand (0 , 5)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(13,8)-(13,70)
(13,17)-(13,28)
(13,32)-(13,70)
(13,38)-(13,41)
(15,5)-(18,48)
(15,15)-(15,26)
(16,6)-(18,47)
(16,12)-(16,15)
*)

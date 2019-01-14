
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
(13,16)-(13,27)
rand (0 , 2)
AppG (fromList [TupleG (fromList [EmptyG])])

(13,31)-(13,69)
0
LitG

(13,31)-(13,69)
2
LitG

(13,31)-(13,69)
(0 , 2)
TupleG (fromList [LitG])

(15,14)-(15,25)
rand (0 , 5)
AppG (fromList [TupleG (fromList [EmptyG])])

(16,5)-(18,46)
0
LitG

(16,5)-(18,46)
5
LitG

(16,5)-(18,46)
(0 , 5)
TupleG (fromList [LitG])

*)

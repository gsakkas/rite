
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | PowerUp of expr* expr
  | Square2 of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let rec build (rand,depth) =
  match depth with
  | 0 -> buildX
  | 1 -> build (rand, (depth - (depth - 1)))
  | 2 ->
      buildTimes
        ((build (rand, (depth - (depth - 2)))),
          (build (rand, (depth - (depth - 2)))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | PowerUp of expr* expr
  | Square2 of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildSine e = Sine e;;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let rec build (rand,depth) =
  match depth with
  | 0 -> buildX ()
  | 1 -> buildSine (build (rand, (depth - (depth - 1))))
  | 2 ->
      buildTimes
        ((build (rand, (depth - (depth - 2)))),
          (build (rand, (depth - (depth - 2)))));;

*)

(* changed spans
(13,16)-(13,39)
e
VarG

(13,16)-(13,39)
fun e -> Sine e
LamG (ConAppG (Just VarG) Nothing)

(13,16)-(13,39)
Sine e
ConAppG (Just VarG) Nothing

(19,9)-(19,15)
buildX ()
AppG (fromList [ConAppG Nothing (Just (TApp "unit" []))])

(20,9)-(20,14)
buildSine
VarG

(20,9)-(20,14)
build (rand , depth - (depth - 1))
AppG (fromList [TupleG (fromList [EmptyG])])

(20,9)-(20,44)
()
ConAppG Nothing (Just (TApp "unit" []))

*)

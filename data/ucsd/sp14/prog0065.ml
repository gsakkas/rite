
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


type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr
  | Log of expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let rec build (rand,depth) =
  if depth = 0
  then let g = rand (0, 1) in match g with | 0 -> VarX | 1 -> VarY
  else
    (let g = rand (0, 6) in
     match g with
     | 0 -> buildSine (build (rand, (depth - 1)))
     | 1 -> buildCosine (build (rand, (depth - 1)))
     | 2 ->
         Average ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 3 -> Times ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 4 ->
         Thresh
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 -> Power ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 6 -> Log (build (rand, (depth - 1))));;

let makeRand (seed1,seed2) =
  let seed = Array.of_list [seed1; seed2] in
  let s = Random.State.make seed in
  fun (x,y)  -> x + (Random.State.int s (y - x));;

let _ = build (makeRand, 2);;

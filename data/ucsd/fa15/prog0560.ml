
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let makeRand (seed1,seed2) =
  let seed = Array.of_list [seed1; seed2] in
  let s = Random.State.make seed in
  fun (x,y)  -> x + (Random.State.int s (y - x));;

let rec build (rand,depth) =
  if depth = 0
  then let g = makeRand (0, 1) in match g with | 0 -> VarX | 1 -> VarY
  else
    (let g = makeRand (0, 4) in
     match g with
     | 0 -> Sine (build (rand, (depth - 1)))
     | 1 -> Cosine (build (rand, (depth - 1)))
     | 2 -> Average (build (rand, (depth - 1)))
     | 3 -> Times (build (rand, (depth - 1)))
     | 4 -> Thresh (build (rand, (depth - 1))));;

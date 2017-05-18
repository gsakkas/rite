
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
  then match rand (0, 1) with | 0 -> VarX | 1 -> VarY
  else
    (let nextDepth = depth - 1 in
     match rand (0, 4) with
     | 0 -> Sine (build (rand, nextDepth))
     | 1 -> Cosine (build (rand, nextDepth))
     | 2 -> Average ((build (rand, nextDepth)), (build (rand, nextDepth)))
     | 3 -> Times ((build (rand, nextDepth)), (build (rand, nextDepth)))
     | 4 ->
         Thresh
           ((build (rand, nextDepth)), (build (rand, nextDepth)),
             (build (rand, nextDepth)), (build (rand, nextDepth))));;

let makeRand (seed1,seed2) =
  let seed = Array.of_list [seed1; seed2] in
  let s = Random.State.make seed in
  fun (x,y)  -> x + (Random.State.int s (y - x));;

let makeRand (seed1,seed2) =
  let seed = Array.of_list [seed1; seed2] in
  let s = Random.State.make seed in
  (fun (x,y)  -> x + (Random.State.int s (y - x))) build
    ((makeRand (0, 6)), 5);;

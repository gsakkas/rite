
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

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let makeRand (seed1,seed2) =
  let seed = Array.of_list [seed1; seed2] in
  let s = Random.State.make seed in
  fun (x,y)  -> x + (Random.State.int s (y - x));;

let rec build (rand,depth) =
  if depth = 0
  then buildX ()
  else
    (let randNum = rand 0 5 in
     let depth = depth - 1 in
     match randNum with
     | 0 -> buildSine (build ((makeRand (5, 16)), depth))
     | 1 -> buildCosine (build (rand, depth))
     | 2 -> buildTimes ((build (rand, depth)), (build (rand, depth)))
     | 3 -> buildAverage ((build (rand, depth)), (build (rand, depth)))
     | _ -> buildY ());;

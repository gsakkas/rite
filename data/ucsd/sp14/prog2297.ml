
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

let rec build (rand,depth) =
  match (rand, depth) with
  | (_,0) -> if (rand mod 2) == 0 then buildY () else buildX ()
  | (_,1) ->
      if (rand mod 3) == 0
      then buildSine (build (rand, (depth - 1)))
      else buildCosine (build (rand, (depth - 1)))
  | (_,2) ->
      buildTimes
        ((build (rand, (depth - 1))), (build ((rand + 1), (depth - 1))))
  | (_,_) ->
      if depth > 10
      then
        buildTimes
          ((buildAverage
              ((build ((rand + 3), (depth - 1))),
                (build ((rand - 1), (depth - 1))))),
            (build (rand, (depth - 1))))
      else
        if depth = 9
        then buildSine (build ((rand + 1), (depth - 1)))
        else
          if depth = 8
          then buildCosine (build ((rand + 2), (depth - 1)))
          else build ((rand + 1), (depth - 1));;

let makeRand (seed1,seed2) =
  let seed = Array.of_list [seed1; seed2] in
  let s = Random.State.make seed in
  fun (x,y)  -> x + (Random.State.int s (y - x));;

let _ = let rand = makeRand (1, 3) in let x = rand (1, 3) in build (rand, 1);;


type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

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
        (((build rand), (depth - 1)), (build ((rand + 1), (depth - 1))));;

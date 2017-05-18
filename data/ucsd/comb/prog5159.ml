
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Funny of expr* expr* expr
  | Funny1 of expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildFunny (c,d,e) = Funny (c, d, e);;

let buildFunny1 f = Funny1 f;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match rand (0, 8) with
  | 0 -> if (rand (0, 2)) = 0 then buildX () else buildY ()
  | 1 ->
      if depth = 0
      then (if (rand (0, 2)) = 0 then buildX () else buildY ())
      else buildSine (build (rand, (depth - 1)))
  | 2 ->
      if depth = 0
      then (if (rand (0, 2)) = 0 then buildX () else buildY ())
      else buildCosine (build (rand, (depth - 1)))
  | 3 ->
      if depth = 0
      then (if (rand (0, 2)) = 0 then buildX () else buildY ())
      else
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 4 ->
      if depth = 0
      then (if (rand (0, 2)) = 0 then buildX () else buildY ())
      else
        buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 ->
      if depth = 0
      then (if (rand (0, 2)) = 0 then buildX () else buildY ())
      else
        buildThresh
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 6 ->
      if depth = 0
      then (if (rand (0, 2)) = 0 then buildX () else buildY ())
      else buildFunny (build (rand, (depth - 1)))
  | 7 ->
      if depth = 0
      then (if (rand (0, 2)) = 0 then buildX () else buildY ())
      else buildFunny1 (build (rand, (depth - 1)));;

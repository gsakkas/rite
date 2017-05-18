
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

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let subtreeSize1 = rand (0, (depth - 1)) in
  let subtreeSize2 = rand (0, (depth - 1)) in
  let subtreeSize3 = rand (0, (depth - 1)) in
  let subtreeSize4 = rand (0, (depth - 1)) in
  if depth <= 0
  then let x = rand (1, 2) in (if x = 1 then buildX () else buildY ())
  else
    (let x = rand (1, 5) in
     match x with
     | 1 -> buildSine (build (rand, subtreeSize1))
     | 2 -> buildCosine (build (rand, subtreeSize1))
     | 3 ->
         buildAverage
           ((build (rand, subtreeSize1)), (build (rand, subtreeSize2)))
     | 4 ->
         buildTimes
           ((build (rand, subtreeSize1)), (build (rand, subtreeSize2)))
     | 5 ->
         buildThresh
           ((build (rand, subtreeSize1)), (build (rand, subtreeSize2)),
             (build (rand, subtreeSize3)), (build (rand, subtreeSize4)))
     | _ -> buildSine (build (rand, subtreeSize1)));;

let _ = build (1, 0);;

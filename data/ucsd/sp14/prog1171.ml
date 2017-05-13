
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

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildX () = VarX;;

let buildY () = VarY;;

let pi = 4.0 *. (atan 1.0);;

let rec build (rand,depth) =
  match depth with
  | 0 -> (match rand (1, 3) with | 1 -> buildX () | _ -> buildY ())
  | _ ->
      (match rand (1, 10) with
       | 1 -> buildSine (pi *. (build (rand, (depth - 1))))
       | 2 -> buildCosine (pi *. (build (rand, (depth - 1))))
       | 3 -> buildSine (pi *. (build (rand, (depth - 1))))
       | 4 -> buildCosine (pi *. (build (rand, (depth - 1))))
       | 5 -> buildSine (pi *. (build (rand, (depth - 1))))
       | 6 -> buildCosine (pi *. (build (rand, (depth - 1))))
       | 7 ->
           buildThresh
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 8 -> buildX ()
       | 9 -> buildY ());;

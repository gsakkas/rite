
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

let _ =
  let rec build (rand,depth) =
    match (rand, depth) with
    | (r,depth) ->
        let r = rand (0, 7) in
        (match r with
         | 0 -> buildX ()
         | 1 -> buildY ()
         | 2 -> buildSine (build (r, (depth - 1)))
         | 3 -> buildCosine (build (r, (depth - 1)))
         | 4 ->
             buildAverage
               ((build (r, (depth - 1))), (build (r, (depth - 1))))
         | 5 ->
             buildTimes ((build (r, (depth - 1))), (build (r, (depth - 1))))
         | _ ->
             buildThresh
               ((build (r, (depth - 1))), (build (r, (depth - 1))),
                 (build (r, (depth - 1))), (build (r, (depth - 1))))) in
  (depth, (depth >= 0));;

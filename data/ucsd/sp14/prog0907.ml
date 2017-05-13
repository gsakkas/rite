
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Tan of expr
  | NegPos of expr* expr* expr;;

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Square of expr
  | NegPos of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildNegPos (e1,e2,e3) = NegPos (e1, e2, e3);;

let buildSine e = Sine e;;

let buildSquare e1 = Tan e1;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth > 1
  then
    match rand (0, 16) with
    | 0 -> buildX ()
    | 1 -> buildY ()
    | 3|4 -> buildSine (build (rand, (depth - 1)))
    | 5|6 -> buildCosine (build (rand, (depth - 1)))
    | 7|8|9 ->
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 10|11|12 ->
        buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 13|14|15 ->
        buildThresh
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 16|17 -> buildSquare (build (rand, (depth - 1)))
    | _ ->
        buildNegPos
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))))
  else (match rand (0, 2) with | 0 -> buildX () | _ -> buildY ());;

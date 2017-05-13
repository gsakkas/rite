
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SquareRoot of expr
  | FunckyRoot of expr* expr* expr;;

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SquareRoot of expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildFunckyRoot (e1,e2,e3) = FunckyRoot (e1, e2, e3);;

let buildSine e = Sine e;;

let buildSquareRoot e = SquareRoot e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then
    let num = rand (0, 1) in match num with | 0 -> buildX () | 1 -> buildY ()
  else
    (let num = rand (0, 8) in
     match num with
     | 0 -> buildX ()
     | 1 -> buildY ()
     | 2 -> buildSine (build (rand, (depth - 1)))
     | 3 -> buildCosine (build (rand, (depth - 1)))
     | 4 ->
         buildAverage
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 5 ->
         buildTimes
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | 6 ->
         buildThresh
           ((buildX ()), (buildY ()), (build (rand, (depth - 1))),
             (build (rand, (depth - 1))))
     | 7 -> buildSquareRoot (build (rand, (depth - 1)))
     | 8 ->
         buildFunckyRoot
           ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1)))));;

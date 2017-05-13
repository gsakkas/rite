
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Sigmoid of expr;;

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Sigmoid of expr
  | Tanh of expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSigmoid e = Sigmoid e;;

let buildSine e = Sine e;;

let buildTanh (e1,e2,e3) = Tanh (e1, e2, e3);;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  if depth = 0
  then let x = rand (0, 2) in (if x = 1 then buildX () else buildY ())
  else
    (let b = build (rand, (depth - 1)) in
     match rand (0, 6) with
     | 0 -> buildSine b
     | 1 -> buildCosine b
     | 2 -> buildAverage (b, (build (rand, (depth - 1))))
     | 3 -> buildTimes (b, (build (rand, (depth - 1))))
     | 4 -> buildSigmoid b
     | 5 ->
         buildTanh
           (b, (build (rand, (depth - 1))), (build (rand, (depth - 1))))
     | _ ->
         buildThresh
           (b, (build (rand, (depth - 1))), (build (rand, (depth - 1))),
             (build (rand, (depth - 1)))));;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine x -> "sin(pi*" ^ ((exprToString x) ^ ")")
  | Cosine x -> "cos(pi*" ^ ((exprToString x) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString x) ^ ("+" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
  | Sigmoid x -> "sigmoid(" ^ ((exprToString x) ^ ")")
  | Thresh (x,y,z,w) ->
      "(" ^
        ((exprToString x) ^
           ("<" ^
              ((exprToString y) ^
                 ("?" ^ ((exprToString z) ^ (":" ^ ((exprToString w) ^ ")")))))));;

let makeRand (seed1,seed2) =
  let seed = Array.of_list [seed1; seed2] in
  let s = Random.State.make seed in
  fun (x,y)  -> x + (Random.State.int s (y - x));;

let _ = let rand = makeRand (1234, 3849) in exprToString (build (rand, 5));;

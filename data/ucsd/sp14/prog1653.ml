
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec build (rand,depth) = failwith "to be implemented";;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine x -> "sin(pi*" ^ ((exprToString x) ^ ")")
  | Cosine x -> "cos(pi*" ^ ((exprToString x) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString x) ^ ("+" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
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

let _ = exprToString build (makeRand, 5);;

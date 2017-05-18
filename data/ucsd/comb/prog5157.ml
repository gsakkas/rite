
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec build (rand,depth) =
  match rand 0.6 with
  | 0 -> if (rand (0, 2)) = 0 then Varx else Vary
  | 1 ->
      if depth = 0
      then (if (rand (0, 2)) = 0 then Varx else Vary)
      else Sine a
  | 2 ->
      if depth = 0
      then (if (rand (0, 2)) = 0 then Varx else Vary)
      else Cosine b
  | 3 ->
      if depth = 0
      then (if (rand (0, 2)) = 0 then Varx else Vary)
      else Average (c, d)
  | 4 ->
      if depth = 0
      then (if (rand (0, 2)) = 0 then Varx else Vary)
      else Times (e, f)
  | 5 ->
      if depth = 0
      then (if (rand (0, 2)) = 0 then Varx else Vary)
      else Thresh (g, h, i, j);;

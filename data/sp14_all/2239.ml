
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Tan of expr
  | Average of expr* expr
  | Times of expr* expr
  | TimesMod of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | Thresh (w,t,u,z) ->
      if (eval (w, x, y)) < (eval (t, x, y))
      then eval (u, x, y)
      else eval (z, x, y)
  | TimesMod (w,t,u) ->
      ((eval (w, x, y)) *. (eval (t, x, y))) /.
        (mod_float ((eval (w, x, y)) *. (eval (t, x, y))) u)
  | Times (t,u) -> (eval (t, x, y)) *. (eval (u, x, y))
  | Average (t,u) -> ((eval (t, x, y)) +. (eval (u, x, y))) /. 2.0
  | Cosine t -> cos (pi *. (eval (t, x, y)))
  | Sine t -> sin (pi *. (eval (t, x, y)))
  | VarX  -> x
  | VarY  -> y;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Tan of expr
  | Average of expr* expr
  | Times of expr* expr
  | TimesMod of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | Thresh (w,t,u,z) ->
      if (eval (w, x, y)) < (eval (t, x, y))
      then eval (u, x, y)
      else eval (z, x, y)
  | TimesMod (w,t,u) ->
      ((eval (w, x, y)) *. (eval (t, x, y))) /.
        (mod_float ((eval (w, x, y)) *. (eval (t, x, y))) (eval (u, x, y)))
  | Times (t,u) -> (eval (t, x, y)) *. (eval (u, x, y))
  | Average (t,u) -> ((eval (t, x, y)) +. (eval (u, x, y))) /. 2.0
  | Cosine t -> cos (pi *. (eval (t, x, y)))
  | Sine t -> sin (pi *. (eval (t, x, y)))
  | VarX  -> x
  | VarY  -> y;;

*)

(* changed spans
(23,58)-(23,59)
eval
VarG

(23,58)-(23,59)
eval (u , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

(23,58)-(23,59)
(u , x , y)
TupleG (fromList [VarG])

(24,19)-(24,55)
x
VarG

(24,19)-(24,55)
y
VarG

*)

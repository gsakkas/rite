
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine sin -> "sin(pi*" ^ ((eval (sin, x, y)) ^ ")")
  | Cosine cos -> "cos(pi*" ^ ((eval (cos, x, y)) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((eval (e1, x, y)) ^ ("+" ^ ((eval (e2, x, y)) ^ ")/2)")))
  | Times (t1,t2) -> Printf.printf "%s*%s" t1 t2
  | Thresh (th1,th2,th3,th4) ->
      Printf.printf "(%s<*%s?%s:%s)" th1 th2 th3 th4;;


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
  | VarX  -> Printf.sprintf ("%s" x)
  | VarY  -> printf "%s" y
  | Sine sin -> printf "sin(%s)" sin
  | Cosine cos -> printf "cos(%s)" cos
  | Average (e1,e2) -> printf "((%s+%s)/2)" e1 e2
  | Times (t1,t2) -> printf "%s*%s" t1 t2
  | Thresh (th1,th2,th3,th4) -> printf "(%s<*%s?%s:%s)" th1 th2 th3 th4;;


type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let a = (1, 2);;

let buildX () = VarX;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (eval ((buildX ()), a, y))
  | Cosine a -> x
  | Average (a,b) -> x
  | Times (a,b) -> x
  | Thresh (a,b,c,d) -> x;;

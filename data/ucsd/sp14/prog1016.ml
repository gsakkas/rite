
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  let rec evalhelper e x y =
    match e with
    | VarX  -> float x
    | VarY  -> float y
    | Sine p1 -> sin (pi *. (evalhelper p1 x y))
    | Cosine p1 -> cos (pi *. (evalhelper p1)) in
  evalhelper e x y;;

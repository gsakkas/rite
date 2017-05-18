
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> Printf.sprintf "x"
  | VarY  -> Printf.sprintf "y"
  | Sine x -> Printf.sprintf "Sine(%s)" (exprToString x);;

let _ = exprToString Sine VarX;;

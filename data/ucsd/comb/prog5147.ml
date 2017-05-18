
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
  | VarX  -> Printf.sprintf "%s" "x"
  | VarY  -> Printf.sprintf "%s" "y"
  | Sine a -> Printf.sprintf "%expr" "(pi*" a ")"
  | Cosine b -> Printf.sprintf "%expr" "(pi*" b ")"
  | Average (c,d) -> Printf.sprintf "%expr%expr" c "+" d "/2"
  | Times (e,f) -> Printf.sprintf "%expr%expr" e "*" f
  | Thresh (g,h,i,j) -> Printf.sprintf "%expr%expr%expr" (g < (h ?i) : j);;

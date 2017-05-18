
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec exprToString e =
  match e with
  | VarX  -> buildX
  | VarY  -> buildY
  | Sine s -> Sine (exprToString s);;

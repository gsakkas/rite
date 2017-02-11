
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  let acc curr result =
    match curr with
    | VarX  -> Printf.sprintf "x"
    | VarY  -> Printf.sprintf "y" in
  acc e "" exprToString VarX;;

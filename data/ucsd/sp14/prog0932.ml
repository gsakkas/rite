
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Tan of expr
  | Average of expr* expr
  | Times of expr* expr
  | TimesModOne of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildTan e = mod_float (Tan e) 1.0;;


type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Mirana of expr
  | Darius of expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (e1,e2,e3) = Darius (e1, e2, e3);;

let buildX () = VarX;;

let buildY () = VarY;;

let sampleExpr2 =
  buildThresh
    ((buildX ()), (buildY ()), (buildSine (buildX ())),
      (buildCosine (buildY ())));;

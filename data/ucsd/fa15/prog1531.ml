
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Square of expr
  | Mix of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine ex -> "sin(pi*" ^ ((exprToString ex) ^ ")")
  | Cosine ex -> "cos(pi*" ^ ((exprToString ex) ^ ")")
  | Average (ex1,ex2) ->
      "((" ^ ((exprToString ex1) ^ ("+" ^ ((exprToString ex2) ^ ")/2)")))
  | Times (ex1,ex2) -> (exprToString ex1) ^ ("*" ^ (exprToString ex2))
  | Thresh (ex1,ex2,ex3,ex4) ->
      "(" ^
        ((exprToString ex1) ^
           ("<" ^
              ((exprToString ex2) ^
                 ("?" ^
                    ((exprToString ex3) ^ (":" ^ ((exprToString ex4) ^ ")")))))));;

let pi = 4.0 *. (atan 1.0);;

let sampleExpr1 =
  Thresh
    (VarX, VarY, VarX,
      (Times ((Sine VarX), (Cosine (Average (VarX, VarY))))));;

let _ = exprToString sampleExpr1 let buildX () = VarX let buildY () = VarY
let buildSine e = Sine e let buildCosine e = Cosine e
let buildAverage (e1,e2) = Average (e1, e2)
let buildTimes (e1,e2) = Times (e1, e2)
let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less)
let buildSquare e = Square e let buildMix (e1,e2,e3) = Mix (e1, e2, e3)
let pi = 4.0 *. (atan 1.0)
let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine ex -> sin (pi *. (eval (ex, x, y)))
  | Cosine ex -> cos (pi *. (eval (ex, x, y)))
  | Average (ex1,ex2) -> ((eval (ex1, x, y)) +. (eval (ex2, x, y))) /. 2.0
  | Times (ex1,ex2) -> (eval (ex1, x, y)) *. (eval (ex2, x, y))
  | Thresh (ex1,ex2,ex3,ex4) ->
      if (eval (ex1, x, y)) < (eval (ex2, x, y))
      then eval (ex3, x, y)
      else eval (ex4, x, y)
  | Square ex -> ((eval ex), x, y) *. (eval (ex, x, y))
  | Mix (ex1,ex2,ex3) ->
      ((eval ((Times (ex1, ex2)), x, y)) +. (eval ((Times (ex2, ex3)), x, y)))
        /. 2.0;;

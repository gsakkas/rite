
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildX () = VarX;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine a -> "sin(pi*" ^ ((exprToString a) ^ ")")
  | Cosine b -> "cos(pi*" ^ ((exprToString b) ^ ")")
  | Average (c,d) ->
      "((" ^ ((exprToString c) ^ ("+" ^ ((exprToString d) ^ ")/2)")))
  | Times (e,f) -> (exprToString e) ^ ("*" ^ (exprToString f))
  | Thresh (g,h,i,j) ->
      "(" ^
        ((exprToString g) ^
           ("<" ^
              ((exprToString h) ^
                 ("?" ^ ((exprToString i) ^ (":" ^ ((exprToString j) ^ ")")))))));;

let rec eval (e,x,y) =
  match (e, x, y) with | x -> buildX () | (a,b,c) -> exprToString a;;


(* fix

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
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> sin (pi *. (eval (a, x, y)))
  | Cosine b -> cos (pi *. (eval (b, x, y)))
  | Average (c,d) -> (eval (c, x, y)) +. ((eval (d, x, y)) /. 2.0)
  | Times (e,f) -> (eval (e, x, y)) *. (eval (f, x, y))
  | Thresh (g,h,i,j) ->
      if (eval (g, x, y)) < (eval (h, x, y))
      then eval (i, x, y)
      else eval (j, x, y);;

*)

(* changed spans
(30,3)-(30,68)
match e with
| VarX -> x
| VarY -> y
| Sine a -> sin (pi *. eval (a , x , y))
| Cosine b -> cos (pi *. eval (b , x , y))
| Average (c , d) -> eval (c , x , y) +. (eval (d , x , y) /. 2.0)
| Times (e , f) -> eval (e , x , y) *. eval (f , x , y)
| Thresh (g , h , i , j) -> if eval (g , x , y) < eval (h , x , y)
                            then eval (i , x , y)
                            else eval (j , x , y)
CaseG VarG (fromList [(ConPatG Nothing,Nothing,VarG),(ConPatG (Just VarPatG),Nothing,AppG (fromList [EmptyG])),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,BopG EmptyG EmptyG),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* type error slice
(11,4)-(11,23)
(11,12)-(11,21)
(11,17)-(11,21)
(17,27)-(17,51)
(17,28)-(17,44)
(17,29)-(17,41)
(17,45)-(17,46)
(30,3)-(30,68)
(30,31)-(30,37)
(30,31)-(30,40)
(30,54)-(30,66)
(30,54)-(30,68)
*)

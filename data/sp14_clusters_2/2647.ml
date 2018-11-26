
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec exprToString e =
  match e with | VarX  -> buildX | VarY  -> buildY | Sine s -> buildSine s;;


(* fix

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
  | VarX  -> Format.sprintf "x"
  | VarY  -> Format.sprintf "y"
  | Sine e' -> (Format.sprintf "sin(pi*") ^ ((exprToString e') ^ ")")
  | Cosine e' -> (Format.sprintf "cos(pi*") ^ ((exprToString e') ^ ")")
  | Average (e1,e2) ->
      (Format.sprintf "((") ^
        ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) ->
      (Format.sprintf "") ^ ((exprToString e1) ^ ("*" ^ (exprToString e2)))
  | Thresh (a,b,a_less,b_less) ->
      (Format.sprintf "(") ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^
                    ((exprToString a_less) ^
                       (":" ^ ((exprToString b_less) ^ ")")))))));;

*)

(* changed spans
(18,2)-(18,74)
match e with
| VarX -> Format.sprintf "x"
| VarY -> Format.sprintf "y"
| Sine e' -> Format.sprintf "sin(pi*" ^ (exprToString e' ^ ")")
| Cosine e' -> Format.sprintf "cos(pi*" ^ (exprToString e' ^ ")")
| Average (e1 , e2) -> Format.sprintf "((" ^ (exprToString e1 ^ ("+" ^ (exprToString e2 ^ ")/2)")))
| Times (e1 , e2) -> Format.sprintf "" ^ (exprToString e1 ^ ("*" ^ exprToString e2))
| Thresh (a , b , a_less , b_less) -> Format.sprintf "(" ^ (exprToString a ^ ("<" ^ (exprToString b ^ ("?" ^ (exprToString a_less ^ (":" ^ (exprToString b_less ^ ")")))))))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG]))])

(18,73)-(18,74)
Format.sprintf
VarG

*)


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
  | Sine e' -> Printf.sprintf ("sin(pi*" ^ ((exprToString e') ^ ")"))
  | Cosine e' -> Printf.sprintf ("sin(pi*" ^ ((exprToString e') ^ ")"))
  | Average (e1,e2) ->
      Printf.sprintf
        ("(" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2"))))
  | Times (e1,e2) ->
      Printf.sprintf
        ("(" ^ ((exprToString e1) ^ ("*" ^ ((exprToString e2) ^ ")"))))
  | Thresh (e1,e2,e3,e4) ->
      Printf.sprintf
        ("(" ^
           ((exprToString e1) ^
              ("<" ^
                 ((exprToString e2) ^
                    ("?" ^
                       ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")"))))))));;

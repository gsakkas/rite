
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
  | VarY  -> Printf.sprintf "x"
  | Sine x -> Printf.sprintf ""
  | Cosine x -> Printf.sprintf ""
  | Average (x,y) -> Printf.sprintf ""
  | Times (x,y) -> Printf.sprintf ""
  | Thresh (x,y,z,w) -> ((Printf.sprintf "%s<%s?%s:" x), y, z);;



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
  | Sine x -> Printf.sprintf ""
  | Cosine x -> Printf.sprintf ""
  | Average (x,y) -> Printf.sprintf ""
  | Times (x,y) -> Printf.sprintf ""
  | Thresh (x,y,z,w) ->
      Printf.sprintf "%s<%s?%s:" (exprToString x) (exprToString y)
        (exprToString z);;


(* changed spans
(14,29)-(14,32)
(19,25)-(19,27)
(19,56)-(19,57)
(19,59)-(19,60)
*)

(* type error slice
*)


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

let rec build (rand,depth) =
  if depth = 0
  then
    let num = rand (1, 10) in
    (if (rand mod 2) = 0 then buildX () else buildY ())
  else
    (let num = rand (1, 10) in
     match num with | _ -> build (rand, (depth - 1)));;


(* fix

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

let rec build (rand,depth) =
  if depth = 0
  then
    let num = rand (1, 10) in
    (if (num mod 2) = 0 then buildX () else buildY ())
  else
    (let num = rand (1, 10) in
     match num with | _ -> build (rand, (depth - 1)));;

*)

(* changed spans
(19,10)-(19,14)
num
VarG

*)

(* type error slice
(18,15)-(18,19)
(18,15)-(18,27)
(19,9)-(19,21)
(19,10)-(19,14)
*)

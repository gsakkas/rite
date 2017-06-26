
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
  match depth with
  | 0 ->
      let r = rand (0, 1) in if r = 0 then buildX else if r = 1 then buildY;;


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
  match depth with
  | 0 -> let r = rand (0, 2) in if r = 0 then buildX () else buildY ();;

*)

(* changed spans
(18,23)-(18,24)
(18,43)-(18,49)
(18,55)-(18,75)
(18,58)-(18,59)
(18,58)-(18,63)
(18,62)-(18,63)
(18,69)-(18,75)
*)

(* type error slice
(13,3)-(13,22)
(13,11)-(13,20)
(18,55)-(18,75)
(18,69)-(18,75)
*)

(* all spans
(11,11)-(11,20)
(11,16)-(11,20)
(13,11)-(13,20)
(13,16)-(13,20)
(15,15)-(18,75)
(16,2)-(18,75)
(16,8)-(16,13)
(18,6)-(18,75)
(18,14)-(18,25)
(18,14)-(18,18)
(18,19)-(18,25)
(18,20)-(18,21)
(18,23)-(18,24)
(18,29)-(18,75)
(18,32)-(18,37)
(18,32)-(18,33)
(18,36)-(18,37)
(18,43)-(18,49)
(18,55)-(18,75)
(18,58)-(18,63)
(18,58)-(18,59)
(18,62)-(18,63)
(18,69)-(18,75)
*)

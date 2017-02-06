
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
(18,24)-(18,25)
(18,44)-(18,50)
(18,56)-(18,76)
(18,59)-(18,60)
(18,59)-(18,64)
(18,63)-(18,64)
(18,70)-(18,76)
*)

(* type error slice
(11,4)-(11,23)
(11,12)-(11,21)
(11,12)-(11,21)
(11,17)-(11,21)
(13,4)-(13,23)
(13,12)-(13,21)
(13,12)-(13,21)
(13,17)-(13,21)
(15,4)-(18,78)
(15,16)-(18,76)
(16,3)-(18,76)
(16,3)-(18,76)
(16,9)-(16,14)
(18,7)-(18,76)
(18,7)-(18,76)
(18,15)-(18,19)
(18,15)-(18,25)
(18,15)-(18,25)
(18,21)-(18,22)
(18,21)-(18,25)
(18,24)-(18,25)
(18,30)-(18,76)
(18,30)-(18,76)
(18,33)-(18,34)
(18,33)-(18,38)
(18,33)-(18,38)
(18,33)-(18,38)
(18,37)-(18,38)
(18,44)-(18,50)
(18,56)-(18,76)
(18,56)-(18,76)
(18,56)-(18,76)
(18,59)-(18,60)
(18,59)-(18,64)
(18,59)-(18,64)
(18,63)-(18,64)
(18,70)-(18,76)
*)


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
  | 0 -> if (rand (0, 1)) = 0 then buildX () else buildY ()
  | _ -> let y = rand (2, 6) in if y = 2 then y;;


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
  then (if (rand (0, 1)) = 0 then buildX () else buildY ())
  else (let y = rand (2, 6) in buildX ());;

*)

(* changed spans
(16,3)-(18,48)
(16,9)-(16,14)
(17,10)-(17,60)
(18,33)-(18,48)
(18,36)-(18,37)
(18,36)-(18,41)
(18,40)-(18,41)
(18,47)-(18,48)
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
(15,4)-(18,50)
(15,16)-(18,48)
(16,3)-(18,48)
(16,3)-(18,48)
(16,9)-(16,14)
(17,10)-(17,60)
(17,10)-(17,60)
(17,14)-(17,18)
(17,14)-(17,24)
(17,14)-(17,24)
(17,14)-(17,30)
(17,14)-(17,30)
(17,14)-(17,30)
(17,20)-(17,21)
(17,20)-(17,24)
(17,23)-(17,24)
(17,29)-(17,30)
(17,36)-(17,42)
(17,36)-(17,45)
(17,43)-(17,45)
(17,51)-(17,57)
(17,51)-(17,60)
(17,58)-(17,60)
(18,10)-(18,48)
(18,18)-(18,22)
(18,18)-(18,28)
(18,24)-(18,25)
(18,24)-(18,28)
(18,27)-(18,28)
(18,33)-(18,48)
(18,33)-(18,48)
(18,33)-(18,48)
(18,36)-(18,37)
(18,36)-(18,41)
(18,36)-(18,41)
(18,40)-(18,41)
(18,47)-(18,48)
*)


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
  if depth <= 0
  then let x = rand (1, 2) in (if x = 1 then buildX () else buildY ());;


(* fix

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

let rec build (rand,depth) =
  if depth <= 0
  then let x = rand (1, 2) in (if x = 1 then buildX () else buildY ())
  else
    (let subtreeSize1 = if depth = 1 then 0 else rand (1, (depth - 1)) in
     let subtreeSize2 = if depth = 1 then 0 else rand (1, (depth - 1)) in
     let subtreeSize3 = if depth = 1 then 0 else rand (1, (depth - 1)) in
     let subtreeeSize4 = if depth = 1 then 0 else rand (1, (depth - 1)) in
     let x = rand (1, 5) in
     match x with | _ -> buildSine (build (rand, subtreeSize1)));;

*)

(* changed spans
(11,11)-(11,20)
(16,2)-(17,70)
*)

(* type error slice
(13,3)-(13,22)
(13,11)-(13,20)
(13,16)-(13,20)
(16,2)-(17,70)
(17,7)-(17,70)
(17,30)-(17,70)
(17,60)-(17,66)
(17,60)-(17,69)
*)

(* all spans
(11,11)-(11,20)
(11,16)-(11,20)
(13,11)-(13,20)
(13,16)-(13,20)
(15,15)-(17,70)
(16,2)-(17,70)
(16,5)-(16,15)
(16,5)-(16,10)
(16,14)-(16,15)
(17,7)-(17,70)
(17,15)-(17,26)
(17,15)-(17,19)
(17,20)-(17,26)
(17,21)-(17,22)
(17,24)-(17,25)
(17,30)-(17,70)
(17,34)-(17,39)
(17,34)-(17,35)
(17,38)-(17,39)
(17,45)-(17,54)
(17,45)-(17,51)
(17,52)-(17,54)
(17,60)-(17,69)
(17,60)-(17,66)
(17,67)-(17,69)
*)

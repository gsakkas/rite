
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec build (rand,depth) =
  if depth = 0
  then let num (a,b) = rand in match num with | 0 -> VarX | _ -> VarY
  else
    (let num (a,b) = rand in
     match num with
     | 0 -> Sine (build (rand, (depth - 1)))
     | _ -> Cosine (build (rand, (depth - 1))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec build (rand,depth) =
  if depth = 0
  then let num = rand (0, 2) in match num with | 0 -> VarX | _ -> VarY
  else
    (let num = rand (0, 5) in
     match num with
     | 0 -> Sine (build (rand, (depth - 1)))
     | _ -> Cosine (build (rand, (depth - 1))));;

*)

(* changed spans
(13,16)-(13,27)
(13,31)-(13,69)
(15,14)-(15,25)
(16,5)-(18,46)
*)

(* type error slice
(13,7)-(13,69)
(13,16)-(13,27)
(13,31)-(13,69)
(13,37)-(13,40)
(15,4)-(18,47)
(15,14)-(15,25)
(16,5)-(18,46)
(16,11)-(16,14)
*)

(* all spans
(11,15)-(18,47)
(12,2)-(18,47)
(12,5)-(12,14)
(12,5)-(12,10)
(12,13)-(12,14)
(13,7)-(13,69)
(13,16)-(13,27)
(13,23)-(13,27)
(13,31)-(13,69)
(13,37)-(13,40)
(13,53)-(13,57)
(13,65)-(13,69)
(15,4)-(18,47)
(15,14)-(15,25)
(15,21)-(15,25)
(16,5)-(18,46)
(16,11)-(16,14)
(17,12)-(17,44)
(17,17)-(17,44)
(17,18)-(17,23)
(17,24)-(17,43)
(17,25)-(17,29)
(17,31)-(17,42)
(17,32)-(17,37)
(17,40)-(17,41)
(18,12)-(18,46)
(18,19)-(18,46)
(18,20)-(18,25)
(18,26)-(18,45)
(18,27)-(18,31)
(18,33)-(18,44)
(18,34)-(18,39)
(18,42)-(18,43)
*)

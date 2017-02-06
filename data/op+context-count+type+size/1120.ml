
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
(15,4)-(22,56)
(15,16)-(22,51)
(16,3)-(22,51)
(16,3)-(22,51)
(16,6)-(16,11)
(16,6)-(16,15)
(16,6)-(16,15)
(16,6)-(16,15)
(16,14)-(16,15)
(18,5)-(19,55)
(18,5)-(19,55)
(18,15)-(18,19)
(18,15)-(18,26)
(18,15)-(18,26)
(18,21)-(18,22)
(18,21)-(18,26)
(18,24)-(18,26)
(19,6)-(19,55)
(19,6)-(19,55)
(19,10)-(19,14)
(19,10)-(19,20)
(19,10)-(19,20)
(19,10)-(19,25)
(19,10)-(19,25)
(19,19)-(19,20)
(19,24)-(19,25)
(19,31)-(19,37)
(19,31)-(19,40)
(19,38)-(19,40)
(19,46)-(19,52)
(19,46)-(19,55)
(19,53)-(19,55)
(21,6)-(22,51)
(21,6)-(22,51)
(21,16)-(21,20)
(21,16)-(21,27)
(21,22)-(21,23)
(21,22)-(21,27)
(21,25)-(21,27)
(22,6)-(22,51)
(22,6)-(22,51)
(22,12)-(22,15)
(22,28)-(22,33)
(22,28)-(22,51)
(22,28)-(22,51)
(22,35)-(22,39)
(22,35)-(22,51)
(22,42)-(22,47)
(22,42)-(22,51)
(22,50)-(22,51)
*)

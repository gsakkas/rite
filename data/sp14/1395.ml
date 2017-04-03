
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
(19,9)-(19,13)
*)

(* type error slice
(18,14)-(18,18)
(18,14)-(18,26)
(19,8)-(19,20)
(19,9)-(19,13)
*)

(* all spans
(11,11)-(11,20)
(11,16)-(11,20)
(13,11)-(13,20)
(13,16)-(13,20)
(15,15)-(22,53)
(16,2)-(22,53)
(16,5)-(16,14)
(16,5)-(16,10)
(16,13)-(16,14)
(18,4)-(19,55)
(18,14)-(18,26)
(18,14)-(18,18)
(18,19)-(18,26)
(18,20)-(18,21)
(18,23)-(18,25)
(19,4)-(19,55)
(19,8)-(19,24)
(19,8)-(19,20)
(19,9)-(19,13)
(19,18)-(19,19)
(19,23)-(19,24)
(19,30)-(19,39)
(19,30)-(19,36)
(19,37)-(19,39)
(19,45)-(19,54)
(19,45)-(19,51)
(19,52)-(19,54)
(21,4)-(22,53)
(21,15)-(21,27)
(21,15)-(21,19)
(21,20)-(21,27)
(21,21)-(21,22)
(21,24)-(21,26)
(22,5)-(22,52)
(22,11)-(22,14)
(22,27)-(22,52)
(22,27)-(22,32)
(22,33)-(22,52)
(22,34)-(22,38)
(22,40)-(22,51)
(22,41)-(22,46)
(22,49)-(22,50)
*)

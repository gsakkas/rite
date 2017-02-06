
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
  match depth with
  | 0 -> if (rand (0, 1)) = 0 then buildX () else buildY ()
  | _ ->
      let y = rand (2, 6) in
      if y = 2 then buildSine (build (rand, (depth - 1)));;


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
  | 0 -> if (rand (0, 1)) = 0 then buildX () else buildY ()
  | _ -> buildX ();;

*)

(* changed spans
(11,15)-(11,25)
(11,19)-(11,25)
(11,24)-(11,25)
(21,7)-(22,55)
*)

(* type error slice
(11,4)-(11,27)
(11,15)-(11,25)
(11,24)-(11,25)
(13,4)-(13,23)
(13,12)-(13,21)
(15,4)-(15,23)
(15,12)-(15,21)
(17,16)-(22,55)
(18,3)-(22,55)
(18,9)-(18,14)
(19,10)-(19,60)
(19,10)-(19,60)
(19,14)-(19,18)
(19,14)-(19,24)
(19,14)-(19,30)
(19,36)-(19,42)
(19,36)-(19,45)
(19,51)-(19,57)
(19,51)-(19,60)
(22,7)-(22,55)
(22,21)-(22,30)
(22,21)-(22,55)
(22,32)-(22,37)
(22,32)-(22,55)
(22,46)-(22,51)
*)

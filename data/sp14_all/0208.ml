
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
(21,7)-(22,58)
buildX ()
AppG [ConAppG Nothing]

*)

(* type error slice
(11,4)-(11,27)
(11,15)-(11,25)
(11,19)-(11,25)
(15,4)-(15,23)
(15,12)-(15,21)
(15,17)-(15,21)
(18,3)-(22,58)
(19,10)-(19,60)
(19,51)-(19,57)
(19,51)-(19,60)
(21,7)-(22,58)
(22,7)-(22,58)
(22,21)-(22,30)
(22,21)-(22,58)
(22,58)-(22,58)
*)

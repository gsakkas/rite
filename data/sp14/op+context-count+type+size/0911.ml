
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
  | _ -> let y = rand (2, 6) in build (rand, (y - 1));;

*)

(* changed spans
(11,14)-(11,24)
(11,18)-(11,24)
(11,23)-(11,24)
(21,6)-(22,57)
(22,6)-(22,57)
(22,9)-(22,10)
(22,9)-(22,14)
(22,13)-(22,14)
*)

(* type error slice
(11,3)-(11,26)
(11,14)-(11,24)
(11,18)-(11,24)
(22,6)-(22,57)
(22,6)-(22,57)
(22,6)-(22,57)
(22,20)-(22,29)
(22,20)-(22,57)
*)

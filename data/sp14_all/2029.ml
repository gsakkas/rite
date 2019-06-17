
let y f g x = f (g x);;

let rec mulByDigit i l =
  let f a x =
    match a with
    | [] -> (i * x) :: a
    | h::t -> [(x * y) + (h / 10); h mod 10] @ t in
  let base = [] in let args = List.rev (0 :: l) in List.fold_left f base args;;


(* fix

let rec mulByDigit i l =
  let f a x =
    match a with
    | [] -> (i * x) :: a
    | h::t -> [(i * x) + (h / 10); h mod 10] @ t in
  let base = [] in let args = List.rev (0 :: l) in List.fold_left f base args;;

*)

(* changed spans
(8,17)-(8,18)
i
VarG

(8,21)-(8,22)
x
VarG

*)

(* type error slice
(2,4)-(2,24)
(2,7)-(2,22)
(8,16)-(8,23)
(8,21)-(8,22)
*)


let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let rec mulByDigit i l =
  let f a x =
    match a with
    | [] -> (i * x) :: a
    | h::t -> [(i * x) + (h / 10); h mod 10] @ t in
  let base = [] in
  let args = List.rev (0 :: l) in removeZero List.fold_left f base args;;


(* fix

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let rec mulByDigit i l =
  let f a x =
    match a with
    | [] -> (i * x) :: a
    | h::t -> [(i * x) + (h / 10); h mod 10] @ t in
  let base = [] in
  let args = List.rev (0 :: l) in removeZero (List.fold_left f base args);;

*)

(* changed spans
(11,35)-(11,72)
removeZero (List.fold_left f
                           base args)
AppG [AppG [EmptyG,EmptyG,EmptyG]]

*)

(* type error slice
(3,3)-(3,58)
(3,9)-(3,10)
(3,37)-(3,47)
(3,37)-(3,49)
(3,57)-(3,58)
(11,35)-(11,45)
(11,35)-(11,72)
*)

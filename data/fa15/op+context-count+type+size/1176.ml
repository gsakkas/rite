
let rec mulByDigit i l =
  let f a x =
    let c = i * x in match a with | [] -> [] | h::t -> (h * i) mod 10 in
  let base = [] in
  let args = List.rev l in let res = List.fold_left f base args in res;;


(* fix

let rec mulByDigit i l =
  let f a x =
    let c = i * x in match a with | [] -> [] | h::t -> ((h * i) mod 10) :: t in
  let base = [] in
  let args = List.rev l in let res = List.fold_left f base args in res;;

*)

(* changed spans
(4,57)-(4,70)
(5,3)-(6,71)
*)

(* type error slice
(4,22)-(4,70)
(4,22)-(4,70)
(4,43)-(4,45)
(4,57)-(4,70)
*)

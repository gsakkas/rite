
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
(4,55)-(4,69)
(5,2)-(6,70)
*)

(* type error slice
(4,21)-(4,69)
(4,21)-(4,69)
(4,42)-(4,44)
(4,55)-(4,69)
*)

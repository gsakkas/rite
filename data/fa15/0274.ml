
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
(4,42)-(4,44)
(4,55)-(4,69)
*)

(* all spans
(2,19)-(6,70)
(2,21)-(6,70)
(3,2)-(6,70)
(3,8)-(4,69)
(3,10)-(4,69)
(4,4)-(4,69)
(4,12)-(4,17)
(4,12)-(4,13)
(4,16)-(4,17)
(4,21)-(4,69)
(4,27)-(4,28)
(4,42)-(4,44)
(4,55)-(4,69)
(4,55)-(4,62)
(4,56)-(4,57)
(4,60)-(4,61)
(4,67)-(4,69)
(5,2)-(6,70)
(5,13)-(5,15)
(6,2)-(6,70)
(6,13)-(6,23)
(6,13)-(6,21)
(6,22)-(6,23)
(6,27)-(6,70)
(6,37)-(6,63)
(6,37)-(6,51)
(6,52)-(6,53)
(6,54)-(6,58)
(6,59)-(6,63)
(6,67)-(6,70)
*)

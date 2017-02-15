
let rec sumList xs =
  if (List.hd xs) = [] then 0 else (let h::t = xs in h + (sumList t));;


(* fix

let rec sumList xs =
  if xs = [] then 0 else (let h::t = xs in h + (sumList t));;

*)

(* changed spans
(3,5)-(3,17)
(3,6)-(3,13)
(3,35)-(3,69)
*)

(* type error slice
(3,5)-(3,17)
(3,5)-(3,22)
(3,5)-(3,22)
(3,6)-(3,13)
(3,14)-(3,16)
(3,20)-(3,22)
(3,35)-(3,69)
(3,35)-(3,69)
(3,47)-(3,49)
(3,53)-(3,54)
(3,53)-(3,68)
*)

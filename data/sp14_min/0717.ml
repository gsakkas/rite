
let rec sumList xs =
  if (List.hd xs) = [] then 0 else (let h::t = xs in h + (sumList t));;


(* fix

let rec sumList xs =
  if xs = [] then 0 else (let h::t = xs in h + (sumList t));;

*)

(* changed spans
(3,6)-(3,18)
xs
VarG

*)

(* type error slice
(3,6)-(3,18)
(3,6)-(3,23)
(3,7)-(3,14)
(3,15)-(3,17)
(3,21)-(3,23)
(3,36)-(3,70)
(3,48)-(3,50)
(3,54)-(3,55)
(3,54)-(3,69)
*)

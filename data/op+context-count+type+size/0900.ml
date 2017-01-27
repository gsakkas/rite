
let rec sumList xs =
  if (List.hd xs) = [] then 0 else (let h::t = xs in h + (sumList t));;


(* fix

let rec sumList xs =
  if xs = [] then 0 else (let h::t = xs in h + (sumList t));;

*)

(* changed spans
(3,7)-(3,14)
(3,7)-(3,17)
*)

(* type error slice
(3,7)-(3,14)
(3,7)-(3,17)
(3,15)-(3,17)
(3,37)-(3,68)
(3,48)-(3,50)
(3,54)-(3,55)
(3,54)-(3,68)
*)


let rec sumList xs =
  if xs = [] then 0 else (List.hd xs) + (sumList List.tl xs);;


(* fix

let rec sumList xs =
  if xs = [] then 0 else (let h::t = xs in h + (sumList t));;

*)

(* changed spans
(3,27)-(3,34)
(3,27)-(3,37)
(3,27)-(3,60)
(3,35)-(3,37)
(3,42)-(3,60)
(3,50)-(3,57)
(3,58)-(3,60)
*)

(* type error slice
(2,4)-(3,63)
(2,17)-(3,60)
(3,27)-(3,34)
(3,27)-(3,37)
(3,35)-(3,37)
(3,42)-(3,49)
(3,42)-(3,60)
(3,50)-(3,57)
*)

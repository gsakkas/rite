
let rec sumList xs =
  if xs = [] then 0 else (List.hd xs) + (sumList List.tl xs);;


(* fix

let rec sumList xs =
  if xs = [] then 0 else (let h::t = xs in h + (sumList t));;

*)

(* changed spans
(3,25)-(3,37)
(3,25)-(3,60)
(3,26)-(3,33)
(3,34)-(3,36)
(3,40)-(3,60)
(3,49)-(3,56)
(3,57)-(3,59)
*)

(* type error slice
(2,3)-(3,62)
(2,16)-(3,60)
(3,25)-(3,37)
(3,26)-(3,33)
(3,34)-(3,36)
(3,40)-(3,60)
(3,41)-(3,48)
(3,49)-(3,56)
*)

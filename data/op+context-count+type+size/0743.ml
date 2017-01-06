
let rec clone x n =
  let acc = [] in if n = 0 then acc else (clone x) :: ((acc n) - 1);;



let rec clone x n = let accum = [] in if n < 1 then [] else clone x n;;


(* changed spans
(3,7)-(3,10)
(3,24)-(3,27)
(3,33)-(3,36)
(3,42)-(3,43)
(3,50)-(3,60)
(3,62)-(3,68)
*)

(* type error slice
(3,3)-(3,67)
(3,57)-(3,62)
*)

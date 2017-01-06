
let rec clone x n =
  let acc = [] in if x = 0 then acc else acc :: ((clone x n) - 1);;



let rec clone x n = let accum = [] in if n < 1 then [] else clone x n;;


(* changed spans
(3,7)-(3,10)
(3,22)-(3,27)
(3,33)-(3,36)
(3,42)-(3,51)
(3,60)-(3,66)
*)

(* type error slice
(3,42)-(3,65)
*)

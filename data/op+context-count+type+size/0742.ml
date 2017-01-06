
let rec clone x n =
  let accum = [] in if n < 1 then [] else (clone x) :: ((accum n) - 1);;



let rec clone x n = let accum = [] in if n < 1 then [] else clone x n;;


(* changed spans
(3,43)-(3,44)
(3,51)-(3,63)
(3,65)-(3,71)
*)

(* type error slice
(3,3)-(3,70)
(3,58)-(3,65)
*)

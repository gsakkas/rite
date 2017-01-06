
let rec clone x n =
  let accum = [] in if n < 1 then [] else (clone x) :: (accum (n - 1));;



let rec clone x n =
  let accum = [] in
  let helper x n = if n < 1 then accum else x :: accum in helper x (n - 1);;


(* changed spans
(3,35)-(3,37)
(3,43)-(3,49)
(3,51)-(3,52)
(3,56)-(3,57)
(3,70)-(3,71)
*)

(* type error slice
(3,3)-(3,69)
(3,57)-(3,69)
*)

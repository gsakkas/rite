
let rec clone x n =
  let accum = [] in if n < 1 then [] else clone (x :: accum) (n - 1);;


(* fix

let rec clone x n =
  let accum = [] in
  let helper x n = if n < 1 then accum else x :: accum in helper x (n - 1);;

*)

(* changed spans
(3,21)-(3,68)
(3,35)-(3,37)
(3,43)-(3,48)
(3,43)-(3,68)
(3,63)-(3,64)
(3,63)-(3,68)
(3,67)-(3,68)
*)

(* type error slice
(2,4)-(3,71)
(2,15)-(3,68)
(2,17)-(3,68)
(3,3)-(3,68)
(3,21)-(3,68)
(3,24)-(3,25)
(3,24)-(3,29)
(3,28)-(3,29)
(3,35)-(3,37)
(3,43)-(3,48)
(3,43)-(3,68)
(3,50)-(3,60)
(3,63)-(3,68)
*)

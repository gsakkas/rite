
let rec clone x n =
  let rec helper acc n' = if n <= 0 then [] else (helper x) :: (acc (n' - 1)) in
  helper [x] (n - 1);;


(* fix

let rec clone x n =
  let rec helper acc n' = if n <= 0 then [] else helper (x :: acc) (n' - 1) in
  helper [x] (n - 1);;

*)

(* changed spans
(3,49)-(3,59)
(3,49)-(3,77)
(3,57)-(3,58)
(3,63)-(3,77)
*)

(* type error slice
(3,2)-(4,20)
(3,17)-(3,77)
(3,21)-(3,77)
(3,26)-(3,77)
(3,49)-(3,59)
(3,49)-(3,77)
(3,49)-(3,77)
(3,50)-(3,56)
(3,57)-(3,58)
(4,2)-(4,8)
(4,2)-(4,20)
(4,9)-(4,12)
(4,9)-(4,12)
(4,10)-(4,11)
*)

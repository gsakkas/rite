
let rec clone x n =
  let aux acc n = if n <= 0 then acc else clone (List.append [x] acc) (n - 1) in
  aux [] n;;


(* fix

let rec clone x n =
  let rec aux acc n =
    if n <= 0 then acc else aux (List.append [x] acc) (n - 1) in
  aux [] n;;

*)

(* changed spans
(3,3)-(4,11)
(3,43)-(3,48)
*)

(* type error slice
(2,4)-(4,13)
(2,15)-(4,11)
(3,43)-(3,48)
(3,43)-(3,77)
(3,50)-(3,61)
(3,50)-(3,69)
(3,62)-(3,65)
(3,62)-(3,65)
(3,63)-(3,64)
*)

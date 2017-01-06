
let rec clone x n =
  let aux acc n = if n <= 0 then acc else clone (List.append [x] acc) (n - 1) in
  aux [] n;;



let rec clone x n =
  let rec aux acc n =
    if n <= 0 then acc else aux (List.append [x] acc) (n - 1) in
  aux [] n;;


(* changed spans
(3,43)-(3,48)
*)

(* type error slice
(3,50)-(3,69)
*)


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
(3,2)-(4,10)
let rec aux =
  fun acc ->
    fun n ->
      if n <= 0
      then acc
      else aux (List.append [x] acc)
               (n - 1) in
aux [] n
LetG Rec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(3,42)-(3,47)
aux
VarG

*)


let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t when h == 0 -> removeZero t | h::t -> h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match (a, x) with | ((w,b),(y,z)) -> ((y + z), (b @ w)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t when h == 0 -> removeZero t | h::t -> h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match (a, x) with | ((w,b),(y,z)) -> ((y + z), (b @ [w])) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,69)-(16,70)
[w]
ListG [VarG]

*)

(* type error slice
(16,5)-(19,52)
(16,11)-(16,72)
(16,13)-(16,72)
(16,17)-(16,72)
(16,23)-(16,29)
(16,24)-(16,25)
(16,54)-(16,72)
(16,55)-(16,62)
(16,64)-(16,71)
(16,67)-(16,68)
(16,69)-(16,70)
(19,19)-(19,33)
(19,19)-(19,45)
(19,34)-(19,35)
*)

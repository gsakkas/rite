
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
    let f a x =
      match (a, x) with | ((w,b),(y,z)) -> b @ ((w mod 10) :: (w / 10)) in
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
    let f a x =
      match (a, x) with
      | ((w,b),(y,z)) -> ((y + z), (b @ ([w mod 10] @ [w / 10]))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(17,44)-(17,70)
(17,50)-(17,58)
(17,50)-(17,70)
(17,64)-(17,70)
(18,5)-(20,52)
(19,5)-(20,52)
(20,5)-(20,52)
(21,15)-(21,18)
(21,20)-(21,27)
(21,20)-(21,33)
(21,28)-(21,30)
(21,31)-(21,33)
*)

(* type error slice
(16,5)-(20,52)
(16,11)-(17,70)
(16,13)-(17,70)
(17,7)-(17,70)
(17,7)-(17,70)
(17,14)-(17,15)
(17,14)-(17,18)
(17,44)-(17,70)
(17,46)-(17,47)
(17,50)-(17,70)
(17,64)-(17,70)
(20,19)-(20,33)
(20,19)-(20,45)
(20,34)-(20,35)
*)

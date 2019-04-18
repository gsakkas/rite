
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
      | ((w,b),(y,z)) -> ((((w + y) + z) / 10), (((y + z) mod 10) :: b)) in
    let base = (0, []) in
    let args = List.rev ((List.combine 0) :: (l1 0) :: l2) in
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
      | ((w,b),(y,z)) -> ((((w + y) + z) / 10), (((y + z) mod 10) :: b)) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,25)-(20,59)
List.combine (0 :: l1)
             (0 :: l2)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(16,5)-(21,52)
(16,11)-(18,73)
(16,13)-(18,73)
(17,7)-(18,73)
(17,13)-(17,19)
(17,17)-(17,18)
(20,5)-(21,52)
(20,16)-(20,24)
(20,16)-(20,59)
(20,25)-(20,59)
(20,26)-(20,42)
(20,27)-(20,39)
(20,40)-(20,41)
(21,19)-(21,33)
(21,19)-(21,45)
(21,34)-(21,35)
(21,41)-(21,45)
*)

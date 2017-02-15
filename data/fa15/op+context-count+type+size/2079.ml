
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
(20,24)-(20,58)
(20,25)-(20,41)
(20,39)-(20,40)
(20,45)-(20,51)
(20,49)-(20,50)
*)

(* type error slice
(16,4)-(21,51)
(16,10)-(18,72)
(16,12)-(18,72)
(17,6)-(18,72)
(17,12)-(17,18)
(17,16)-(17,17)
(20,4)-(21,51)
(20,15)-(20,23)
(20,15)-(20,58)
(20,24)-(20,58)
(20,24)-(20,58)
(20,25)-(20,41)
(20,26)-(20,38)
(20,39)-(20,40)
(21,18)-(21,32)
(21,18)-(21,44)
(21,33)-(21,34)
(21,40)-(21,44)
*)

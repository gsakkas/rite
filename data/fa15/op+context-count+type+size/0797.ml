
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | (x1,x2) -> (x1 + x2) :: a in
    let base = ([], []) in
    let args =
      let padZeroLists = padZero l1 l2 in fst padZeroLists snd padZeroLists in
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
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,sum) = a in
      (((x1 + x2) / 10), ((((x1 + x2) + carry) mod 10) :: sum)) in
    let base = (0, []) in
    let args = let (l1',l2') = padZero l1 l2 in List.combine l1' l2' in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,16)-(16,56)
(16,42)-(16,51)
(16,42)-(16,56)
(16,43)-(16,45)
(16,55)-(16,56)
(17,4)-(20,51)
(17,15)-(17,23)
(17,16)-(17,18)
(18,4)-(20,51)
(19,6)-(19,75)
(19,25)-(19,38)
(19,42)-(19,45)
(19,42)-(19,75)
(19,46)-(19,58)
(19,59)-(19,62)
(19,63)-(19,75)
(20,4)-(20,51)
(20,18)-(20,44)
(21,2)-(21,12)
(21,13)-(21,34)
(21,14)-(21,17)
(21,18)-(21,33)
(21,19)-(21,26)
(21,27)-(21,29)
(21,30)-(21,32)
*)

(* type error slice
(4,3)-(9,45)
(4,12)-(9,43)
(4,15)-(9,43)
(5,2)-(9,43)
(6,2)-(9,43)
(7,2)-(9,43)
(8,7)-(8,43)
(8,8)-(8,10)
(9,8)-(9,38)
(9,33)-(9,34)
(9,35)-(9,37)
(16,4)-(20,51)
(16,10)-(16,56)
(16,42)-(16,56)
(16,55)-(16,56)
(17,4)-(20,51)
(17,15)-(17,23)
(19,6)-(19,75)
(19,25)-(19,32)
(19,25)-(19,38)
(19,42)-(19,45)
(19,42)-(19,75)
(19,46)-(19,58)
(20,18)-(20,32)
(20,18)-(20,44)
(20,33)-(20,34)
(20,35)-(20,39)
*)

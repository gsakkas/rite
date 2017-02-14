
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      if let (y,z) = x in (y + z) > 9
      then [(1, ((let (y,z) = x in (y + z) mod 10)))] @ a
      else (0, (let (y,z) = x in [y + z])) @ a in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      if let (carry,ans) = a in let (y,z) = x in ((y + z) + carry) > 9
      then
        let (carry,ans) = a in
        (1, (let (y,z) = x in [((y + z) + carry) mod 10] @ ans))
      else
        (let (carry,ans) = a in
         (0, (let (y,z) = x in [(y + z) + carry] @ ans))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,9)-(15,37)
(15,21)-(15,22)
(15,27)-(15,28)
(15,36)-(15,37)
(16,11)-(16,53)
(16,11)-(16,57)
(16,12)-(16,52)
(16,16)-(16,51)
(16,35)-(16,49)
(16,36)-(16,37)
(16,47)-(16,49)
(16,54)-(16,55)
(16,56)-(16,57)
(17,11)-(17,46)
(17,15)-(17,41)
(17,33)-(17,40)
(17,34)-(17,35)
(17,43)-(17,44)
(17,45)-(17,46)
(18,4)-(20,51)
(18,15)-(18,22)
(19,4)-(20,51)
(20,4)-(20,51)
(21,2)-(21,12)
(21,13)-(21,34)
(21,14)-(21,17)
(21,18)-(21,33)
(21,19)-(21,26)
(21,27)-(21,29)
(21,30)-(21,32)
*)

(* type error slice
(14,4)-(20,51)
(14,10)-(17,46)
(16,11)-(16,57)
(16,54)-(16,55)
(16,56)-(16,57)
(17,11)-(17,42)
(17,11)-(17,46)
(17,43)-(17,44)
(18,4)-(20,51)
(18,15)-(18,22)
(20,18)-(20,32)
(20,18)-(20,44)
(20,33)-(20,34)
(20,35)-(20,39)
*)

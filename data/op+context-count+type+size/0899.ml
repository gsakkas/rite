
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diffsize = (List.length l1) - (List.length l2) in
  if diffsize > 0
  then (l1, (List.append (clone 0 diffsize) l2))
  else ((List.append (clone 0 ((-1) * diffsize)) l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (h1,h2) -> (removeZero (((h1 + h2) / 10) :: ((h1 + h2) mod 10))) :: a
      | _ -> a in
    let base = [] in
    let args = List.combine l1 l2 in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diffsize = (List.length l1) - (List.length l2) in
  if diffsize > 0
  then (l1, (List.append (clone 0 diffsize) l2))
  else ((List.append (clone 0 ((-1) * diffsize)) l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (h1,h2) -> ((h1 + h2) / 10) :: ((h1 + h2) mod 10) :: a
      | _ -> a in
    let base = [] in
    let args = List.combine l1 l2 in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(17,21)-(17,31)
(17,21)-(17,70)
(17,35)-(17,70)
(17,55)-(17,70)
*)

(* type error slice
(2,50)-(2,55)
(2,50)-(2,64)
(2,56)-(2,57)
(2,59)-(2,64)
(4,4)-(8,60)
(4,17)-(8,57)
(4,20)-(8,57)
(5,3)-(8,57)
(5,19)-(5,30)
(5,19)-(5,33)
(5,19)-(5,52)
(5,31)-(5,33)
(5,38)-(5,49)
(5,38)-(5,52)
(5,50)-(5,52)
(6,3)-(8,57)
(7,9)-(7,11)
(7,9)-(7,47)
(7,14)-(7,25)
(7,14)-(7,47)
(7,27)-(7,32)
(7,27)-(7,43)
(7,33)-(7,34)
(7,35)-(7,43)
(7,45)-(7,47)
(11,3)-(11,75)
(11,51)-(11,61)
(11,51)-(11,63)
(11,62)-(11,63)
(14,3)-(22,33)
(14,12)-(21,48)
(15,5)-(21,48)
(15,11)-(18,15)
(15,13)-(18,15)
(16,7)-(18,15)
(16,13)-(16,14)
(17,21)-(17,31)
(17,21)-(17,70)
(17,21)-(17,78)
(17,35)-(17,37)
(17,35)-(17,42)
(17,35)-(17,48)
(17,35)-(17,70)
(17,40)-(17,42)
(17,55)-(17,70)
(17,77)-(17,78)
(19,5)-(21,48)
(19,16)-(19,18)
(20,5)-(21,48)
(20,16)-(20,28)
(20,16)-(20,34)
(20,29)-(20,31)
(20,32)-(20,34)
(21,5)-(21,48)
(21,15)-(21,29)
(21,15)-(21,41)
(21,30)-(21,31)
(21,32)-(21,36)
(21,37)-(21,41)
(21,45)-(21,48)
(22,3)-(22,13)
(22,3)-(22,33)
(22,15)-(22,18)
(22,15)-(22,33)
(22,20)-(22,27)
(22,20)-(22,33)
(22,28)-(22,30)
(22,31)-(22,33)
*)

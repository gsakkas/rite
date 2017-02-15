
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
      | (h1::t1,h2::t2) -> ((h1 + h2) / 10) :: ((h1 + h2) mod 10) :: a
      | _ -> a in
    let base = [0] in
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
(16,6)-(18,14)
(19,15)-(19,18)
(19,16)-(19,17)
*)

(* type error slice
(2,43)-(2,44)
(2,43)-(2,65)
(2,43)-(2,65)
(2,48)-(2,65)
(2,49)-(2,54)
(2,55)-(2,56)
(4,3)-(8,59)
(4,16)-(8,57)
(4,19)-(8,57)
(5,2)-(8,57)
(6,2)-(8,57)
(7,7)-(7,48)
(7,12)-(7,47)
(7,13)-(7,24)
(7,25)-(7,43)
(7,26)-(7,31)
(7,32)-(7,33)
(14,2)-(22,34)
(14,11)-(21,47)
(15,4)-(21,47)
(15,10)-(18,14)
(15,12)-(18,14)
(16,6)-(18,14)
(16,6)-(18,14)
(16,12)-(16,13)
(20,4)-(21,47)
(20,15)-(20,27)
(20,15)-(20,33)
(20,31)-(20,33)
(21,14)-(21,28)
(21,14)-(21,40)
(21,29)-(21,30)
(21,36)-(21,40)
(22,13)-(22,34)
(22,14)-(22,17)
(22,18)-(22,33)
(22,19)-(22,26)
*)

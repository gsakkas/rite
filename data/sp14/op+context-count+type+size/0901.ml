
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
(17,19)-(17,72)
(17,20)-(17,30)
(17,31)-(17,71)
(17,52)-(17,70)
*)

(* type error slice
(11,2)-(11,74)
(11,2)-(11,74)
(11,36)-(11,74)
(11,36)-(11,74)
(11,50)-(11,60)
(11,50)-(11,62)
(11,61)-(11,62)
(11,68)-(11,69)
(11,68)-(11,74)
(11,68)-(11,74)
(14,2)-(22,34)
(14,11)-(21,47)
(15,4)-(21,47)
(15,4)-(21,47)
(15,10)-(18,14)
(17,19)-(17,72)
(17,19)-(17,77)
(17,19)-(17,77)
(17,20)-(17,30)
(17,31)-(17,71)
(17,52)-(17,70)
(17,76)-(17,77)
(19,4)-(21,47)
(20,4)-(21,47)
(21,4)-(21,47)
(21,4)-(21,47)
(21,14)-(21,28)
(21,14)-(21,40)
(21,29)-(21,30)
(21,44)-(21,47)
(22,2)-(22,12)
(22,2)-(22,34)
(22,13)-(22,34)
(22,14)-(22,17)
*)


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
      | (h1,h2) -> (removeZero [(h1 + h2) / 10; (h1 + h2) mod 10]) :: a
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
(17,21)-(17,66)
(17,32)-(17,66)
(17,50)-(17,65)
*)

(* type error slice
(11,3)-(11,75)
(11,3)-(11,75)
(11,37)-(11,75)
(11,37)-(11,75)
(11,51)-(11,61)
(11,51)-(11,63)
(11,62)-(11,63)
(11,69)-(11,70)
(11,69)-(11,75)
(11,69)-(11,75)
(14,3)-(22,33)
(14,12)-(21,48)
(15,5)-(21,48)
(15,5)-(21,48)
(15,11)-(18,15)
(17,21)-(17,31)
(17,21)-(17,66)
(17,21)-(17,72)
(17,21)-(17,72)
(17,71)-(17,72)
(19,5)-(21,48)
(20,5)-(21,48)
(21,5)-(21,48)
(21,5)-(21,48)
(21,15)-(21,29)
(21,15)-(21,41)
(21,30)-(21,31)
(21,45)-(21,48)
(22,3)-(22,13)
(22,3)-(22,33)
(22,15)-(22,18)
(22,15)-(22,33)
*)

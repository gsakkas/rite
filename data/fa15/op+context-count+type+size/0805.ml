
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
  let add (l1',l2') =
    let f a x =
      let (x1,x2) = x in
      let (carry,acc) = a in
      let sum = (x1 + x2) + carry in ((sum / 10), (acc :: (sum mod 10))) in
    let base = (0, []) in
    let args = let (l1',l2') = padZero l1 l2 in List.combine l2' l1' in
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
      let (carry,acc) = a in
      let (x1,x2) = x in
      let sum = (x1 + x2) + carry in ((sum / 10), ((sum mod 10) :: acc)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,11)-(22,51)
(17,6)-(19,72)
(17,20)-(17,21)
(18,6)-(19,72)
(19,6)-(19,72)
(19,51)-(19,54)
(20,4)-(22,51)
(21,15)-(21,68)
(21,31)-(21,38)
(21,48)-(21,60)
(21,48)-(21,68)
(21,61)-(21,64)
(21,65)-(21,68)
(23,19)-(23,26)
*)

(* type error slice
(16,4)-(22,51)
(16,10)-(19,72)
(16,12)-(19,72)
(17,6)-(19,72)
(18,6)-(19,72)
(18,6)-(19,72)
(18,24)-(18,25)
(19,6)-(19,72)
(19,37)-(19,72)
(19,50)-(19,71)
(19,50)-(19,71)
(19,50)-(19,71)
(19,51)-(19,54)
(19,58)-(19,70)
(22,18)-(22,32)
(22,18)-(22,44)
(22,33)-(22,34)
*)

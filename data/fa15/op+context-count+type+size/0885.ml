
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
(15,12)-(22,52)
(17,7)-(19,70)
(17,21)-(17,22)
(18,7)-(19,70)
(19,7)-(19,70)
(19,52)-(19,55)
(19,60)-(19,70)
(20,5)-(22,52)
(21,16)-(21,69)
(21,32)-(21,39)
(21,49)-(21,61)
(21,49)-(21,69)
(21,62)-(21,65)
(21,66)-(21,69)
*)

(* type error slice
(16,5)-(22,52)
(16,11)-(19,70)
(16,13)-(19,70)
(17,7)-(19,70)
(18,7)-(19,70)
(18,7)-(19,70)
(18,25)-(18,26)
(19,7)-(19,70)
(19,40)-(19,70)
(19,52)-(19,55)
(19,52)-(19,70)
(19,52)-(19,70)
(19,52)-(19,70)
(19,60)-(19,70)
(22,19)-(22,33)
(22,19)-(22,45)
(22,34)-(22,35)
*)

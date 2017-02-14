
let rec clone x n = if n <= 0 then [] else List.append [x] (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then (l1, (List.append (clone 0 (x - y)) l2))
  else if x < y then ((List.append (clone 0 (y - x)) l1), l2) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = ((List.hd l1) + (List.hd l2)) mod 10 in
    let base = 0 in
    let args = ((List.hd l1) + (List.hd l2)) / 10 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else List.append [x] (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then (l1, (List.append (clone 0 (x - y)) l2))
  else if x < y then ((List.append (clone 0 (y - x)) l1), l2) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (lh1,lh2) = x in
      let (carry,res) = a in
      let num = (lh1 + lh2) + carry in ((num / 10), ((num mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,19)-(16,26)
(16,19)-(16,29)
(16,19)-(16,44)
(16,19)-(16,53)
(16,27)-(16,29)
(16,34)-(16,41)
(16,34)-(16,44)
(16,42)-(16,44)
(16,51)-(16,53)
(17,5)-(19,52)
(17,16)-(17,17)
(18,5)-(19,52)
(18,18)-(18,25)
(18,18)-(18,28)
(18,18)-(18,43)
(18,18)-(18,50)
(18,26)-(18,28)
(18,33)-(18,40)
(18,33)-(18,43)
(18,48)-(18,50)
(19,5)-(19,52)
(20,3)-(20,13)
(20,15)-(20,18)
(20,15)-(20,33)
(20,20)-(20,27)
(20,20)-(20,33)
(20,28)-(20,30)
(20,31)-(20,33)
*)

(* type error slice
(18,5)-(19,52)
(18,18)-(18,50)
(19,19)-(19,33)
(19,19)-(19,45)
(19,41)-(19,45)
*)

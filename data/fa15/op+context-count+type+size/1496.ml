
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
    let args = (List.hd l1) + (List.hd l2) in
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
(16,16)-(16,45)
(16,16)-(16,52)
(16,17)-(16,29)
(16,18)-(16,25)
(16,26)-(16,28)
(16,32)-(16,44)
(16,33)-(16,40)
(16,41)-(16,43)
(16,50)-(16,52)
(17,4)-(19,51)
(17,15)-(17,16)
(18,4)-(19,51)
(18,15)-(18,27)
(18,15)-(18,42)
(18,16)-(18,23)
(18,24)-(18,26)
(18,30)-(18,42)
(18,31)-(18,38)
(19,4)-(19,51)
(20,2)-(20,12)
(20,13)-(20,34)
(20,14)-(20,17)
(20,18)-(20,33)
(20,19)-(20,26)
(20,27)-(20,29)
(20,30)-(20,32)
*)

(* type error slice
(18,4)-(19,51)
(18,15)-(18,42)
(19,18)-(19,32)
(19,18)-(19,44)
(19,40)-(19,44)
*)

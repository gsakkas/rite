
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
    let args = List.rev l2 in let (_,res) = List.fold_left f base args in res in
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
(17,4)-(18,77)
(17,15)-(17,16)
(18,4)-(18,77)
(18,15)-(18,26)
(18,24)-(18,26)
(18,30)-(18,77)
(18,44)-(18,58)
(18,44)-(18,70)
(18,59)-(18,60)
(18,61)-(18,65)
(18,66)-(18,70)
(18,74)-(18,77)
(19,2)-(19,12)
(19,2)-(19,34)
(19,13)-(19,34)
(19,14)-(19,17)
(19,19)-(19,26)
*)

(* type error slice
(16,4)-(18,77)
(16,10)-(16,52)
(16,12)-(16,52)
(16,16)-(16,52)
(18,30)-(18,77)
(18,44)-(18,58)
(18,44)-(18,70)
(18,59)-(18,60)
*)

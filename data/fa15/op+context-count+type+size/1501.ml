
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
      let sum = match x with | _ -> (-1) | (first,second) -> first + second in
      match a with | h::t -> [(h + sum) / 10] in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
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
(17,6)-(18,45)
(17,16)-(17,75)
(17,36)-(17,40)
(17,61)-(17,66)
(17,61)-(17,75)
(17,69)-(17,75)
(18,6)-(18,45)
(18,29)-(18,45)
(18,30)-(18,44)
(18,31)-(18,32)
(18,35)-(18,38)
(18,42)-(18,44)
(19,4)-(21,51)
(19,15)-(19,17)
(20,4)-(21,51)
(21,4)-(21,51)
(22,14)-(22,17)
(22,18)-(22,33)
(22,19)-(22,26)
(22,27)-(22,29)
(22,30)-(22,32)
*)

(* type error slice
(16,4)-(21,51)
(16,10)-(18,45)
(18,6)-(18,45)
(18,6)-(18,45)
(18,12)-(18,13)
(21,4)-(21,51)
(21,18)-(21,32)
(21,18)-(21,44)
(21,33)-(21,34)
*)

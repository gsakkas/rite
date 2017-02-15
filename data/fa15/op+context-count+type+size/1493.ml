
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
      let b = (fst x) + (snd x) in
      match a with
      | h::t -> ((h + b) / 10) :: ((h + b) mod 10) :: t
      | _ -> [b / 10; b mod 10] in
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
(17,6)-(20,31)
(17,14)-(17,21)
(17,14)-(17,31)
(17,15)-(17,18)
(17,19)-(17,20)
(17,24)-(17,31)
(17,25)-(17,28)
(18,6)-(20,31)
(19,16)-(19,30)
(19,16)-(19,55)
(19,18)-(19,19)
(19,22)-(19,23)
(19,27)-(19,29)
(19,34)-(19,50)
(19,34)-(19,55)
(19,36)-(19,37)
(19,40)-(19,41)
(19,47)-(19,49)
(19,54)-(19,55)
(20,13)-(20,31)
(20,14)-(20,15)
(20,14)-(20,20)
(20,22)-(20,23)
(20,22)-(20,30)
(21,4)-(23,51)
(21,15)-(21,17)
(22,4)-(23,51)
(23,4)-(23,51)
(24,2)-(24,12)
*)

(* type error slice
(16,4)-(23,51)
(16,10)-(20,31)
(18,6)-(20,31)
(18,6)-(20,31)
(18,12)-(18,13)
(23,4)-(23,51)
(23,18)-(23,32)
(23,18)-(23,44)
(23,33)-(23,34)
*)

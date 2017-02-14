
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
(17,7)-(20,32)
(17,16)-(17,19)
(17,16)-(17,21)
(17,16)-(17,31)
(17,20)-(17,21)
(17,26)-(17,29)
(17,26)-(17,31)
(18,7)-(20,32)
(19,19)-(19,20)
(19,19)-(19,30)
(19,19)-(19,56)
(19,23)-(19,24)
(19,28)-(19,30)
(19,37)-(19,38)
(19,37)-(19,50)
(19,37)-(19,56)
(19,41)-(19,42)
(19,48)-(19,50)
(19,55)-(19,56)
(20,14)-(20,32)
(20,15)-(20,16)
(20,15)-(20,21)
(20,23)-(20,24)
(20,23)-(20,31)
(21,5)-(23,52)
(21,16)-(21,18)
(22,5)-(23,52)
(23,5)-(23,52)
*)

(* type error slice
(16,5)-(23,52)
(16,11)-(20,32)
(18,7)-(20,32)
(18,7)-(20,32)
(18,13)-(18,14)
(23,5)-(23,52)
(23,19)-(23,33)
(23,19)-(23,45)
(23,34)-(23,35)
*)

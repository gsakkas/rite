
let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let rec clone x n = if n < 1 then [] else cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then (((clone 0 ((-1) * diff)) @ l1), l2)
  else if diff > 0 then (l1, ((clone 0 diff) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | hd::tl -> if hd = 0 then removeZero tl else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = padZero l1 l2 in
    let base = List.combine l1 l2 in
    let args = failwith "to be implemented" in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let rec clone x n = if n < 1 then [] else cloneHelper x n [];;

let addition (x,y) = x + y;;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then (((clone 0 ((-1) * diff)) @ l1), l2)
  else if diff > 0 then (l1, ((clone 0 diff) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | hd::tl -> if hd = 0 then removeZero tl else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (m,n) = x in
      let (y,z) = a in (((addition (m, n)) / 10), [(addition (m, n)) mod 10]) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(7,13)-(11,65)
(8,3)-(11,65)
(17,3)-(22,33)
(18,5)-(21,52)
(18,17)-(18,24)
(18,17)-(18,30)
(18,25)-(18,27)
(18,28)-(18,30)
(19,5)-(21,52)
(19,16)-(19,28)
(19,16)-(19,34)
(19,29)-(19,31)
(19,32)-(19,34)
(20,5)-(21,52)
(20,16)-(20,24)
(20,16)-(20,44)
(20,25)-(20,44)
(21,5)-(21,52)
(21,19)-(21,33)
(21,19)-(21,45)
(21,34)-(21,35)
(21,36)-(21,40)
(21,41)-(21,45)
(21,49)-(21,52)
(22,3)-(22,13)
(22,3)-(22,33)
(22,15)-(22,18)
(22,15)-(22,33)
(22,20)-(22,27)
(22,20)-(22,33)
(22,28)-(22,30)
(22,31)-(22,33)
*)

(* type error slice
(7,4)-(11,68)
(7,13)-(11,65)
(7,16)-(11,65)
(8,3)-(11,65)
(9,3)-(11,65)
(10,11)-(10,43)
(18,5)-(21,52)
(18,11)-(18,30)
(18,13)-(18,30)
(18,17)-(18,24)
(18,17)-(18,30)
(19,5)-(21,52)
(19,16)-(19,28)
(19,16)-(19,34)
(21,19)-(21,33)
(21,19)-(21,45)
(21,34)-(21,35)
(21,36)-(21,40)
*)

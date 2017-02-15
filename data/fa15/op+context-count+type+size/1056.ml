
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
    let f a x = List.combine padZero l1 l2 in
    let base = failwith "to be implemented" in
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
(7,12)-(11,65)
(8,2)-(11,65)
(17,2)-(22,34)
(18,4)-(21,51)
(18,16)-(18,28)
(18,16)-(18,42)
(18,29)-(18,36)
(18,37)-(18,39)
(18,40)-(18,42)
(19,4)-(21,51)
(19,15)-(19,23)
(19,15)-(19,43)
(19,24)-(19,43)
(20,4)-(21,51)
(20,15)-(20,23)
(20,15)-(20,43)
(20,24)-(20,43)
(21,4)-(21,51)
(21,18)-(21,32)
(21,18)-(21,44)
(21,33)-(21,34)
(21,35)-(21,39)
(21,40)-(21,44)
(21,48)-(21,51)
(22,2)-(22,12)
(22,2)-(22,34)
(22,13)-(22,34)
(22,14)-(22,17)
(22,18)-(22,33)
(22,19)-(22,26)
(22,27)-(22,29)
(22,30)-(22,32)
*)

(* type error slice
(18,16)-(18,28)
(18,16)-(18,42)
*)


let rec clone x n =
  if n <= 0 then [] else (let y = clone x (n - 1) in x :: y);;

let rec helper curList lt1 lt2 =
  match lt1 with
  | [] -> curList
  | h::t -> helper ((h, (List.hd lt2)) :: curList) t (List.tl lt2);;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x < y
  then (((clone 0 (y - x)) @ l1), l2)
  else (l1, ((clone 0 (x - y)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | x::y -> if x = 0 then removeZero y else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (m,n) = a in let (o,p) = x in ((m + o), (n + p)) in
    let base = (0, 0) in
    let args = helper [] l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  if n <= 0 then [] else (let y = clone x (n - 1) in x :: y);;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x < y
  then (((clone 0 (y - x)) @ l1), l2)
  else (l1, ((clone 0 (x - y)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | x::y -> if x = 0 then removeZero y else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (m,n) = a in
      let (o,p) = x in
      let z = (o + p) + m in
      if z > 9 then (1, ((z - 10) :: n)) else (0, (z :: n)) in
    let base = (0, []) in
    let args =
      let rec helper curList lt1 lt2 =
        match lt1 with
        | [] -> curList
        | h::t -> helper ((h, (List.hd lt2)) :: curList) t (List.tl lt2) in
      helper [] l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(5,16)-(8,66)
(5,24)-(8,66)
(5,28)-(8,66)
(6,3)-(8,66)
(6,9)-(6,12)
(7,11)-(7,18)
(8,13)-(8,19)
(8,13)-(8,66)
(8,22)-(8,23)
(8,22)-(8,37)
(8,22)-(8,50)
(8,26)-(8,33)
(8,26)-(8,37)
(8,34)-(8,37)
(8,43)-(8,50)
(8,52)-(8,53)
(8,55)-(8,62)
(8,55)-(8,66)
(8,63)-(8,66)
(11,3)-(15,36)
(12,3)-(15,36)
(21,3)-(26,33)
(22,5)-(25,52)
(22,17)-(22,67)
(22,34)-(22,67)
(22,53)-(22,54)
(22,53)-(22,67)
(22,57)-(22,58)
(22,62)-(22,63)
(23,5)-(25,52)
(23,17)-(23,18)
(23,17)-(23,21)
(23,20)-(23,21)
(24,5)-(25,52)
(24,16)-(24,22)
(24,16)-(24,31)
(24,26)-(24,28)
(24,29)-(24,31)
(25,5)-(25,52)
(25,19)-(25,33)
(25,19)-(25,45)
(25,34)-(25,35)
(25,36)-(25,40)
(25,41)-(25,45)
(25,49)-(25,52)
(26,3)-(26,13)
(26,3)-(26,33)
(26,15)-(26,18)
(26,15)-(26,33)
(26,20)-(26,27)
(26,20)-(26,33)
(26,28)-(26,30)
*)

(* type error slice
(18,3)-(18,70)
(18,3)-(18,70)
(18,51)-(18,61)
(18,51)-(18,63)
(18,62)-(18,63)
(21,3)-(26,33)
(21,12)-(25,52)
(22,5)-(25,52)
(22,5)-(25,52)
(22,11)-(22,67)
(22,17)-(22,67)
(22,29)-(22,30)
(22,62)-(22,63)
(22,62)-(22,67)
(23,5)-(25,52)
(24,5)-(25,52)
(25,5)-(25,52)
(25,5)-(25,52)
(25,19)-(25,33)
(25,19)-(25,45)
(25,34)-(25,35)
(25,49)-(25,52)
(26,3)-(26,13)
(26,3)-(26,33)
(26,15)-(26,18)
(26,15)-(26,33)
*)

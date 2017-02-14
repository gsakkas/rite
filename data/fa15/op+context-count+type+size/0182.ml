
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
(5,15)-(8,66)
(5,23)-(8,66)
(5,27)-(8,66)
(6,2)-(8,66)
(6,8)-(6,11)
(7,10)-(7,17)
(8,12)-(8,18)
(8,12)-(8,66)
(8,19)-(8,50)
(8,20)-(8,38)
(8,21)-(8,22)
(8,24)-(8,37)
(8,25)-(8,32)
(8,33)-(8,36)
(8,42)-(8,49)
(8,51)-(8,52)
(8,53)-(8,66)
(8,54)-(8,61)
(8,62)-(8,65)
(11,2)-(15,37)
(12,2)-(15,37)
(21,2)-(26,34)
(22,4)-(25,51)
(22,16)-(22,68)
(22,33)-(22,68)
(22,50)-(22,68)
(22,52)-(22,53)
(22,56)-(22,57)
(22,61)-(22,62)
(23,4)-(25,51)
(23,15)-(23,21)
(23,16)-(23,17)
(23,19)-(23,20)
(24,4)-(25,51)
(24,15)-(24,21)
(24,15)-(24,30)
(24,25)-(24,27)
(24,28)-(24,30)
(25,4)-(25,51)
(25,18)-(25,32)
(25,18)-(25,44)
(25,33)-(25,34)
(25,35)-(25,39)
(25,40)-(25,44)
(25,48)-(25,51)
(26,2)-(26,12)
(26,2)-(26,34)
(26,13)-(26,34)
(26,14)-(26,17)
(26,18)-(26,33)
(26,19)-(26,26)
(26,27)-(26,29)
*)

(* type error slice
(18,2)-(18,69)
(18,2)-(18,69)
(18,50)-(18,60)
(18,50)-(18,62)
(18,61)-(18,62)
(21,2)-(26,34)
(21,11)-(25,51)
(22,4)-(25,51)
(22,4)-(25,51)
(22,10)-(22,68)
(22,16)-(22,68)
(22,28)-(22,29)
(22,60)-(22,67)
(22,61)-(22,62)
(23,4)-(25,51)
(24,4)-(25,51)
(25,4)-(25,51)
(25,4)-(25,51)
(25,18)-(25,32)
(25,18)-(25,44)
(25,33)-(25,34)
(25,48)-(25,51)
(26,2)-(26,12)
(26,2)-(26,34)
(26,13)-(26,34)
(26,14)-(26,17)
*)

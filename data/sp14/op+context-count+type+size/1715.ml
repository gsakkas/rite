
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      let tens = (x1 + x2) + (carry / 10) in
      let ones = (x1 + x2) + (carry mod 10) in tens :: ones :: res in
    let base = ([0], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      if carry <> []
      then
        let ch::_ = carry in
        let tens = ((x1 + x2) + ch) / 10 in
        let ones = ((x1 + x2) + ch) mod 10 in ([tens], (tens :: ones :: res))
      else
        (let tens = (x1 + x2) / 10 in
         let ones = (x1 + x2) mod 10 in ([tens], (tens :: ones :: res))) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(22,6)-(23,66)
(22,17)-(22,41)
(22,29)-(22,41)
(22,30)-(22,35)
(23,6)-(23,66)
(23,17)-(23,43)
(23,29)-(23,43)
(23,30)-(23,35)
(23,47)-(23,66)
(24,4)-(26,51)
(24,15)-(24,24)
(24,17)-(24,18)
(24,21)-(24,23)
(25,4)-(26,51)
(25,15)-(25,23)
(25,15)-(25,44)
(25,24)-(25,44)
(25,25)-(25,37)
(25,38)-(25,40)
(25,41)-(25,43)
(26,4)-(26,51)
(26,18)-(26,32)
(26,18)-(26,44)
(26,33)-(26,34)
(26,35)-(26,39)
(26,40)-(26,44)
(26,48)-(26,51)
(27,2)-(27,12)
(27,2)-(27,34)
(27,14)-(27,17)
(27,18)-(27,33)
(27,19)-(27,26)
(27,27)-(27,29)
(27,30)-(27,32)
*)

(* type error slice
(19,4)-(26,51)
(19,10)-(23,66)
(19,12)-(23,66)
(20,6)-(23,66)
(21,6)-(23,66)
(21,6)-(23,66)
(21,24)-(21,25)
(22,6)-(23,66)
(23,6)-(23,66)
(23,47)-(23,66)
(26,18)-(26,32)
(26,18)-(26,44)
(26,33)-(26,34)
*)

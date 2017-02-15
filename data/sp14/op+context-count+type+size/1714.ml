
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
      let ones = (x1 + x2) + (carry mod 10) in
      ([tens], (tens :: ones :: res)) in
    let base = ([0], [0]) in
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
(22,6)-(24,37)
(22,17)-(22,41)
(22,29)-(22,41)
(22,30)-(22,35)
(23,6)-(24,37)
(23,17)-(23,43)
(23,29)-(23,43)
(23,30)-(23,35)
(25,4)-(27,51)
(25,15)-(25,25)
(25,17)-(25,18)
(25,21)-(25,24)
(25,22)-(25,23)
(26,4)-(27,51)
(26,15)-(26,23)
(26,15)-(26,44)
(26,24)-(26,44)
(26,25)-(26,37)
(26,38)-(26,40)
(26,41)-(26,43)
(27,4)-(27,51)
(27,18)-(27,32)
(27,18)-(27,44)
(27,33)-(27,34)
(27,35)-(27,39)
(27,40)-(27,44)
(27,48)-(27,51)
(28,2)-(28,12)
(28,2)-(28,34)
(28,13)-(28,34)
(28,14)-(28,17)
(28,18)-(28,33)
(28,19)-(28,26)
(28,27)-(28,29)
(28,30)-(28,32)
*)

(* type error slice
(19,4)-(27,51)
(19,10)-(24,37)
(19,12)-(24,37)
(20,6)-(24,37)
(21,6)-(24,37)
(21,6)-(24,37)
(21,24)-(21,25)
(22,6)-(24,37)
(22,29)-(22,41)
(22,30)-(22,35)
(23,6)-(24,37)
(24,6)-(24,37)
(24,7)-(24,13)
(27,18)-(27,32)
(27,18)-(27,44)
(27,33)-(27,34)
*)

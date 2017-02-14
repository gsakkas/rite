
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
(22,7)-(24,36)
(22,19)-(22,41)
(22,31)-(22,36)
(22,31)-(22,41)
(23,7)-(24,36)
(23,19)-(23,43)
(23,31)-(23,36)
(23,31)-(23,43)
(25,5)-(27,52)
(25,17)-(25,25)
(25,18)-(25,19)
(25,22)-(25,25)
(25,23)-(25,24)
(26,5)-(27,52)
(26,16)-(26,24)
(26,16)-(26,44)
(26,26)-(26,38)
(26,26)-(26,44)
(26,39)-(26,41)
(26,42)-(26,44)
(27,5)-(27,52)
(27,19)-(27,33)
(27,19)-(27,45)
(27,34)-(27,35)
(27,36)-(27,40)
(27,41)-(27,45)
(27,49)-(27,52)
(28,3)-(28,13)
(28,3)-(28,33)
(28,15)-(28,18)
(28,15)-(28,33)
(28,20)-(28,27)
(28,20)-(28,33)
(28,28)-(28,30)
(28,31)-(28,33)
*)

(* type error slice
(19,5)-(27,52)
(19,11)-(24,36)
(19,13)-(24,36)
(20,7)-(24,36)
(21,7)-(24,36)
(21,7)-(24,36)
(21,25)-(21,26)
(22,7)-(24,36)
(22,31)-(22,36)
(22,31)-(22,41)
(23,7)-(24,36)
(24,8)-(24,14)
(24,8)-(24,36)
(27,19)-(27,33)
(27,19)-(27,45)
(27,34)-(27,35)
*)

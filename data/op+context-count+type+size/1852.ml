
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
      if res <> []
      then
        let lastTens::rest = res in
        (if carry <> []
         then
           let ch::_ = carry in
           let tens = ((x1 + x2) + ch) / 10 in
           let ones = ((x1 + x2) + ch) mod 10 in
           ([tens], (tens :: ones :: rest))
         else
           (let tens = (x1 + x2) / 10 in
            let ones = (x1 + x2) mod 10 in ([tens], (tens :: ones :: rest))))
      else
        if carry <> []
        then
          (let ch::_ = carry in
           let tens = ((x1 + x2) + ch) / 10 in
           let ones = ((x1 + x2) + ch) mod 10 in
           ([tens], (tens :: ones :: res)))
        else
          (let tens = (x1 + x2) / 10 in
           let ones = (x1 + x2) mod 10 in ([tens], (tens :: ones :: res))) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l = if i <> 0 then mulByDigit (i - 1) bigAdd l l else l;;


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
      if res <> []
      then
        let lastTens::rest = res in
        (if carry <> []
         then
           let ch::_ = carry in
           let tens = ((x1 + x2) + ch) / 10 in
           let ones = ((x1 + x2) + ch) mod 10 in
           ([tens], (tens :: ones :: rest))
         else
           (let tens = (x1 + x2) / 10 in
            let ones = (x1 + x2) mod 10 in ([tens], (tens :: ones :: rest))))
      else
        if carry <> []
        then
          (let ch::_ = carry in
           let tens = ((x1 + x2) + ch) / 10 in
           let ones = ((x1 + x2) + ch) mod 10 in
           ([tens], (tens :: ones :: res)))
        else
          (let tens = (x1 + x2) / 10 in
           let ones = (x1 + x2) mod 10 in ([tens], (tens :: ones :: res))) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i <> 0 then mulByDigit (i - 1) (bigAdd l l) else l;;

*)

(* changed spans
(44,17)-(44,19)
(44,21)-(44,23)
(49,41)-(49,70)
(49,60)-(49,66)
*)

(* type error slice
(2,50)-(2,55)
(2,50)-(2,64)
(2,56)-(2,57)
(2,59)-(2,64)
(4,4)-(9,42)
(4,13)-(9,38)
(4,16)-(9,38)
(5,3)-(9,38)
(5,12)-(5,23)
(5,12)-(5,26)
(5,24)-(5,26)
(6,3)-(9,38)
(6,12)-(6,23)
(6,12)-(6,26)
(6,24)-(6,26)
(7,3)-(9,38)
(8,11)-(8,16)
(8,11)-(8,27)
(8,11)-(8,34)
(8,11)-(8,39)
(8,17)-(8,18)
(8,20)-(8,27)
(8,30)-(8,31)
(8,32)-(8,34)
(8,37)-(8,39)
(12,3)-(15,47)
(15,35)-(15,45)
(15,35)-(15,47)
(15,46)-(15,47)
(17,4)-(47,37)
(17,12)-(47,33)
(17,15)-(47,33)
(18,3)-(47,33)
(18,12)-(46,52)
(19,5)-(46,52)
(19,11)-(43,72)
(19,13)-(43,72)
(20,7)-(43,72)
(20,21)-(20,22)
(21,7)-(43,72)
(21,25)-(21,26)
(22,7)-(43,72)
(24,9)-(33,74)
(25,10)-(33,74)
(27,12)-(30,42)
(28,12)-(30,42)
(28,25)-(28,44)
(29,12)-(30,42)
(30,13)-(30,19)
(30,13)-(30,42)
(30,14)-(30,18)
(30,22)-(30,42)
(44,5)-(46,52)
(44,17)-(44,19)
(44,17)-(44,23)
(44,21)-(44,23)
(45,5)-(46,52)
(45,16)-(45,24)
(45,16)-(45,44)
(45,26)-(45,38)
(45,26)-(45,44)
(45,39)-(45,41)
(45,42)-(45,44)
(46,5)-(46,52)
(46,19)-(46,33)
(46,19)-(46,45)
(46,34)-(46,35)
(46,36)-(46,40)
(46,41)-(46,45)
(46,49)-(46,52)
(47,3)-(47,13)
(47,3)-(47,33)
(47,15)-(47,18)
(47,15)-(47,33)
(47,20)-(47,27)
(47,20)-(47,33)
(47,28)-(47,30)
(47,31)-(47,33)
(49,4)-(49,79)
(49,20)-(49,77)
(49,22)-(49,77)
(49,26)-(49,77)
(49,29)-(49,30)
(49,29)-(49,35)
(49,34)-(49,35)
(49,41)-(49,51)
(49,41)-(49,70)
(49,53)-(49,58)
(49,60)-(49,66)
(49,67)-(49,68)
(49,69)-(49,70)
*)

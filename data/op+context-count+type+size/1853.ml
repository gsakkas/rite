
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
      match res with
      | h::t ->
          (match carry with
           | h1::t1 ->
               let tens = ((x1 + x2) + h1) / 10 in
               let ones = ((x1 + x2) + h1) mod 10 in
               ([tens], (tens :: ones :: t))
           | [] ->
               let tens = (x1 + x2) / 10 in
               let ones = (x1 + x2) mod 10 in ([tens], (tens :: ones :: t)))
      | [] ->
          (match carry with
           | h1::t1 ->
               let tens = ((x1 + x2) + h1) / 10 in
               let ones = ((x1 + x2) + h1) mod 10 in
               ([tens], (tens :: ones :: res))
           | [] ->
               let tens = (x1 + x2) / 10 in
               let ones = (x1 + x2) mod 10 in ([tens], (tens :: ones :: res))) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec helper ans i l =
  if i = 0 then ans else helper (bigAdd ans l) (i - 1) l;;

let rec mulByDigit i l = helper 0 i l;;


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
      match res with
      | h::t ->
          (match carry with
           | h1::t1 ->
               let tens = ((x1 + x2) + h1) / 10 in
               let ones = ((x1 + x2) + h1) mod 10 in
               ([tens], (tens :: ones :: t))
           | [] ->
               let tens = (x1 + x2) / 10 in
               let ones = (x1 + x2) mod 10 in ([tens], (tens :: ones :: t)))
      | [] ->
          (match carry with
           | h1::t1 ->
               let tens = ((x1 + x2) + h1) / 10 in
               let ones = ((x1 + x2) + h1) mod 10 in
               ([tens], (tens :: ones :: res))
           | [] ->
               let tens = (x1 + x2) / 10 in
               let ones = (x1 + x2) mod 10 in ([tens], (tens :: ones :: res))) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec helper ans i l =
  if i = 0 then ans else helper (bigAdd ans l) (i - 1) l;;

let rec mulByDigit i l = helper [0] i l;;

*)

(* changed spans
(41,17)-(41,19)
(41,21)-(41,23)
(49,33)-(49,34)
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
(17,4)-(44,37)
(17,12)-(44,33)
(17,15)-(44,33)
(18,3)-(44,33)
(18,12)-(43,52)
(19,5)-(43,52)
(19,11)-(40,76)
(19,13)-(40,76)
(20,7)-(40,76)
(20,21)-(20,22)
(21,7)-(40,76)
(21,25)-(21,26)
(22,7)-(40,76)
(24,12)-(31,74)
(26,16)-(28,43)
(26,29)-(26,48)
(27,16)-(28,43)
(28,17)-(28,23)
(28,17)-(28,43)
(28,18)-(28,22)
(28,26)-(28,43)
(41,5)-(43,52)
(41,17)-(41,19)
(41,17)-(41,23)
(41,21)-(41,23)
(42,5)-(43,52)
(42,16)-(42,24)
(42,16)-(42,44)
(42,26)-(42,38)
(42,26)-(42,44)
(42,39)-(42,41)
(42,42)-(42,44)
(43,5)-(43,52)
(43,19)-(43,33)
(43,19)-(43,45)
(43,34)-(43,35)
(43,36)-(43,40)
(43,41)-(43,45)
(43,49)-(43,52)
(44,3)-(44,13)
(44,3)-(44,33)
(44,15)-(44,18)
(44,15)-(44,33)
(44,20)-(44,27)
(44,20)-(44,33)
(44,28)-(44,30)
(44,31)-(44,33)
(47,26)-(47,32)
(47,26)-(47,57)
(47,34)-(47,40)
(47,34)-(47,46)
(47,41)-(47,44)
(47,45)-(47,46)
(47,49)-(47,54)
(47,56)-(47,57)
(49,26)-(49,32)
(49,26)-(49,38)
(49,33)-(49,34)
(49,35)-(49,36)
(49,37)-(49,38)
*)

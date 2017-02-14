
let rec helper x = if x = 0 then 1 else 10 * (helper (x - 1));;

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in [carry] @ res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f a x =
    let carry = i * x in
    match a with
    | h::t -> ((h + carry) / 10) :: ((h + carry) mod 10) :: t
    | _ -> [carry / 10; carry mod 10] in
  let base = [] in removeZero (List.fold_left f base (List.rev l));;

let rec tenEx x y =
  match y with | [] -> [] | h::t -> (tenEx (x + 1) t) @ [(helper x) * h];;

let bigMul l1 l2 =
  let f a x =
    let (x1,x2) = x in
    let (carry,res) = a in
    match x2 with | [] -> [] | h::t -> bigAdd ((mulByDigit h l1), res) in
  let base = (0, []) in
  let args = l1 (tenEx 0 l2) in
  let (carry,res) = List.fold_left f base args in [carry] @ res;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in [carry] @ res in
  removeZero (add (padZero l1 l2));;

let rec helper l1 l2 =
  match l1 with | [] -> [] | h::t -> (h, l2) :: (helper t l2);;

let rec mulByDigit i l =
  let f a x =
    let carry = i * x in
    match a with
    | h::t -> ((h + carry) / 10) :: ((h + carry) mod 10) :: t
    | _ -> [carry / 10; carry mod 10] in
  let base = [] in removeZero (List.fold_left f base (List.rev l));;

let bigMul l1 l2 =
  let f a x =
    let (x1,x2) = x in
    let (carry,res) = a in
    ((carry @ [0]), (bigAdd ((mulByDigit x1 x2) @ carry) res)) in
  let base = ([], []) in
  let args = List.rev (helper l1 l2) in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(2,19)-(2,61)
(2,22)-(2,23)
(2,22)-(2,27)
(2,26)-(2,27)
(2,33)-(2,34)
(2,40)-(2,42)
(2,40)-(2,61)
(2,45)-(2,61)
(2,46)-(2,52)
(2,53)-(2,60)
(2,54)-(2,55)
(2,58)-(2,59)
(4,14)-(4,65)
(18,2)-(26,34)
(19,4)-(25,65)
(20,6)-(22,73)
(21,6)-(22,73)
(23,4)-(25,65)
(24,4)-(25,65)
(25,4)-(25,65)
(28,19)-(34,66)
(29,2)-(34,66)
(30,4)-(33,37)
(34,2)-(34,66)
(36,14)-(37,72)
(36,16)-(37,72)
(37,2)-(37,72)
(37,8)-(37,9)
(37,23)-(37,25)
(37,36)-(37,53)
(37,36)-(37,72)
(37,37)-(37,42)
(37,43)-(37,50)
(37,44)-(37,45)
(37,48)-(37,49)
(37,51)-(37,52)
(37,54)-(37,55)
(37,56)-(37,72)
(37,57)-(37,67)
(37,57)-(37,71)
(37,58)-(37,64)
(37,65)-(37,66)
(37,70)-(37,71)
(40,2)-(46,63)
(41,4)-(43,70)
(42,4)-(43,70)
(43,4)-(43,70)
(43,10)-(43,12)
(43,26)-(43,28)
(43,39)-(43,45)
(43,39)-(43,70)
(43,48)-(43,58)
(43,59)-(43,60)
(43,61)-(43,63)
(43,66)-(43,69)
(44,2)-(46,63)
(44,14)-(44,15)
(45,2)-(46,63)
*)

(* type error slice
(6,3)-(12,19)
(6,12)-(12,17)
(11,40)-(11,56)
(11,41)-(11,52)
(11,53)-(11,55)
(17,3)-(26,36)
(17,11)-(26,34)
(26,18)-(26,33)
(26,19)-(26,26)
(26,27)-(26,29)
(28,3)-(34,68)
(28,19)-(34,66)
(28,21)-(34,66)
(34,53)-(34,65)
(34,54)-(34,62)
(34,63)-(34,64)
(40,2)-(46,63)
(40,8)-(43,70)
(40,10)-(43,70)
(41,4)-(43,70)
(42,4)-(43,70)
(42,4)-(43,70)
(42,22)-(42,23)
(43,4)-(43,70)
(43,26)-(43,28)
(43,39)-(43,45)
(43,39)-(43,70)
(43,46)-(43,70)
(43,47)-(43,64)
(43,48)-(43,58)
(43,61)-(43,63)
(45,13)-(45,15)
(45,13)-(45,28)
(46,20)-(46,34)
(46,20)-(46,46)
(46,35)-(46,36)
*)


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
    let (carry,res) = a in
    match x with | [] -> [] | h::t -> (0, (bigAdd (mulByDigit h l1) res)) in
  let base = (0, []) in
  let args = tenEx 0 l2 in
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
(2,20)-(2,60)
(2,23)-(2,24)
(2,23)-(2,28)
(2,27)-(2,28)
(2,34)-(2,35)
(2,41)-(2,43)
(2,41)-(2,60)
(2,47)-(2,53)
(2,47)-(2,60)
(2,55)-(2,56)
(2,55)-(2,60)
(2,59)-(2,60)
(4,15)-(4,64)
(18,3)-(26,33)
(19,5)-(25,66)
(20,7)-(22,72)
(21,7)-(22,72)
(23,5)-(25,66)
(24,5)-(25,66)
(25,5)-(25,66)
(28,20)-(34,65)
(29,3)-(34,65)
(30,5)-(33,38)
(34,3)-(34,65)
(36,15)-(37,73)
(36,17)-(37,73)
(37,3)-(37,73)
(37,9)-(37,10)
(37,24)-(37,26)
(37,38)-(37,43)
(37,38)-(37,53)
(37,38)-(37,73)
(37,45)-(37,46)
(37,45)-(37,50)
(37,49)-(37,50)
(37,52)-(37,53)
(37,55)-(37,56)
(37,57)-(37,73)
(37,59)-(37,65)
(37,59)-(37,67)
(37,59)-(37,72)
(37,66)-(37,67)
(37,71)-(37,72)
(40,3)-(45,64)
(41,5)-(42,72)
(41,23)-(41,24)
(42,5)-(42,72)
(42,26)-(42,28)
(42,40)-(42,41)
(42,40)-(42,72)
(42,52)-(42,62)
(42,63)-(42,64)
(42,65)-(42,67)
(42,69)-(42,72)
(43,3)-(45,64)
(43,15)-(43,16)
(44,3)-(45,64)
(44,14)-(44,24)
(45,3)-(45,64)
*)

(* type error slice
(40,3)-(45,64)
(40,9)-(42,72)
(40,11)-(42,72)
(41,5)-(42,72)
(41,5)-(42,72)
(41,23)-(41,24)
(42,5)-(42,72)
(42,5)-(42,72)
(42,26)-(42,28)
(42,40)-(42,72)
(45,21)-(45,35)
(45,21)-(45,47)
(45,36)-(45,37)
*)

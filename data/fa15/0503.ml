
let rec helper l1 l2 =
  match l1 with | [] -> [] | h::t -> (h, l2) :: (helper t l2);;

let bigMul l1 l2 =
  let f a x = let (x1,x2) = x in let (carry,res) = a in carry @ a in
  let base = [] in
  let args = List.rev (helper l1 l2) in
  let (carry,res) = List.fold_left f base args in res;;


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
(2,15)-(3,61)
(3,2)-(3,61)
(3,8)-(3,10)
(3,24)-(3,26)
(5,11)-(9,53)
(6,56)-(6,65)
(6,64)-(6,65)
(7,2)-(9,53)
(7,13)-(7,15)
(8,2)-(9,53)
(9,2)-(9,53)
*)

(* type error slice
(6,2)-(9,53)
(6,8)-(6,65)
(6,33)-(6,65)
(6,51)-(6,52)
(6,56)-(6,65)
(6,62)-(6,63)
(6,64)-(6,65)
(7,2)-(9,53)
(7,13)-(7,15)
(9,20)-(9,34)
(9,20)-(9,46)
(9,35)-(9,36)
(9,37)-(9,41)
*)

(* all spans
(2,15)-(3,61)
(2,18)-(3,61)
(3,2)-(3,61)
(3,8)-(3,10)
(3,24)-(3,26)
(3,37)-(3,61)
(3,37)-(3,44)
(3,38)-(3,39)
(3,41)-(3,43)
(3,48)-(3,61)
(3,49)-(3,55)
(3,56)-(3,57)
(3,58)-(3,60)
(5,11)-(9,53)
(5,14)-(9,53)
(6,2)-(9,53)
(6,8)-(6,65)
(6,10)-(6,65)
(6,14)-(6,65)
(6,28)-(6,29)
(6,33)-(6,65)
(6,51)-(6,52)
(6,56)-(6,65)
(6,62)-(6,63)
(6,56)-(6,61)
(6,64)-(6,65)
(7,2)-(9,53)
(7,13)-(7,15)
(8,2)-(9,53)
(8,13)-(8,36)
(8,13)-(8,21)
(8,22)-(8,36)
(8,23)-(8,29)
(8,30)-(8,32)
(8,33)-(8,35)
(9,2)-(9,53)
(9,20)-(9,46)
(9,20)-(9,34)
(9,35)-(9,36)
(9,37)-(9,41)
(9,42)-(9,46)
(9,50)-(9,53)
*)

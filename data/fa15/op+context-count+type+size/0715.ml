
let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then let z = x - y in (l1, ((clone 0 z) @ l2))
  else (let z = y - x in (((clone 0 z) @ l1), l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (y,z) = a in
      let (r,s) = x in let m = (r + s) + y in ((m / 10), ((m mod 10) :: z)) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> [0] | _ -> bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let (b,c) = a in
    let (o,p) = x in
    let r = bigAdd (mulByDigit o (List.rev l2)) [b] in
    ((r / 10), ((r mod 10) :: b)) in
  let base = (0, []) in
  let args = List.combine (List.rev l1) (List.rev l2) in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then let z = x - y in (l1, ((clone 0 z) @ l2))
  else (let z = y - x in (((clone 0 z) @ l1), l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (y,z) = a in
      let (r,s) = x in let m = (r + s) + y in ((m / 10), ((m mod 10) :: z)) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> [0] | _ -> bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let (b,c) = a in
    let r = bigAdd (mulByDigit x (List.rev l2)) [b] in
    match r with | [] -> (0, (0 :: c)) | h::t -> (h, ((List.hd t) :: c)) in
  let base = (0, []) in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(33,5)-(35,32)
(33,17)-(33,18)
(34,5)-(35,32)
(34,32)-(34,33)
(35,7)-(35,13)
(35,7)-(35,32)
(35,11)-(35,13)
(35,18)-(35,19)
(35,18)-(35,26)
(35,18)-(35,32)
(35,24)-(35,26)
(35,31)-(35,32)
(36,3)-(38,50)
(36,15)-(36,16)
(36,15)-(36,20)
(37,3)-(38,50)
(37,14)-(37,26)
(37,14)-(37,53)
(37,42)-(37,50)
(37,42)-(37,53)
(37,51)-(37,53)
(38,3)-(38,50)
*)

(* type error slice
(3,45)-(3,46)
(3,45)-(3,65)
(3,45)-(3,65)
(3,51)-(3,56)
(3,51)-(3,65)
(3,57)-(3,58)
(5,4)-(10,53)
(5,13)-(10,49)
(5,16)-(10,49)
(9,32)-(9,37)
(9,32)-(9,41)
(9,32)-(9,47)
(9,38)-(9,39)
(9,43)-(9,44)
(9,45)-(9,47)
(15,14)-(15,60)
(15,14)-(15,60)
(15,34)-(15,44)
(15,34)-(15,46)
(15,54)-(15,60)
(17,4)-(25,37)
(17,12)-(25,33)
(17,15)-(25,33)
(18,3)-(25,33)
(25,3)-(25,13)
(25,3)-(25,33)
(25,20)-(25,27)
(25,20)-(25,33)
(25,31)-(25,33)
(34,5)-(35,32)
(34,13)-(34,19)
(34,13)-(34,52)
(34,49)-(34,52)
(34,49)-(34,52)
(34,50)-(34,51)
(35,7)-(35,8)
(35,7)-(35,13)
(35,18)-(35,19)
(35,18)-(35,26)
(35,18)-(35,32)
(35,31)-(35,32)
*)


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
    let r = (mulByDigit o (List.rev l2)) + b in ((r / 10), ((r mod 10) :: b)) in
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
(33,5)-(34,76)
(33,17)-(33,18)
(34,5)-(34,76)
(34,14)-(34,24)
(34,14)-(34,45)
(34,25)-(34,26)
(34,44)-(34,45)
(34,51)-(34,57)
(34,51)-(34,76)
(34,55)-(34,57)
(34,62)-(34,63)
(34,62)-(34,70)
(34,62)-(34,76)
(34,68)-(34,70)
(34,75)-(34,76)
(35,3)-(37,50)
(36,14)-(36,26)
(36,14)-(36,53)
(36,42)-(36,50)
(36,42)-(36,53)
(36,51)-(36,53)
(37,3)-(37,50)
*)

(* type error slice
(5,4)-(10,53)
(5,13)-(10,49)
(5,16)-(10,49)
(9,32)-(9,47)
(9,43)-(9,44)
(9,45)-(9,47)
(17,4)-(25,37)
(17,12)-(25,33)
(17,15)-(25,33)
(25,20)-(25,27)
(25,20)-(25,33)
(25,31)-(25,33)
(28,34)-(28,40)
(28,34)-(28,64)
(28,44)-(28,54)
(28,44)-(28,64)
(34,14)-(34,24)
(34,14)-(34,39)
(34,14)-(34,45)
(34,14)-(34,45)
(34,44)-(34,45)
(34,62)-(34,76)
(34,75)-(34,76)
*)

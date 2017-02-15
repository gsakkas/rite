
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
    let r = [(mulByDigit o (List.rev l2)) + b] in
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
(33,4)-(35,33)
(33,16)-(33,17)
(34,4)-(35,33)
(34,12)-(34,46)
(34,13)-(34,45)
(34,14)-(34,24)
(34,25)-(34,26)
(34,44)-(34,45)
(35,4)-(35,33)
(35,5)-(35,13)
(35,10)-(35,12)
(35,15)-(35,32)
(35,16)-(35,26)
(35,17)-(35,18)
(35,23)-(35,25)
(35,30)-(35,31)
(36,2)-(38,49)
(36,13)-(36,20)
(36,14)-(36,15)
(37,2)-(38,49)
(37,13)-(37,25)
(37,13)-(37,53)
(37,40)-(37,53)
(37,41)-(37,49)
(37,50)-(37,52)
(38,2)-(38,49)
*)

(* type error slice
(5,3)-(10,52)
(5,12)-(10,50)
(5,15)-(10,50)
(9,29)-(9,47)
(9,42)-(9,43)
(9,44)-(9,46)
(17,3)-(25,36)
(17,11)-(25,34)
(17,14)-(25,34)
(25,18)-(25,33)
(25,19)-(25,26)
(25,30)-(25,32)
(28,33)-(28,39)
(28,33)-(28,64)
(28,42)-(28,64)
(28,43)-(28,53)
(34,4)-(35,33)
(34,12)-(34,46)
(34,13)-(34,41)
(34,13)-(34,45)
(34,13)-(34,45)
(34,14)-(34,24)
(34,44)-(34,45)
(35,5)-(35,13)
(35,6)-(35,7)
(35,15)-(35,32)
(35,16)-(35,26)
(35,17)-(35,18)
(35,30)-(35,31)
*)

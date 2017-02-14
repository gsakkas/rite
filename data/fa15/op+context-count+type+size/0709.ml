
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

let rec multHelper l3 l4 x =
  match l3 with
  | [] -> [0]
  | h::t -> bigAdd (mulByDigit h l4) (multHelper t l4 (x + 1));;

let bigMul l1 l2 =
  let f a x = multHelper (List.rev l1) l2 0 in
  let base = (0, []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;


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
(30,19)-(33,62)
(30,22)-(33,62)
(30,25)-(33,62)
(31,2)-(33,62)
(31,8)-(31,10)
(32,10)-(32,13)
(32,11)-(32,12)
(33,12)-(33,62)
(33,31)-(33,32)
(33,33)-(33,35)
(33,37)-(33,62)
(33,38)-(33,48)
(33,49)-(33,50)
(33,51)-(33,53)
(33,54)-(33,61)
(33,59)-(33,60)
(35,11)-(38,75)
(35,14)-(38,75)
(36,2)-(38,75)
(36,8)-(36,43)
(36,10)-(36,43)
(36,14)-(36,24)
(36,14)-(36,43)
(36,35)-(36,37)
(36,42)-(36,43)
(37,2)-(38,75)
(37,13)-(37,20)
(37,14)-(37,15)
(38,2)-(38,75)
(38,22)-(38,24)
(38,28)-(38,75)
(38,42)-(38,68)
*)

(* type error slice
(5,3)-(10,52)
(5,12)-(10,50)
(10,26)-(10,44)
(10,39)-(10,40)
(10,41)-(10,43)
(17,3)-(25,36)
(17,11)-(25,34)
(25,18)-(25,33)
(25,19)-(25,26)
(25,27)-(25,29)
(28,33)-(28,39)
(28,33)-(28,64)
(28,42)-(28,64)
(28,43)-(28,53)
(33,12)-(33,18)
(33,12)-(33,62)
(33,19)-(33,36)
(33,20)-(33,30)
(33,37)-(33,62)
(33,38)-(33,48)
(36,2)-(38,75)
(36,8)-(36,43)
(36,10)-(36,43)
(36,14)-(36,24)
(36,14)-(36,43)
(37,2)-(38,75)
(37,13)-(37,20)
(38,42)-(38,56)
(38,42)-(38,68)
(38,57)-(38,58)
(38,59)-(38,63)
*)

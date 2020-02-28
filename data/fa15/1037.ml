
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
(36,15)-(36,44)
let (b , c) = a in
let r =
  bigAdd (mulByDigit x
                     (List.rev l2)) [b] in
match r with
| [] -> (0 , 0 :: c)
| h :: t -> (h , (List.hd t) :: c)
LetG NonRec [(TuplePatG (fromList [EmptyPatG]),VarG)] (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)

(38,23)-(38,25)
l1
VarG

*)

(* type error slice
(5,4)-(10,53)
(5,13)-(10,51)
(10,27)-(10,45)
(10,40)-(10,41)
(10,42)-(10,44)
(17,4)-(25,37)
(17,12)-(25,35)
(25,19)-(25,34)
(25,20)-(25,27)
(25,28)-(25,30)
(28,34)-(28,40)
(28,34)-(28,65)
(28,43)-(28,65)
(28,44)-(28,54)
(33,13)-(33,19)
(33,13)-(33,63)
(33,20)-(33,37)
(33,21)-(33,31)
(33,38)-(33,63)
(33,39)-(33,49)
(36,3)-(38,76)
(36,9)-(36,44)
(36,11)-(36,44)
(36,15)-(36,25)
(36,15)-(36,44)
(37,3)-(38,76)
(37,14)-(37,21)
(38,43)-(38,57)
(38,43)-(38,69)
(38,58)-(38,59)
(38,60)-(38,64)
*)

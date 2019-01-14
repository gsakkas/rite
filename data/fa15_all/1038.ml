
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
    let r = (mulByDigit o p) + b in ((r / 10), ((r mod 10) :: b)) in
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
(34,4)-(34,65)
bigAdd
VarG

(34,4)-(34,65)
mulByDigit x (List.rev l2)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(34,13)-(34,23)
List.rev
VarG

(34,13)-(34,23)
l2
VarG

(34,13)-(34,23)
List.rev l2
AppG (fromList [VarG])

(34,13)-(34,23)
[b]
ListG VarG Nothing

(34,26)-(34,27)
x
VarG

(34,37)-(34,45)
0
LitG

(34,37)-(34,45)
match r with
| [] -> (0 , 0 :: c)
| h :: t -> (h , (List.hd t) :: c)
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(34,42)-(34,44)
(0 , 0 :: c)
TupleG (fromList [LitG,ConAppG (Just (TupleG (fromList [VarG,LitG]))) Nothing])

(34,49)-(34,50)
c
VarG

(34,49)-(34,50)
h
VarG

(34,49)-(34,50)
List.hd
VarG

(34,49)-(34,50)
t
VarG

(34,49)-(34,50)
c
VarG

(34,49)-(34,50)
List.hd t
AppG (fromList [VarG])

(34,49)-(34,50)
(h , (List.hd t) :: c)
TupleG (fromList [VarG,ConAppG (Just (TupleG (fromList [VarG,AppG (fromList [VarG])]))) Nothing])

(34,49)-(34,50)
(List.hd t) :: c
ConAppG (Just (TupleG (fromList [VarG,AppG (fromList [VarG])]))) Nothing

(34,62)-(34,63)
0
LitG

*)

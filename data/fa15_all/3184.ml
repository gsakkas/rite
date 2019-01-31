
let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      let c::c' = a1 in
      ((a1 @ [((x1 + x2) + c') / 10]), (a2 @ [((x1 + x2) + c') mod 10])) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let c y = y;;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      let c::c' = a1 in
      match c with
      | 0 -> ((a1 @ [(x1 + x2) / 10]), (a2 @ [(x1 + x2) mod 10]))
      | _ -> ((a1 @ [((x1 + x2) + c) / 10]), (a2 @ [((x1 + x2) + c) mod 10])) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(5,12)-(13,41)
y
VarG

(5,12)-(13,41)
fun y -> y
LamG VarG

(26,6)-(26,72)
c
VarG

(26,6)-(26,72)
match c with
| 0 -> (a1 @ [(x1 + x2) / 10] , a2 @ [(x1 + x2) mod 10])
| _ -> (a1 @ [((x1 + x2) + c) / 10] , a2 @ [((x1 + x2) + c) mod 10])
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(26,15)-(26,24)
x1
VarG

(26,15)-(26,24)
x2
VarG

(26,15)-(26,24)
a2
VarG

(26,15)-(26,24)
(@)
VarG

(26,15)-(26,24)
a2 @ [(x1 + x2) mod 10]
AppG (fromList [VarG,ListG EmptyG Nothing])

(26,15)-(26,24)
(x1 + x2) mod 10
BopG (BopG EmptyG EmptyG) LitG

(26,15)-(26,24)
10
LitG

(26,15)-(26,24)
[(x1 + x2) mod 10]
ListG (BopG EmptyG EmptyG) Nothing

(26,39)-(26,71)
(a1 @ [((x1 + x2) + c) / 10] , a2 @ [((x1 + x2) + c) mod 10])
TupleG (fromList [AppG (fromList [EmptyG])])

(26,40)-(26,42)
a1
VarG

(26,40)-(26,42)
x1
VarG

(26,40)-(26,42)
x2
VarG

(26,40)-(26,42)
c
VarG

(26,40)-(26,42)
(@)
VarG

(26,40)-(26,42)
a2 @ [((x1 + x2) + c) mod 10]
AppG (fromList [VarG,ListG EmptyG Nothing])

(26,40)-(26,42)
(x1 + x2) + c
BopG (BopG EmptyG EmptyG) VarG

(26,40)-(26,42)
((x1 + x2) + c) / 10
BopG (BopG EmptyG EmptyG) LitG

(26,40)-(26,42)
x1 + x2
BopG VarG VarG

(26,40)-(26,42)
10
LitG

(26,40)-(26,42)
[((x1 + x2) + c) / 10]
ListG (BopG EmptyG EmptyG) Nothing

(26,59)-(26,61)
c
VarG

*)

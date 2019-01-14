
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

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      let c::c' = a1 in
      let v = (x1 + x2) + c' in (([c + 1] @ [v / 10]), [v mod 10]) in
    let base = ([0], [5]) in
    let args = List.combine l1 l2 in
    let (duh,res) = List.fold_left f base args in (duh, res) in
  add (padZero l1 l2);;


(* fix

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
      let (c,a1::a2) = a in
      let v = (x1 + x2) + c in ((v / 10), ([v / 10] @ ([v mod 10] @ a2))) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(17,11)-(27,21)
l
VarG

(17,11)-(27,21)
l
VarG

(17,11)-(27,21)
h
VarG

(17,11)-(27,21)
removeZero
VarG

(17,11)-(27,21)
t
VarG

(17,11)-(27,21)
l
VarG

(17,11)-(27,21)
fun l ->
  if l = []
  then []
  else (let h :: t = l in
        match h with
        | 0 -> removeZero t
        | _ -> l)
LamG (IteG EmptyG EmptyG EmptyG)

(17,11)-(27,21)
removeZero t
AppG (fromList [VarG])

(17,11)-(27,21)
l = []
BopG VarG (ListG EmptyG Nothing)

(17,11)-(27,21)
let h :: t = l in
match h with
| 0 -> removeZero t
| _ -> l
LetG NonRec (fromList [VarG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(17,11)-(27,21)
if l = []
then []
else (let h :: t = l in
      match h with
      | 0 -> removeZero t
      | _ -> l)
IteG (BopG EmptyG EmptyG) (ListG EmptyG Nothing) (LetG NonRec (fromList [EmptyG]) EmptyG)

(17,11)-(27,21)
match h with
| 0 -> removeZero t
| _ -> l
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG]))])

(17,11)-(27,21)
[]
ListG EmptyG Nothing

(17,11)-(27,21)
[]
ListG EmptyG Nothing

(21,6)-(23,66)
let (c , a1 :: a2) = a in
let v = (x1 + x2) + c in
(v / 10 , [v / 10] @ ([v mod 10] @ a2))
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(23,26)-(23,28)
c
VarG

(23,33)-(23,53)
v
VarG

(23,33)-(23,53)
v / 10
BopG VarG LitG

(23,33)-(23,53)
10
LitG

(23,55)-(23,65)
(@)
VarG

(23,55)-(23,65)
[v mod 10] @ a2
AppG (fromList [VarG,ListG EmptyG Nothing])

(24,4)-(26,60)
a2
VarG

(24,22)-(24,23)
0
LitG

(25,15)-(25,33)
List.rev
VarG

(25,15)-(25,33)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(26,4)-(26,60)
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) VarG

(27,2)-(27,5)
removeZero
VarG

(27,2)-(27,5)
add (padZero l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

*)

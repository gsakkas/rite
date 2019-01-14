
let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let rec clone x n = if n < 1 then [] else cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then (((clone 0 ((-1) * diff)) @ l1), l2)
  else if diff > 0 then (l1, ((clone 0 diff) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | hd::tl -> if hd = 0 then removeZero tl else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = padZero l1 l2 in
    let base = List.combine l1 l2 in
    let args = failwith "to be implemented" in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let rec clone x n = if n < 1 then [] else cloneHelper x n [];;

let addition (x,y) = x + y;;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then (((clone 0 ((-1) * diff)) @ l1), l2)
  else if diff > 0 then (l1, ((clone 0 diff) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | hd::tl -> if hd = 0 then removeZero tl else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (m,n) = x in
      let (y,z) = a in (((addition (m, n)) / 10), [(addition (m, n)) mod 10]) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(7,12)-(11,65)
x
VarG

(7,12)-(11,65)
y
VarG

(7,12)-(11,65)
fun (x , y) -> x + y
LamG (BopG EmptyG EmptyG)

(7,12)-(11,65)
x + y
BopG VarG VarG

(18,27)-(18,29)
let (m , n) = x in
let (y , z) = a in
(addition (m , n) / 10 , [addition (m , n) mod 10])
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(19,4)-(21,51)
x
VarG

(19,4)-(21,51)
a
VarG

(19,4)-(21,51)
addition
VarG

(19,4)-(21,51)
m
VarG

(19,4)-(21,51)
n
VarG

(19,4)-(21,51)
addition
VarG

(19,4)-(21,51)
m
VarG

(19,4)-(21,51)
n
VarG

(19,4)-(21,51)
addition (m , n)
AppG (fromList [TupleG (fromList [EmptyG])])

(19,4)-(21,51)
addition (m , n)
AppG (fromList [TupleG (fromList [EmptyG])])

(19,4)-(21,51)
addition (m , n) / 10
BopG (AppG (fromList [EmptyG])) LitG

(19,4)-(21,51)
addition (m , n) mod 10
BopG (AppG (fromList [EmptyG])) LitG

(19,4)-(21,51)
10
LitG

(19,4)-(21,51)
10
LitG

(19,4)-(21,51)
let (y , z) = a in
(addition (m , n) / 10 , [addition (m , n) mod 10])
LetG NonRec (fromList [VarG]) (TupleG (fromList [EmptyG]))

(19,4)-(21,51)
(addition (m , n) / 10 , [addition (m , n) mod 10])
TupleG (fromList [BopG EmptyG EmptyG,ListG EmptyG Nothing])

(19,4)-(21,51)
(m , n)
TupleG (fromList [VarG])

(19,4)-(21,51)
(m , n)
TupleG (fromList [VarG])

(19,4)-(21,51)
[addition (m , n) mod 10]
ListG (BopG EmptyG EmptyG) Nothing

(19,15)-(19,33)
List.rev
VarG

(19,15)-(19,33)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(19,15)-(19,33)
0
LitG

(19,15)-(19,33)
0
LitG

(19,15)-(19,33)
let args =
  List.rev (List.combine l1
                         l2) in
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(19,15)-(19,33)
(0 , [0])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(19,15)-(19,33)
[0]
ListG LitG Nothing

*)

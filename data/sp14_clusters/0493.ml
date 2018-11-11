
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let ha::_ = a in
      let (a1,a2) = ha in
      let tens = (x1 + x2) + (a1 / 10) in
      let ones = (x1 + x2) + (a1 mod 10) in (tens, ones) :: a in
    let base = [(0, 0)] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      let h::_ = a1 in
      let tens = (x1 + x2) + (h / 10) in
      let ones = (x1 + x2) + (h mod 10) in ((tens :: a1), (ones :: a2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(22,20)-(22,22)
a
VarG

(23,6)-(24,61)
a1
VarG

(23,6)-(24,61)
let h :: _ = a1 in
let tens =
  (x1 + x2) + (h / 10) in
let ones =
  (x1 + x2) + (h mod 10) in
(tens :: a1 , ones :: a2)
LetG NonRec [VarG] (LetG NonRec [EmptyG] EmptyG)

(23,30)-(23,32)
h
VarG

(24,30)-(24,32)
h
VarG

(24,45)-(24,49)
tens :: a1
ConAppG (Just (TupleG [VarG,VarG])) Nothing

(24,51)-(24,55)
a1
VarG

(24,51)-(24,55)
ones :: a2
ConAppG (Just (TupleG [VarG,VarG])) Nothing

(24,60)-(24,61)
a2
VarG

(25,20)-(25,21)
[]
ListG EmptyG Nothing

(26,4)-(27,51)
[]
ListG EmptyG Nothing

*)


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
      let v = (x1 + x2) + c in ((a1 @ [c + 1]), (a2 @ [c + 1])) in
    let base = ([9], [5]) in
    let args = List.combine l1 l2 in
    let (duh,res) = List.fold_left f base args in (duh, res) in
  removeZero (add (padZero l1 l2));;


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
(26,7)-(28,64)
let (c , a1 :: a2) = a in
let v = (x1 + x2) + c in
(v / 10 , [v / 10] @ ([v mod 10] @ a2))
LetG NonRec (fromList [(TuplePatG (fromList [VarPatG,ConsPatG EmptyPatG EmptyPatG]),VarG)]) (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)

(29,17)-(29,20)
0
LitG

(29,23)-(29,24)
0
LitG

(30,16)-(30,34)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(31,5)-(31,61)
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [(TuplePatG (fromList [VarPatG,WildPatG]),AppG (fromList [EmptyG]))]) VarG

*)

(* type error slice
(20,8)-(20,67)
(20,45)-(20,55)
(20,45)-(20,57)
(20,56)-(20,57)
(23,3)-(32,35)
(23,12)-(31,61)
(24,5)-(31,61)
(29,5)-(31,61)
(30,5)-(31,61)
(31,5)-(31,61)
(31,51)-(31,61)
(32,3)-(32,13)
(32,3)-(32,35)
(32,14)-(32,35)
(32,15)-(32,18)
*)

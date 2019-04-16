
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
      let c::c'::c'' = a1 in
      let s::s' = a2 in
      let v = (x1 + x2) + c' in
      (([c + 1] @ [v / 10]), (s' @ ([s + c'] @ [v mod 10]))) in
    let base = ([0; 0], [5]) in
    let args = List.combine l1 l2 in
    let (duh,res) = List.fold_left f base args in (duh, res) in
  add (padZero l1 l2);;

let rec mulByDigit i l =
  match i with | 0 -> [] | 1 -> l | _ -> bigAdd l (mulByDigit (i - 1) l);;


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

let rec mulByDigit i l =
  if i < 1
  then []
  else (match i with | 1 -> l | _ -> bigAdd l (mulByDigit (i - 1) l));;

*)

(* changed spans
(21,7)-(25,61)
let (c , a1 :: a2) = a in
let v = (x1 + x2) + c in
(v / 10 , [v / 10] @ ([v mod 10] @ a2))
LetG NonRec (fromList [(TuplePatG (fromList [VarPatG,ConsPatG EmptyPatG EmptyPatG]),VarG)]) (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)

(26,17)-(26,23)
0
LitG

(26,26)-(26,27)
0
LitG

(27,16)-(27,34)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(28,5)-(28,61)
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [(TuplePatG (fromList [VarPatG,WildPatG]),AppG (fromList [EmptyG]))]) VarG

(29,3)-(29,22)
removeZero (add (padZero l1
                         l2))
AppG (fromList [AppG (fromList [EmptyG])])

(32,3)-(32,73)
if i < 1
then []
else (match i with
      | 1 -> l
      | _ -> bigAdd l
                    (mulByDigit (i - 1) l))
IteG (BopG EmptyG EmptyG) (ListG (fromList [])) (CaseG EmptyG (fromList [(LitPatG,Nothing,EmptyG),(WildPatG,Nothing,EmptyG)]))

*)

(* type error slice
(17,4)-(29,24)
(17,12)-(29,22)
(17,15)-(29,22)
(18,3)-(29,22)
(18,12)-(28,61)
(19,5)-(28,61)
(26,5)-(28,61)
(27,5)-(28,61)
(28,5)-(28,61)
(28,51)-(28,61)
(29,3)-(29,6)
(29,3)-(29,22)
(32,3)-(32,73)
(32,23)-(32,25)
(32,42)-(32,48)
(32,42)-(32,73)
*)

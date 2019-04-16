
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

let bigMul l1 l2 =
  let f a x = (0, (bigAdd (mulByDigit x l2) a)) in
  let base = (0, [0]) in
  let args = l1 in let (_,res) = List.fold_left f base args in res;;


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
  else
    (match i with
     | 1 -> l
     | 10 -> l @ [0]
     | _ -> bigAdd l (mulByDigit (i - 1) l));;

let bigMul l1 l2 =
  let f a x =
    let (c,a') = a in
    let m = mulByDigit x l2 in let s = bigAdd m a' in ((c + 1), s) in
  let base = (0, [0]) in
  let args = l1 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(34,8)-(34,70)
match i with
| 1 -> l
| 10 -> l @ [0]
| _ -> bigAdd l
              (mulByDigit (i - 1) l)
CaseG VarG (fromList [(LitPatG,Nothing,VarG),(LitPatG,Nothing,AppG (fromList [EmptyG])),(WildPatG,Nothing,AppG (fromList [EmptyG]))])

(37,15)-(37,48)
let (c , a') = a in
let m = mulByDigit x l2 in
let s = bigAdd m a' in
(c + 1 , s)
LetG NonRec (fromList [(TuplePatG (fromList [VarPatG]),VarG)]) (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)

*)

(* type error slice
(5,4)-(13,44)
(5,13)-(13,42)
(13,11)-(13,37)
(13,32)-(13,33)
(13,34)-(13,36)
(20,4)-(29,37)
(20,12)-(29,35)
(29,19)-(29,34)
(29,20)-(29,27)
(29,28)-(29,30)
(34,38)-(34,44)
(34,38)-(34,69)
(34,47)-(34,69)
(34,48)-(34,58)
(37,3)-(39,67)
(37,9)-(37,48)
(37,11)-(37,48)
(37,15)-(37,48)
(37,19)-(37,47)
(37,20)-(37,26)
(37,27)-(37,44)
(37,28)-(37,38)
(37,45)-(37,46)
(39,34)-(39,48)
(39,34)-(39,60)
(39,49)-(39,50)
*)

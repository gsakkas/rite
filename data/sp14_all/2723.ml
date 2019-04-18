
let rec clone x n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (clone x (n - 1)) @ [x]);;

let padZero l1 l2 =
  let num1 = (List.length l2) - (List.length l1) in
  let num2 = (List.length l1) - (List.length l2) in
  (((clone 0 num1) @ l1), ((clone 0 num2) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let rec intlist x = if x < 10 then x else [intlist (x / 10); x mod 10] in
      match x with
      | (z,y) ->
          (match a with
           | h -> let sum = (h + z) + y in intlist sum
           | h::t -> let sum = (h + z) + y in (intlist sum) :: t) in
    let base = [] in
    let args = List.combine l1 l2 in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (clone x (n - 1)) @ [x]);;

let padZero l1 l2 =
  let num1 = (List.length l2) - (List.length l1) in
  let num2 = (List.length l1) - (List.length l2) in
  (((clone 0 num1) @ l1), ((clone 0 num2) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let rec intlist x =
        if x < 10 then [x] else (intlist (x / 10)) @ [x mod 10] in
      match x with
      | (z,y) ->
          (match a with
           | [] -> let sum = z + y in intlist sum
           | h::t -> let sum = (h + z) + y in (intlist sum) @ t) in
    let base = [] in
    let args = List.combine l1 l2 in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,42)-(18,43)
[x]
ListG (fromList [VarG])

(18,49)-(18,77)
intlist (x / 10) @ [x mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

(21,11)-(23,66)
match a with
| [] -> (let sum = z + y in
         intlist sum)
| h :: t -> (let sum =
               (h + z) + y in
             intlist sum @ t)
CaseG (fromList [(ConsPatG VarPatG VarPatG,Nothing,LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG),(ConPatG Nothing,Nothing,LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)])

(22,29)-(22,36)
z
VarG

(23,47)-(23,65)
intlist sum @ t
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* type error slice
(17,5)-(26,48)
(17,11)-(23,66)
(18,27)-(18,77)
(18,30)-(18,31)
(18,30)-(18,36)
(18,34)-(18,36)
(18,42)-(18,43)
(18,49)-(18,77)
(21,11)-(23,66)
(21,18)-(21,19)
(22,19)-(22,55)
(22,29)-(22,36)
(22,30)-(22,31)
(22,44)-(22,51)
(22,44)-(22,55)
(23,22)-(23,65)
(23,47)-(23,60)
(23,47)-(23,65)
(23,48)-(23,55)
(24,5)-(26,48)
(24,16)-(24,18)
(26,15)-(26,29)
(26,15)-(26,41)
(26,30)-(26,31)
(26,32)-(26,36)
*)

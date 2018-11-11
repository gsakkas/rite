
let rec padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 = length2
  then (l1, l2)
  else
    if length1 < length2 then padZero (0 :: l1) l2 else padZero l1 (0 :: l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (eFromList1,eFromList2) = x in
      let (cin,result) = a in
      let sum = (eFromList1 + eFromList2) + cin in
      let tens = sum / 10 in
      let ones = sum mod 10 in (tens, (ones :: result)) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with
  | 0 -> []
  | 1 -> l
  | _ -> bigAdd ((bigAdd l l) (mulByDigit (i - 2) l));;


(* fix

let rec padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 = length2
  then (l1, l2)
  else
    if length1 < length2 then padZero (0 :: l1) l2 else padZero l1 (0 :: l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (eFromList1,eFromList2) = x in
      let (cin,result) = a in
      let sum = (eFromList1 + eFromList2) + cin in
      let tens = sum / 10 in
      let ones = sum mod 10 in (tens, (ones :: result)) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0
  then []
  else if i = 1 then l else bigAdd (bigAdd l l) (mulByDigit (i - 2) l);;

*)

(* changed spans
(27,2)-(30,53)
if i = 0
then []
else if i = 1
     then l
     else bigAdd (bigAdd l l)
                 (mulByDigit (i - 2) l)
IteG (BopG EmptyG EmptyG) (ListG EmptyG Nothing) (IteG EmptyG EmptyG EmptyG)

(27,8)-(27,9)
i = 0
BopG VarG LitG

(28,9)-(28,11)
0
LitG

(29,9)-(29,10)
i
VarG

(29,9)-(29,10)
i = 1
BopG VarG LitG

(29,9)-(29,10)
1
LitG

(29,9)-(29,10)
if i = 1
then l
else bigAdd (bigAdd l l)
            (mulByDigit (i - 2) l)
IteG (BopG EmptyG EmptyG) VarG (AppG [EmptyG,EmptyG])

(30,9)-(30,53)
bigAdd (bigAdd l l)
       (mulByDigit (i - 2) l)
AppG [AppG [EmptyG,EmptyG],AppG [EmptyG,EmptyG]]

*)


let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 < s2
  then (((clone 0 (s2 - s1)) @ l1), l2)
  else if s2 < s1 then (l1, ((clone 0 (s1 - s2)) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h != 0 then h :: t else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | [] -> [] in
    let base = [] in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 < s2
  then (((clone 0 (s2 - s1)) @ l1), l2)
  else if s2 < s1 then (l1, ((clone 0 (s1 - s2)) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h != 0 then h :: t else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match snd a with
      | [] ->
          (((fst x) + (snd x)),
            [((fst x) + (snd x)) / 10; ((fst x) + (snd x)) mod 10])
      | h::t -> (0, []) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,17)-(16,40)
match snd a with
| [] -> (fst x + snd x , [(fst x + snd x) / 10 ; (fst x + snd x) mod 10])
| h :: t -> (0 , [])
CaseG (AppG [EmptyG]) [(ConsPatG EmptyPatG EmptyPatG,Nothing,TupleG [EmptyG,EmptyG]),(ConPatG Nothing,Nothing,TupleG [EmptyG,EmptyG])]

(16,23)-(16,24)
snd a
AppG [VarG]

(16,38)-(16,40)
(fst x + snd x , [(fst x + snd x) / 10 ; (fst x + snd x) mod 10])
TupleG [BopG EmptyG EmptyG,ListG [EmptyG,EmptyG]]

(17,16)-(17,18)
(0 , [])
TupleG [LitG,ListG []]

*)

(* type error slice
(16,5)-(19,52)
(16,11)-(16,40)
(16,13)-(16,40)
(16,17)-(16,40)
(16,23)-(16,24)
(18,5)-(19,52)
(18,16)-(18,28)
(18,16)-(18,56)
(19,19)-(19,33)
(19,19)-(19,45)
(19,34)-(19,35)
(19,41)-(19,45)
*)

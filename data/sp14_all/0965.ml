
let rec clone x n =
  let rec aux acc n =
    if n <= 0 then acc else aux (List.append [x] acc) (n - 1) in
  aux [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 < len2
  then ((List.append (clone 0 (len2 - len1)) l1), l2)
  else (l1, (List.append (clone 0 (len1 - len2)) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (n1,n2) = x in
      let (cin,l) = a in
      let result = (n1 + n2) + cin in
      let cout = result / 10 in
      let r = result mod 10 in
      match l with | [] -> [] | h::t -> (cout, (List.append [r] l)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec aux acc n =
    if n <= 0 then acc else aux (List.append [x] acc) (n - 1) in
  aux [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 < len2
  then ((List.append (clone 0 (len2 - len1)) l1), l2)
  else (l1, (List.append (clone 0 (len1 - len2)) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (n1,n2) = x in
      let (cin,l) = a in
      let result = (n1 + n2) + cin in
      let cout = result / 10 in
      let r = result mod 10 in
      match l with
      | [] -> (cout, (List.append [r] []))
      | h::t -> (cout, (List.append [r] l)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(25,28)-(25,30)
(cout , List.append [r] [])
TupleG [VarG,AppG [EmptyG,EmptyG]]

*)

(* type error slice
(19,5)-(28,52)
(19,11)-(25,68)
(19,13)-(25,68)
(20,7)-(25,68)
(21,7)-(25,68)
(21,21)-(21,22)
(22,7)-(25,68)
(23,7)-(25,68)
(24,7)-(25,68)
(25,7)-(25,68)
(25,28)-(25,30)
(25,41)-(25,68)
(28,19)-(28,33)
(28,19)-(28,45)
(28,34)-(28,35)
*)

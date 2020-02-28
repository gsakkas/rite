
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
      match c with
      | [] -> ((a1 @ [(x1 + x2) / 10]), (a2 @ [(x1 + x2) mod 10]))
      | _ -> ((a1 @ [((x1 + x2) + c) / 10]), (a2 @ [((x1 + x2) + c) mod 10])) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

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
      match c with
      | 0 -> ((a1 @ [(x1 + x2) / 10]), (a2 @ [(x1 + x2) mod 10]))
      | _ -> ((a1 @ [((x1 + x2) + c) / 10]), (a2 @ [((x1 + x2) + c) mod 10])) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(28,7)-(30,78)
match c with
| 0 -> (a1 @ [(x1 + x2) / 10] , a2 @ [(x1 + x2) mod 10])
| _ -> (a1 @ [((x1 + x2) + c) / 10] , a2 @ [((x1 + x2) + c) mod 10])
CaseG VarG [(LitPatG,Nothing,TupleG [EmptyG,EmptyG]),(WildPatG,Nothing,TupleG [EmptyG,EmptyG])]

*)

(* type error slice
(27,7)-(30,78)
(27,19)-(27,21)
(28,7)-(30,78)
(28,13)-(28,14)
(29,16)-(29,39)
(29,17)-(29,19)
(29,20)-(29,21)
(29,22)-(29,38)
(29,23)-(29,37)
*)


let rec clone x n = if n > 0 then [x] @ (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let x l = List.map string_of_int;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = x + a in
    let base = x in
    let args = (l1, l2) in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then [x] @ (clone x (n - 1)) else [];;

let rec addHelper (t,u) =
  match List.rev t with
  | [] -> []
  | h::t ->
      (match List.rev u with
       | [] -> []
       | h'::t' ->
           if (h + h') > 10
           then (addHelper (t, t')) @ [(1 + h') + h]
           else (addHelper (t, t')) @ [h' + h]);;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = addHelper (a, x) in
    let base = [] in let args = [] in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,17)-(18,22)
addHelper (a , x)
AppG [TupleG [EmptyG,EmptyG]]

(19,16)-(19,17)
[]
ListG []

(20,16)-(20,24)
[]
ListG []

(20,28)-(20,75)
List.fold_left f base args
AppG [VarG,VarG,VarG]

*)

(* type error slice
(14,4)-(14,35)
(14,7)-(14,33)
(18,5)-(20,75)
(18,11)-(18,22)
(18,17)-(18,22)
(18,21)-(18,22)
(19,5)-(20,75)
(19,16)-(19,17)
(20,42)-(20,56)
(20,42)-(20,68)
(20,57)-(20,58)
(20,59)-(20,63)
*)

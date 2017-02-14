
let rec clone x n = if n > 0 then [x] @ (clone x (n - 1)) else [];;

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
    let f a x = x + a in
    let base = [] in
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
(4,13)-(9,43)
(5,3)-(9,43)
(6,3)-(9,43)
(12,40)-(12,41)
(12,40)-(12,45)
(12,44)-(12,45)
(12,51)-(12,61)
(12,51)-(12,63)
(12,62)-(12,63)
(12,69)-(12,70)
(14,15)-(19,33)
(15,3)-(19,33)
(15,12)-(18,75)
(16,5)-(18,75)
(16,11)-(16,22)
(16,13)-(16,22)
(16,17)-(16,18)
(16,17)-(16,22)
(16,21)-(16,22)
(17,5)-(18,75)
(17,16)-(17,18)
(18,5)-(18,75)
(18,17)-(18,19)
(18,17)-(18,23)
(18,21)-(18,23)
(18,28)-(18,75)
(18,42)-(18,56)
(18,42)-(18,68)
(18,57)-(18,58)
(18,59)-(18,63)
(18,64)-(18,68)
(18,72)-(18,75)
(19,3)-(19,13)
(19,3)-(19,33)
(19,15)-(19,18)
(19,15)-(19,33)
(19,20)-(19,27)
(19,20)-(19,33)
(19,28)-(19,30)
(19,31)-(19,33)
*)

(* type error slice
(16,5)-(18,75)
(16,11)-(16,22)
(16,17)-(16,22)
(16,21)-(16,22)
(17,5)-(18,75)
(17,16)-(17,18)
(18,42)-(18,56)
(18,42)-(18,68)
(18,57)-(18,58)
(18,59)-(18,63)
*)

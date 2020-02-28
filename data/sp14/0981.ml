
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then
    let x = (List.length l1) - (List.length l2) in
    let list_p = clone 0 x in (l1, (list_p @ l2))
  else
    if (List.length l1) < (List.length l2)
    then
      (let x = (List.length l2) - (List.length l1) in
       let list_p = clone 0 x in ((list_p @ l1), l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,listy) = a in
      let (num1,num2) = x in
      let initsum = (num1 + num2) + carry in
      if initsum > 9
      then (1, (listy @ [initsum mod 10]))
      else (0, (listy @ initsum)) in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then
    let x = (List.length l1) - (List.length l2) in
    let list_p = clone 0 x in (l1, (list_p @ l2))
  else
    if (List.length l1) < (List.length l2)
    then
      (let x = (List.length l2) - (List.length l1) in
       let list_p = clone 0 x in ((list_p @ l1), l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,listy) = a in
      let (num1,num2) = x in
      let initsum = (num1 + num2) + carry in
      if initsum > 9
      then (1, (listy @ [initsum mod 10]))
      else (0, (listy @ [initsum])) in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(27,25)-(27,32)
[initsum]
ListG [VarG]

*)

(* type error slice
(24,7)-(27,34)
(24,21)-(24,42)
(27,16)-(27,33)
(27,23)-(27,24)
(27,25)-(27,32)
*)

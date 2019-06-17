
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) > (List.length l2)
    then
      (let y = (clone 0 ((List.length l1) - (List.length l2))) @ l2 in
       (l1, y))
    else
      (let z = (clone 0 ((List.length l2) - (List.length l1))) @ l1 in
       (z, l2));;

let rec removeZero l = failwith "to be implemented";;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (d1,d2) ->
          (match a with
           | (carry,result) ->
               if ((d1 + d2) + carry) > 9
               then (1, ((((d1 + d2) + 1) - 10) :: result))
               else (0, ((d1 + d2) :: result))) in
    let base = (0, []) in
    let args = List.combine ((List.rev l1), (List.rev l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) > (List.length l2)
    then
      (let y = (clone 0 ((List.length l1) - (List.length l2))) @ l2 in
       (l1, y))
    else
      (let z = (clone 0 ((List.length l2) - (List.length l1))) @ l1 in
       (z, l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (d1,d2) ->
          (match a with
           | (carry,result) ->
               if ((d1 + d2) + carry) > 9
               then (1, ((((d1 + d2) + 1) - 10) :: result))
               else (0, ((d1 + d2) :: result))) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,24)-(16,52)
match l with
| [] -> []
| h :: t -> if h = 0
            then removeZero t
            else l
CaseG VarG [(ConPatG Nothing,Nothing,ListG []),(ConsPatG EmptyPatG EmptyPatG,Nothing,IteG EmptyG EmptyG EmptyG)]

(29,16)-(29,59)
List.combine (List.rev l1)
             (List.rev l2)
AppG [AppG [EmptyG],AppG [EmptyG]]

*)

(* type error slice
(29,16)-(29,28)
(29,16)-(29,59)
(29,29)-(29,59)
*)

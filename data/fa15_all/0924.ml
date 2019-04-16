
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone 0 ((List.length l2) - (List.length l1))) @ l1
  else (clone 0 ((List.length l1) - (List.length l2))) @ l2;;

let rec removeZero l =
  let f a x =
    if (List.length a) = 0 then (if x = 0 then [] else [x]) else a @ [x] in
  let base = [] in List.fold_left f base l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (l1e,l2e) ->
          (match a with
           | (carry,list) ->
               let num = (l1e + l2e) + carry in
               if num < 10
               then (0, (list @ [num]))
               else
                 if num = 10
                 then (1, (list @ [0]))
                 else ((num / 10), ([num mod 10] @ list))) in
    let base = (0, []) in
    let args = List.combine List.rev l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero
    (add
       ((padZero l1 l2),
         (if (List.length l1) > (List.length l2) then l1 else l2)));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone 0 ((List.length l2) - (List.length l1))) @ l1
  else (clone 0 ((List.length l1) - (List.length l2))) @ l2;;

let rec removeZero l =
  let f a x =
    if (List.length a) = 0 then (if x = 0 then [] else [x]) else a @ [x] in
  let base = [] in List.fold_left f base l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (l1e,l2e) ->
          (match a with
           | (carry,list) ->
               let num = (l1e + l2e) + carry in
               if num < 10
               then (0, (list @ [num]))
               else
                 if num = 10
                 then (1, (list @ [0]))
                 else ((num / 10), ([num mod 10] @ list))) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero
    (add
       ((padZero l1 l2),
         (if (List.length l1) > (List.length l2) then l1 else l2)));;

*)

(* changed spans
(29,16)-(29,43)
List.combine (List.rev l1) l2
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* type error slice
(29,16)-(29,28)
(29,16)-(29,43)
*)

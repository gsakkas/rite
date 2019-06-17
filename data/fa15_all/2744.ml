
let rec clone x n = if n > 0 then [x] @ (clone x (n - 1)) else [];;

let carry y = y / 10;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let remain x = x mod 10;;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (x1,x2) ->
          (match a with
           | (car,cur) ->
               (match cur with
                | [] ->
                    if ((car + x1) + x2) > 10
                    then
                      ((car + 1), ([car + 1] @ [((remain car) + x1) + x2]))
                    else (0, ([car] @ [(car + x1) + x2]))
                | h::t ->
                    if ((x1 + x2) + h) < 10
                    then (0, ([0] @ ([(x1 + x2) + h] @ t)))
                    else
                      ((car + 1),
                        ([((carry h) + x1) + x2] @
                           ([((remain h) + x1) + x2] @ t))))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then [x] @ (clone x (n - 1)) else [];;

let carry y = y / 10;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let remain x = x mod 10;;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (x1,x2) ->
          (match a with
           | (car,cur) ->
               (match cur with
                | [] ->
                    if ((car + x1) + x2) > 10
                    then
                      ((car + 1), ([car + 1] @ [((remain car) + x1) + x2]))
                    else (0, ([car] @ [(car + x1) + x2]))
                | h::t ->
                    if ((x1 + x2) + h) < 10
                    then (0, ([0] @ ([(x1 + x2) + h] @ t)))
                    else
                      ((car + 1),
                        ([((carry h) + x1) + x2] @
                           ([((remain h) + x1) + x2] @ t))))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(39,49)-(39,75)
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec [(TuplePatG (fromList [EmptyPatG]),AppG [EmptyG,EmptyG,EmptyG])] VarG

*)

(* type error slice
(16,3)-(16,70)
(16,51)-(16,61)
(16,51)-(16,63)
(16,62)-(16,63)
(19,3)-(40,35)
(19,12)-(39,75)
(20,5)-(39,75)
(20,11)-(37,62)
(23,11)-(37,62)
(23,18)-(23,19)
(38,5)-(39,75)
(39,5)-(39,75)
(39,49)-(39,63)
(39,49)-(39,75)
(39,64)-(39,65)
(40,3)-(40,13)
(40,3)-(40,35)
(40,14)-(40,35)
(40,15)-(40,18)
*)

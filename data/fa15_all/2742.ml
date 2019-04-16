
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
    let base = [] in
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
(27,17)-(27,33)
match x with
| (x1 , x2) -> match a with
               | (car , cur) -> match cur with
                                | [] -> if ((car + x1) + x2) > 10
                                        then (car + 1 , [car + 1] @ [(remain car + x1) + x2])
                                        else (0 , [car] @ [(car + x1) + x2])
                                | h :: t -> if ((x1 + x2) + h) < 10
                                            then (0 , [0] @ ([(x1 + x2) + h] @ t))
                                            else (car + 1 , [(carry h + x1) + x2] @ ([(remain h + x1) + x2] @ t))
CaseG VarG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,CaseG EmptyG (fromList [(TuplePatG (fromList [EmptyPatG]),Nothing,EmptyG)]))])

(28,16)-(28,18)
(0 , [])
TupleG (fromList [LitG,ListG (fromList [])])

(29,49)-(29,75)
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [(TuplePatG (fromList [VarPatG,WildPatG]),AppG (fromList [EmptyG]))]) VarG

*)

(* type error slice
(8,7)-(13,48)
(12,17)-(12,36)
(12,18)-(12,27)
(12,28)-(12,35)
(12,32)-(12,34)
(27,5)-(29,75)
(27,11)-(27,33)
(27,13)-(27,33)
(27,17)-(27,26)
(27,17)-(27,33)
(27,27)-(27,33)
(27,31)-(27,32)
(29,5)-(29,75)
(29,16)-(29,24)
(29,16)-(29,45)
(29,25)-(29,45)
(29,26)-(29,38)
(29,49)-(29,63)
(29,49)-(29,75)
(29,64)-(29,65)
(29,71)-(29,75)
*)

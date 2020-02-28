
let bigMul l1 l2 =
  let f a x = x in
  let base = ([], [0]) in
  let args =
    let rec helper acc l1 l2 =
      match l1 with
      | [] -> acc
      | h::t -> helper ((h, l2) :: acc) (List.map (fun x  -> x * 10) t) l2 in
    helper [] (List.rev l1) l2 in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (v1,v2) ->
          (match a with
           | (list1,list2) ->
               (match list1 with
                | [] ->
                    ((((v1 + v2) / 10) :: list1), (((v1 + v2) mod 10) ::
                      list2))
                | h::t ->
                    (((((v1 + v2) + h) / 10) :: list1),
                      ((((v1 + v2) + h) mod 10) :: list2)))) in
    let base = ([], []) in
    let args = List.append (List.rev (List.combine l1 l2)) [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      bigAdd (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t)))
        (helper [] (h * i));;

let bigMul l1 l2 =
  let f a x =
    match x with
    | (k,v) -> (match a with | (c,d) -> (c, (bigAdd d (mulByDigit k v)))) in
  let base = ([], [0]) in
  let args =
    let rec helper acc l1 l2 =
      match l1 with
      | [] -> acc
      | h::t -> helper ((h, l2) :: acc) (List.map (fun x  -> x * 10) t) l2 in
    helper [] (List.rev l1) l2 in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(3,15)-(3,16)
match x with
| (k , v) -> match a with
             | (c , d) -> (c , bigAdd d
                                      (mulByDigit k v))
CaseG VarG [(TuplePatG (fromList [EmptyPatG]),Nothing,CaseG EmptyG [(EmptyPatG,Nothing,EmptyG)])]

*)

(* type error slice
(3,3)-(11,50)
(3,9)-(3,16)
(3,11)-(3,16)
(3,15)-(3,16)
(4,3)-(11,50)
(4,14)-(4,23)
(4,15)-(4,17)
(5,3)-(11,50)
(6,5)-(10,31)
(7,7)-(9,75)
(8,15)-(8,18)
(9,17)-(9,23)
(9,17)-(9,75)
(9,24)-(9,40)
(9,25)-(9,32)
(9,26)-(9,27)
(9,36)-(9,39)
(9,41)-(9,72)
(9,42)-(9,50)
(9,51)-(9,69)
(9,62)-(9,63)
(9,62)-(9,68)
(9,70)-(9,71)
(10,5)-(10,11)
(10,5)-(10,31)
(11,17)-(11,31)
(11,17)-(11,43)
(11,32)-(11,33)
(11,34)-(11,38)
(11,39)-(11,43)
*)

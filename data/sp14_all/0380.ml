
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  if lenl1 > lenl2
  then (l1, ((clone 0 (lenl1 - lenl2)) @ l2))
  else (((clone 0 (lenl2 - lenl1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (rem,acc) = a in
      let (el1,el2) = x in
      let new_sum = (rem + el1) + el2 in
      let new_rem = if new_sum > 9 then 1 else 0 in
      let norm_sum = if new_sum > 9 then new_sum - 10 else new_sum in
      let larger = if (List.length l1) > (List.length l2) then l1 else l2 in
      if (List.length acc) = ((List.length larger) - 1)
      then
        (if rem = 1
         then (0, ([1; norm_sum] @ acc))
         else (0, (norm_sum :: acc)))
      else (new_rem, (norm_sum :: acc)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> l | _ -> bigAdd ((mulByDigit i) - 1) l;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  if lenl1 > lenl2
  then (l1, ((clone 0 (lenl1 - lenl2)) @ l2))
  else (((clone 0 (lenl2 - lenl1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (rem,acc) = a in
      let (el1,el2) = x in
      let new_sum = (rem + el1) + el2 in
      let new_rem = if new_sum > 9 then 1 else 0 in
      let norm_sum = if new_sum > 9 then new_sum - 10 else new_sum in
      let larger = if (List.length l1) > (List.length l2) then l1 else l2 in
      if (List.length acc) = ((List.length larger) - 1)
      then
        (if rem = 1
         then (0, ([1; norm_sum] @ acc))
         else (0, (norm_sum :: acc)))
      else (new_rem, (norm_sum :: acc)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 1 -> l | _ -> bigAdd (mulByDigit (i - 1) l) l;;

*)

(* changed spans
(35,3)-(35,61)
match i with
| 1 -> l
| _ -> bigAdd (mulByDigit (i - 1)
                          l) l
CaseG (fromList [(LitPatG,Nothing,VarG),(WildPatG,Nothing,AppG (fromList [EmptyG]))])

(35,39)-(35,59)
mulByDigit (i - 1) l
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)

(* type error slice
(4,4)-(9,48)
(4,13)-(9,46)
(9,9)-(9,41)
(9,36)-(9,37)
(9,38)-(9,40)
(14,4)-(32,37)
(14,12)-(32,35)
(32,19)-(32,34)
(32,20)-(32,27)
(32,28)-(32,30)
(34,4)-(35,63)
(34,20)-(35,61)
(34,22)-(35,61)
(35,32)-(35,38)
(35,32)-(35,61)
(35,39)-(35,59)
(35,40)-(35,54)
(35,41)-(35,51)
*)

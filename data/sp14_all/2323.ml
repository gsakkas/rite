
let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (h::t,b) = a in
      if (x + h) > 9
      then
        let asd2 = (x + h) - 10 in
        let h2::t2 = t in let asd3 = (h2 + 1) :: t2 in (asd3, (asd2 :: b))
      else
        if (t = []) && ((x + h) > 9)
        then (let asd2 = (x + h) - 10 in ([], (1 :: asd2 :: b)))
        else (t, ((x + h) :: b)) in
    let base = (((List.rev 0) :: l1), []) in
    let args = List.rev l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (h::t,b) = a in
      if (x + h) > 9
      then
        let asd2 = (x + h) - 10 in
        let h2::t2 = t in let asd3 = (h2 + 1) :: t2 in (asd3, (asd2 :: b))
      else
        if (t = []) && ((x + h) > 9)
        then (let asd2 = (x + h) - 10 in ([], (1 :: asd2 :: b)))
        else (t, ((x + h) :: b)) in
    let base = ((List.rev (0 :: l1)), []) in
    let args = List.rev l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(29,27)-(29,28)
0 :: l1
ConAppG (Just (TupleG (fromList [VarG,LitG]))) Nothing

*)

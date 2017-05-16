
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let a = List.length l1 in
  let b = List.length l2 in
  if a = b
  then (l1, l2)
  else
    if a < b
    then (((clone 0 (b - a)) @ l1), l2)
    else (l1, ((clone 0 (a - b)) @ l2));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then padZero (0 :: l1) l2
    else padZero l1 (0 :: l2);;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then padZero (0 :: l1) l2
    else padZero l1 (0 :: l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let c = (fst x) + (snd x) in
      match a with
      | h::t -> ((h + c) / 10) :: (h + (c mod 10)) :: t
      | _ -> [c / 10; c mod 10] in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

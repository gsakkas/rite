
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l = match l with | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match (a, x) with
      | ((h::i,j::k),(d::e,f::g)) -> ((f + d) / 10) :: ((h + j) mod 10) in
    let base = (0, 0) in
    let args =
      List.rev
        (List.combine (List.map (fun x  -> [x]) l1)
           (List.map (fun x  -> [x]) l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

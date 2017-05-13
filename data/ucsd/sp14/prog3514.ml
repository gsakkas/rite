
let rec clone x n =
  let rec helper acc x n =
    if n <= 0 then acc else helper (x :: acc) x (n - 1) in
  helper [] x n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 < len2
  then ((List.append (clone 0 (len2 - len1)) l1), l2)
  else (l1, (List.append (clone 0 (len1 - len2)) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | x::xs' -> (match x with | 0 -> removeZero xs' | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (([],r),acc) -> failwith "should never reach here"
      | ((h::[],r),acc) -> (([], 0), (r :: acc))
      | ((h::t,r),acc) ->
          let sum = (h + x) + r in ((t, (sum / 10)), ((sum mod 10) :: acc)) in
    let (pad1,pad2) = padZero l1 l2 in
    let base = ((List.rev pad1), []) in
    let args = List.rev pad2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

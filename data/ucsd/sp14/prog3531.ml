
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
      | (_,acc) ->
          let (padded1,padded2) = padZero acc x in
          let rec helper acc2 r lst1 lst2 =
            match lst1 with
            | [] -> (match r with | 0 -> acc2 | _ -> List.append acc2 [r])
            | h1::t1 ->
                (match lst2 with
                 | [] -> failwith "Should never reach here!"
                 | h2::t2 ->
                     let sum = (h1 + h2) + r in
                     helper ((sum mod 10) :: acc2) (sum / 10) t1 t2) in
          (0, (helper [] 0 padded1 padded2)) in
    let base = [] in
    let args = [[l1]; [l2]] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

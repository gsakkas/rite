
let bigMul l1 l2 =
  let f a x =
    match x with | (k,v) -> (match a with | (c,d) -> ((v :: c), (k :: d))) in
  let base = ([], []) in
  let args =
    let rec helper acc l1 l2 =
      match l1 with
      | [] -> acc
      | h::t -> helper ((h, l2) :: acc) (List.map (fun x  -> x * 10) t) l2 in
    helper [] (List.rev l1) l2 in
  let (_,res) = List.fold_left f base args in res;;

let bigMul l1 l2 =
  let f a x =
    match x with
    | (k,v) -> (match a with | (c,d) -> ((v :: c), ((bigMul k v) :: d))) in
  let base = ([], []) in
  let args =
    let rec helper acc l1 l2 =
      match l1 with
      | [] -> acc
      | h::t -> helper ((h, l2) :: acc) (List.map (fun x  -> x * 10) t) l2 in
    helper [] (List.rev l1) l2 in
  let (_,res) = List.fold_left f base args in res;;


let rec clone x n =
  let rec aux acc n =
    if n <= 0 then acc else aux (List.append [x] acc) (n - 1) in
  aux [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 < len2
  then ((List.append (clone 0 (len2 - len1)) l1), l2)
  else (l1, (List.append (clone 0 (len1 - len2)) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (n1,n2) = x in
      let (cin,l) = a in
      let result = (n1 + n2) + cin in
      let cout = result / 10 in
      let r = result mod 10 in
      match l with
      | [] -> (cout, (List.append [cout] (List.append [r] [])))
      | h::t -> (cout, (List.append [cout] (List.append [r] t))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec aux acc n =
    match n with | 0 -> acc | _ -> aux (bigAdd acc l) (n - 1) in
  aux [0] i;;

let bigMul l1 l2 =
  let f a x =
    let (l,i) = x in
    let (m,s) = a in
    let result = bigAdd s ((mulByDigit i l) * m) in ((m * 10), result) in
  let base = (1, []) in
  let args =
    let rec helper acc l1 l2 =
      match l2 with
      | [] -> acc
      | h::t -> helper (List.append [(l1, h)] acc) l1 t in
    helper [] l1 l2 in
  let (_,res) = List.fold_left f base args in res;;

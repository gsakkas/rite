
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
      match l with | [] -> [] | h::t -> (cout, (List.append [r] l)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

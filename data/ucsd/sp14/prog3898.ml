
let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a + 1 in
    let base = 5 in
    let args = [0] in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

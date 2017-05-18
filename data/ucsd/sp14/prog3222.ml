
let rec foo acc t1 t2 =
  match t2 with | [] -> acc | h::t -> foo (List.append [(t1, h)] acc) t;;


let _ =
  let rec append x y = match y with | [] -> x | h::t -> x :: h in append x t;;

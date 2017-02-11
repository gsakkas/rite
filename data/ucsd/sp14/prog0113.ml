
let rec backCons xs x =
  match xs with | [] -> [x] | y::ys -> x :: y :: (backCons ys);;

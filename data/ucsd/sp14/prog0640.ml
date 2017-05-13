
let rec backCons xs x =
  match xs with | [] -> x | y::ys -> (backCons ys) :: y :: x;;

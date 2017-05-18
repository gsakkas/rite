
let rec append xs ys =
  match xs with | [] -> ys | h::t -> h :: (append t ys append [1; 2] [3; 4]);;

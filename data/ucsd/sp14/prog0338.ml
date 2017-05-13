
let rec append x y = match y with | [] -> [] | h::t -> (append h) :: (x t);;
